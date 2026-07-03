package dao;

import modelo.Usuario;
import modelo.UsuarioBuilder;
import modelo.UsuarioFactory;
import java.sql.*;

public class UsuarioDAO {

    public Usuario login(String email, String password) {

        Usuario u = null;

        try {
            System.out.println("🔍 Entrando al DAO");

            // ✅ Obtener conexión (Singleton)
            Connection con = Conexion.getConexion();

            // ✅ Verificar conexión
            if (con != null) {
                System.out.println("✅ CONEXIÓN EXITOSA");
            } else {
                System.out.println("❌ NO SE PUDO CONECTAR A LA BD");
            }

            // ✅ Consulta SQL
            String sql = "SELECT * FROM usuarios WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            System.out.println("📌 Ejecutando query con:");
            System.out.println("Email: [" + email + "]");
            System.out.println("Password: [" + password + "]");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("✅ Usuario encontrado");

                // ✅ ✅ Factory Method (crea usuario base con rol)
                Usuario base = UsuarioFactory.crearUsuario(rs.getString("rol"));

                // ✅ ✅ Builder (completa el objeto)
                u = new UsuarioBuilder()
                        .setId(rs.getInt("id"))
                        .setNombre(rs.getString("nombre"))
                        .setApellido(rs.getString("apellido"))
                        .setTelefono(rs.getString("telefono"))
                        .setEmail(rs.getString("email"))
                        .setRol(base.getRol()) // rol viene de Factory
                        .build();

            } else {
                System.out.println("❌ Usuario NO encontrado");
            }

            // ✅ Cerrar recursos (IMPORTANTE)
            rs.close();
            ps.close();

            // ❌ NO cerrar conexión (Singleton)

        } catch (Exception e) {
            System.out.println("❌ ERROR EN DAO:");
            e.printStackTrace();
        }

        return u;
    }
}