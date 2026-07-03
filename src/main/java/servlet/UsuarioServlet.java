package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.Conexion;

public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("✅ ENTRO AL USUARIO SERVLET");

        Connection con = null;
        PreparedStatement ps = null;

        try {

            // ✅ 1. RECIBIR DATOS
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");

            System.out.println("Nombre: " + nombre);
            System.out.println("Email: " + email);

            // ✅ 2. VALIDACIÓN
            if (nombre == null || apellido == null || telefono == null ||
                email == null || password == null || rol == null ||
                nombre.isEmpty() || apellido.isEmpty() || telefono.isEmpty() ||
                email.isEmpty() || password.isEmpty() || rol.isEmpty()) {

                throw new Exception("❌ Campos vacíos");
            }

            // ✅ 3. CONEXIÓN
            con = Conexion.getConexion();

            // ✅ 4. INSERTAR USUARIO
            String sql = "INSERT INTO usuarios(nombre, apellido, telefono, email, password, rol) VALUES (?,?,?,?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, telefono);
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setString(6, rol);

            int filas = ps.executeUpdate();

            System.out.println("✅ Usuario insertado: " + filas);

            // ✅ 5. REDIRECCIÓN
            response.sendRedirect("admin.jsp");

        } catch (Exception e) {

            System.out.println("❌ ERROR EN USUARIO SERVLET");
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