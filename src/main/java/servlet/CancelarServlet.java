package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class CancelarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = dao.Conexion.getConexion();

        try (PreparedStatement ps = con.prepareStatement(
                "UPDATE pedidos SET estado='cancelado' WHERE id=?")) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }


            response.sendRedirect("pedidos.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}