package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.Conexion;

public class EditarProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("✅ ENTRO AL EDITAR PRODUCTO");

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));

            Connection con = Conexion.getConexion();

            String sql = "UPDATE productos SET nombre=?, precio=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, nombre);
            ps.setDouble(2, precio);
            ps.setInt(3, id);

            int filas = ps.executeUpdate();

            System.out.println("✅ Filas actualizadas: " + filas);

            ps.close();
            con.close();

            response.sendRedirect("productoLista.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2>Error:</h2><pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");
        }
    }
}
