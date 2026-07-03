package servlet;

import dao.UsuarioDAO;
import modelo.Usuario;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    // ✅ PARA PROBAR SI EXISTE EL SERVLET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.getWriter().println("✅ LoginServlet funcionando correctamente");
    }

    // ✅ MÉTODO PRINCIPAL (LOGIN)
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔥 RECIBE DATOS Y QUITA ESPACIOS
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        System.out.println("📩 Email recibido: [" + email + "]");
        System.out.println("🔑 Password recibido: [" + password + "]");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = dao.login(email, password);

        if (u != null) {

            System.out.println("✅ Login correcto");

            // ✅ CREAR SESIÓN
            HttpSession session = request.getSession();
            session.setAttribute("usuario", u);

            String rol = u.getRol();

            System.out.println("👤 Rol: " + rol);

            // ✅ REDIRIGIR SEGÚN ROL
            if (rol.equals("admin")) {
                response.sendRedirect("admin.jsp");

            } else if (rol.equals("alumno")) {
                response.sendRedirect("alumno.jsp");

            } else if (rol.equals("cocinero")) {
                response.sendRedirect("cocinero.jsp");
            }

        } else {
            System.out.println("❌ Login fallido");
            response.sendRedirect("login.jsp?error=1");
        }
    }
}