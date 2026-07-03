package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.Conexion;

public class EliminarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("✅ ENTRO AL SERVLET ELIMINAR PRODUCTO");

        Connection con = null;
        PreparedStatement ps = null;

        try {

            // ✅ 1. OBTENER ID
            String idStr = request.getParameter("id");

            if (idStr == null || idStr.isEmpty()) {
                throw new Exception("❌ ID no recibido");
            }

            int id = Integer.parseInt(idStr);

            System.out.println("👉 ID a eliminar: " + id);

            // ✅ 2. CONEXIÓN
            con = Conexion.getConexion();

            // ✅ 3. QUERY
            String sql = "DELETE FROM productos WHERE id = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            // ✅ 4. EJECUTAR
            int filas = ps.executeUpdate();

            System.out.println("✅ Filas eliminadas: " + filas);

            // ✅ 5. VALIDAR SI SE ELIMINÓ
            if (filas == 0) {
                System.out.println("⚠️ No se encontró el producto con ese ID");
            }

            // ✅ 6. REDIRECCIÓN
            response.sendRedirect("productoLista.jsp");

        } catch (NumberFormatException e) {

            System.out.println("❌ ERROR: ID no es número");
            e.printStackTrace();

        } catch (Exception e) {

            System.out.println("❌ ERROR GENERAL EN EL SERVLET");
            e.printStackTrace();

        } finally {

            // ✅ 7. CERRAR RECURSOS
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
