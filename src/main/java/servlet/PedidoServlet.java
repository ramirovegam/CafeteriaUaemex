package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import modelo.ProductoCarrito;

public class PedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            Connection con = dao.Conexion.getConexion();

            // 🔥 VERIFICAMOS SI VIENE ESTADO (COCINERO)
            String estado = request.getParameter("estado");

            if (estado != null) {

                int id = Integer.parseInt(request.getParameter("id"));

                PreparedStatement ps = con.prepareStatement(
                    "UPDATE pedidos SET estado=? WHERE id=?"
                );

                ps.setString(1, estado);
                ps.setInt(2, id);
                ps.executeUpdate();

                // 🔥 REGRESAR A PANEL COCINERO
                response.sendRedirect("cocinero.jsp");
                return;
            }

            // 🟢 SI NO HAY ESTADO → ES CREAR PEDIDO (ALUMNO)
            List<ProductoCarrito> carrito =
            (List<ProductoCarrito>) session.getAttribute("carrito");

            if (carrito == null || carrito.isEmpty()) {
                response.sendRedirect("carrito.jsp");
                return;
            }

            int usuarioId = 1; // luego puedes hacerlo dinámico

            // ✅ INSERTAR PEDIDO
            PreparedStatement psPedido = con.prepareStatement(
                "INSERT INTO pedidos(usuario_id,total,estado) VALUES (?,?,?)",
                Statement.RETURN_GENERATED_KEYS
            );

            double total = 0;

            for (ProductoCarrito p : carrito) {
                total += p.getPrecio() * p.getCantidad();
            }

            psPedido.setInt(1, usuarioId);
            psPedido.setDouble(2, total);
            psPedido.setString(3, "pendiente");

            psPedido.executeUpdate();

            ResultSet rs = psPedido.getGeneratedKeys();
            rs.next();
            int pedidoId = rs.getInt(1);

            // ✅ INSERTAR DETALLE
            for (ProductoCarrito p : carrito) {

                PreparedStatement psDetalle = con.prepareStatement(
                    "INSERT INTO detalle_pedido(pedido_id, producto_id, cantidad, precio) VALUES (?,?,?,?)"
                );

                psDetalle.setInt(1, pedidoId);
                psDetalle.setInt(2, p.getId());
                psDetalle.setInt(3, p.getCantidad());
                psDetalle.setDouble(4, p.getPrecio());

                psDetalle.executeUpdate();
            }

            // ✅ LIMPIAR CARRITO
            session.removeAttribute("carrito");

            // ✅ REDIRIGIR
            response.sendRedirect("pedidos.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}