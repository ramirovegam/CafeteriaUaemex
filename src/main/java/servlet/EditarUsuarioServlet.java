package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.Conexion;

public class EditarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("✅ ENTRO AL EDITAR USUARIO");

        Connection con = null;
        PreparedStatement ps = null;

        try {

            // ✅ 1. OBTENER DATOS
            String idStr = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");

            // ✅ VALIDACIÓN ID
            if (idStr == null || idStr.isEmpty()) {
                throw new Exception("❌ ID no recibido");
            }

            int id = Integer.parseInt(idStr);

            System.out.println("👉 ID: " + id);

            // ✅ VALIDACIÓN CAMPOS
            if (nombre == null || apellido == null || telefono == null ||
                email == null || password == null || rol == null ||
                nombre.isEmpty() || apellido.isEmpty() ||
                telefono.isEmpty() || email.isEmpty() ||
                password.isEmpty() || rol.isEmpty()) {

                throw new Exception("❌ Campos vacíos");
            }

            // ✅ 2. CONEXIÓN
            con = Conexion.getConexion();

            // ✅ 3. QUERY UPDATE
            String sql = "UPDATE usuarios SET nombre=?, apellido=?, telefono=?, email=?, password=?, rol=? WHERE id=?";

            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, telefono);
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setString(6, rol);
            ps.setInt(7, id);

            // ✅ 4. EJECUTAR
            int filas = ps.executeUpdate();

            System.out.println("✅ Filas actualizadas: " + filas);

            if (filas == 0) {
                System.out.println("⚠️ No se encontró el usuario");
            }

            // ✅ 5. REDIRECCIÓN
            response.sendRedirect("admin.jsp");

        } catch (NumberFormatException e) {

            System.out.println("❌ ERROR: ID inválido");
            e.printStackTrace();

        } catch (Exception e) {

            System.out.println("❌ ERROR EN EDITAR USUARIO");
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