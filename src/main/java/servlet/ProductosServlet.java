package servlet;

import dao.ProductoDAO;
import modelo.Producto;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ✅ 1. OBTENER CATEGORÍA
            String categoriaStr = request.getParameter("categoria");

            if (categoriaStr == null || categoriaStr.isEmpty()) {
                return;
            }

            int categoriaId = Integer.parseInt(categoriaStr);

            // ✅ 2. LLAMAR DAO
            ProductoDAO dao = new ProductoDAO();
            List<Producto> lista = dao.listarPorCategoria(categoriaId);

            // ✅ 3. RESPUESTA
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            System.out.println("✅ Productos encontrados: " + lista.size());

            // ✅ 4. RECORRER PRODUCTOS
            for (Producto p : lista) {

                out.println("<div class='producto' style='display:flex; justify-content:space-between; align-items:center;'>");

                // 🔸 IZQUIERDA (IMAGEN + INFO)
                out.println("<div style='display:flex;align-items:center;gap:15px;'>");

                // ✅ IMAGEN CORREGIDA (CARPETA EXTERNA)
                out.println("<img src='" 
                        + request.getContextPath() + "/imagenes/" 
                        + p.getImagen() + "' width='60' height='60' style='object-fit:cover;border-radius:10px;' "
                        + "onerror=\"this.src='img/default.png'\">");

                // INFO
                out.println("<div>");
                out.println("<p style='margin:0;'>" + p.getNombre() + "</p>");
                out.println("<span style='color:gray;'>$" + p.getPrecio() + "</span>");
                out.println("</div>");

                out.println("</div>");

                // 🔸 BOTÓN AGREGAR
                out.println("<button onclick=\"agregarCarrito(" 
                        + p.getId() + ",'" + p.getNombre() + "'," + p.getPrecio() + ")\" "
                        + "style='background:#8bc34a;color:white;border:none;padding:8px 12px;border-radius:10px;cursor:pointer;'>"
                        + "Agregar</button>");

                out.println("</div>");
            }

            // ✅ 5. SI NO HAY PRODUCTOS
            if (lista.isEmpty()) {
                out.println("<p style='text-align:center;'>No hay productos en esta categoría</p>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}