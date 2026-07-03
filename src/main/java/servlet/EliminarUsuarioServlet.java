package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.Conexion;

public class EliminarUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("✅ ENTRO AL ELIMINAR USUARIO");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // ✅ 1. OBTENER ID
            String idStr = request.getParameter("id");

            if (idStr == null || idStr.isEmpty()) {
                throw new Exception("❌ ID no recibido");
            }

            int id = Integer.parseInt(idStr);

            System.out.println("👉 ID usuario a eliminar: " + id);

            // ✅ 2. CONEXIÓN
            con = Conexion.getConexion();

            // ✅ 3. QUERY
            String sql = "DELETE FROM usuarios WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            // ✅ 4. EJECUTAR
            int filas = ps.executeUpdate();

            System.out.println("✅ Filas eliminadas: " + filas);

            if (filas == 0) {
                System.out.println("⚠️ No existe usuario con ese ID");
            }

            // ✅ 5. REDIRECCIÓN
            response.sendRedirect("admin.jsp");

        } catch (NumberFormatException e) {

            System.out.println("❌ ERROR: ID inválido");
            e.printStackTrace();

        } catch (Exception e) {

            System.out.println("❌ ERROR GENERAL EN EL SERVLET");
            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2>Error:</h2><pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");

        } finally {

            // ✅ 6. CERRAR RECURSOS
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}