package servlet;

import modelo.ProductoCarrito;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CarritoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<ProductoCarrito> carrito =
        (List<ProductoCarrito>) session.getAttribute("carrito");

        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        String accion = request.getParameter("accion");

        // 🔴 SI ES ELIMINAR
        if ("eliminar".equals(accion)) {

            int id = Integer.parseInt(request.getParameter("id"));

            carrito.removeIf(p -> p.getId() == id);

            session.setAttribute("carrito", carrito);

            response.sendRedirect("carrito.jsp");
            return;
        }

        // 🟢 SI ES AGREGAR
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));

        boolean existe = false;

        for (ProductoCarrito p : carrito) {
            if (p.getId() == id) {
                p.setCantidad(p.getCantidad() + 1);
                existe = true;
            }
        }

        if (!existe) {
            ProductoCarrito nuevo = new ProductoCarrito();
            nuevo.setId(id);
            nuevo.setNombre(nombre);
            nuevo.setPrecio(precio);
            nuevo.setCantidad(1);
            carrito.add(nuevo);
        }

        session.setAttribute("carrito", carrito);

        int totalItems = 0;

        for (ProductoCarrito p : carrito) {
            totalItems += p.getCantidad();
        }

        response.getWriter().print(totalItems);

    }
}