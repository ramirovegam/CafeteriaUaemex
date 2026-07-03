package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.Conexion;

public class ProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("✅ ENTRO AL SERVLET PRODUCTO");

        try {

            // ✅ 1. DATOS DEL FORM
            String nombre = request.getParameter("nombre");
            String precioStr = request.getParameter("precio");
            String categoriaStr = request.getParameter("categoria");

            System.out.println("Nombre: " + nombre);
            System.out.println("Precio: " + precioStr);
            System.out.println("Categoria: " + categoriaStr);

            // ✅ VALIDACIÓN
            if (nombre == null || precioStr == null || categoriaStr == null ||
                nombre.isEmpty() || precioStr.isEmpty() || categoriaStr.isEmpty()) {

                throw new Exception("Campos vacíos");
            }

            double precio = Double.parseDouble(precioStr);
            int categoria = Integer.parseInt(categoriaStr);

            // ✅ 2. RECIBIR IMAGEN
            Part archivo = request.getPart("imagen");

            String nombreArchivo = archivo.getSubmittedFileName();

            // 🔥 LIMPIAR NOMBRE (evita rutas tipo C:\Users\...)
            if (nombreArchivo != null) {
                nombreArchivo = nombreArchivo.substring(nombreArchivo.lastIndexOf("\\") + 1);
            }

            System.out.println("Archivo limpio: " + nombreArchivo);

            // ✅ 3. RUTA EXTERNA (PRO)
            String ruta = "C:\\imagenesCafeteria";

            File carpeta = new File(ruta);
            if (!carpeta.exists()) {
                boolean creada = carpeta.mkdirs();
                System.out.println("Carpeta creada: " + creada);
            }

            // ✅ 4. GUARDAR IMAGEN (forma segura)
            if (nombreArchivo != null && !nombreArchivo.isEmpty()) {

                File archivoDestino = new File(carpeta, nombreArchivo);

                try (InputStream input = archivo.getInputStream();
                     FileOutputStream output = new FileOutputStream(archivoDestino)) {

                    byte[] buffer = new byte[1024];
                    int bytesLeidos;

                    while ((bytesLeidos = input.read(buffer)) != -1) {
                        output.write(buffer, 0, bytesLeidos);
                    }
                }

                System.out.println("✅ Imagen guardada en: " + archivoDestino.getAbsolutePath());
            }

            // ✅ 5. GUARDAR EN BASE DE DATOS
            Connection con = Conexion.getConexion();

            String sql = "INSERT INTO productos(nombre, precio, categoria_id, imagen) VALUES (?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, nombre);
            ps.setDouble(2, precio);
            ps.setInt(3, categoria);
            ps.setString(4, nombreArchivo); // solo nombre

            int filas = ps.executeUpdate();

            System.out.println("✅ Filas insertadas: " + filas);

            // ✅ 6. REDIRECCIÓN
            response.sendRedirect("productoLista.jsp");

        } catch (Exception e) {

            System.out.println("❌ ERROR EN PRODUCTO SERVLET");
            e.printStackTrace();

            response.setContentType("text/html");
            response.getWriter().println("<h2>Error real:</h2><pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");
        }
    }
}
