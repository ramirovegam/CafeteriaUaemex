package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class DetallePedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int pedidoId = Integer.parseInt(request.getParameter("id"));

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter();
             Connection con = dao.Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(
                "SELECT p.nombre, d.cantidad, d.precio " +
                "FROM detalle_pedido d " +
                "JOIN productos p ON d.producto_id = p.id " +
                "WHERE d.pedido_id=?")) {

            ps.setInt(1, pedidoId);

            try (ResultSet rs = ps.executeQuery()) {

                // ✅ HTML
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Detalle del Pedido</title>");
                out.println("<style>");
                out.println("body{font-family:Arial;background:#f2f2f2;margin:0;padding:20px;}");
                out.println("h2{text-align:center;}");
                out.println(".card{background:white;border-radius:15px;padding:15px;margin:10px;box-shadow:0 3px 6px rgba(0,0,0,0.2);}");
                out.println(".item{display:flex;justify-content:space-between;margin:10px 0;}");
                out.println(".total{font-weight:bold;font-size:18px;text-align:end;margin-top:10px;}");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");

                out.println("<h2>🧾 Detalle del Pedido #" + pedidoId + "</h2>");

                double total = 0;

                out.println("<div class='card'>");

                while (rs.next()) {

                    double subtotal = rs.getDouble("precio") * rs.getInt("cantidad");
                    total += subtotal;

                    out.println("<div class='item'>");

                    out.println("<div>");
                    out.println("<p>" + rs.getString("nombre") + "</p>");
                    out.println("<small>Cantidad: " + rs.getInt("cantidad") + "</small>");
                    out.println("</div>");

                    out.println("<div>");
                    out.println("$" + subtotal);
                    out.println("</div>");

                    out.println("</div>");
                }

                out.println("<div class='total'>Total: $" + total + "</div>");
                out.println("</div>");

                out.println("</body>");
                out.println("</html>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
