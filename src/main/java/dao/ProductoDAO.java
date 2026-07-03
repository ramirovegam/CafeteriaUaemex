package dao;

import modelo.ProductoBuilder;import modelo.Producto;
import modelo.ProductoFactory;
import java.sql.*;
import java.util.*;

public class ProductoDAO {

    public List<Producto> listarPorCategoria(int categoriaId) {

        List<Producto> lista = new ArrayList<>();

        try {
            // ✅ Singleton: obtener una sola conexión
            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM productos WHERE categoria_id=?"
            );

            ps.setInt(1, categoriaId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                // ✅ Factory Method: crea el producto base según categoría
                Producto base = ProductoFactory.crearProducto(rs.getInt("categoria_id"));

                // ✅ Builder: construye el objeto completo
                Producto p = new ProductoBuilder()
                        .setId(rs.getInt("id"))
                        .setNombre(rs.getString("nombre"))
                        .setPrecio(rs.getDouble("precio"))
                        .setImagen(rs.getString("imagen"))
                        .setCategoriaId(base.getCategoriaId()) // viene del Factory
                        .build();

                lista.add(p);
            }

            // ✅ Cerrar recursos (IMPORTANTE)
            rs.close();
            ps.close();

            // ❌ NO cerrar conexión (porque es Singleton)

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}
