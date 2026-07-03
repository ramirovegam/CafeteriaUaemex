import org.junit.Test;
import static org.junit.Assert.*;

import dao.Conexion;
import java.sql.Connection;

public class ConexionTest {

    // ✅ Test principal: verifica conexión
    @Test
    public void testConexionExitosa() {

        Connection conexion = Conexion.getConexion();

        // Debe conectarse correctamente
        assertNotNull(conexion);
    }

    // ✅ Test para validar que la conexión es válida
    @Test
    public void testConexionValida() {

        try {
            Connection conexion = Conexion.getConexion();

            assertNotNull(conexion);

            // Verifica que la conexión sigue abierta
            assertTrue(!conexion.isClosed());

        } catch (Exception e) {
            fail("Error al validar conexión");
        }
    }

    // ✅ Test simple de consistencia
    @Test
    public void testConexionMultiple() {

        Connection con1 = Conexion.getConexion();
        Connection con2 = Conexion.getConexion();

        assertNotNull(con1);
        assertNotNull(con2);
    }
}