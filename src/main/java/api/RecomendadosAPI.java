package api;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.*;
import java.sql.*;

import dao.Conexion;

public class RecomendadosAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Connection con = Conexion.getConexion();

            String sql = """
                SELECT p.id, p.nombre, p.imagen, SUM(d.cantidad) AS total
                FROM detalle_pedido d
                JOIN productos p ON p.id = d.producto_id
                GROUP BY p.id, p.nombre, p.imagen
                ORDER BY total DESC
                LIMIT 3
            """;

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            String json = "[";
            boolean primero = true;

            while (rs.next()) {

                if (!primero) json += ",";

                String imagen = rs.getString("imagen");

                // ✅ si no tiene imagen, usa default
                if (imagen == null || imagen.isEmpty()) {
                    imagen = "default.png";
                }

                json += "{";
                json += "\"id\":" + rs.getInt("id") + ",";
                json += "\"nombre\":\"" + rs.getString("nombre") + "\",";
                json += "\"imagen\":\"" + imagen + "\",";
                json += "\"motivo\":\"Más vendido\"";
                json += "}";

                primero = false;
            }

            json += "]";

            out.print(json);

        } catch (Exception e) {
            e.printStackTrace();

            out.print("[{\"nombre\":\"Error\",\"imagen\":\"default.png\",\"motivo\":\"No se pudo cargar\"}]");
        }
    }
}