package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    public static Connection getConexion() {
        try {
            // ✅ Cargar driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ✅ Conexión (puerto 3306 correcto)
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cafeteria?useSSL=false&serverTimezone=UTC",
                "root",
                "1234"
            );

        } catch (Exception e) {
            System.out.println("❌ Error en conexión:");
            e.printStackTrace();
        }

        return null;
    }
}