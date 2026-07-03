import org.junit.Test;
import static org.junit.Assert.*;

import modelo.Usuario;

public class UsuarioTest {

    // ✅ Test completo de setters y getters
    @Test
    public void testSettersYGetters() {

        Usuario usuario = new Usuario();

        usuario.setId(1);
        usuario.setNombre("Ramiro");
        usuario.setApellido("Vega");
        usuario.setTelefono("7221234567");
        usuario.setEmail("admin@gmail.com");
        usuario.setPassword("1234");
        usuario.setRol("admin");

        assertEquals(1, usuario.getId());
        assertEquals("Ramiro", usuario.getNombre());
        assertEquals("Vega", usuario.getApellido());
        assertEquals("7221234567", usuario.getTelefono());
        assertEquals("admin@gmail.com", usuario.getEmail());
        assertEquals("1234", usuario.getPassword());
        assertEquals("admin", usuario.getRol());
    }

    // ✅ Test valores por defecto (muy importante)
    @Test
    public void testValoresPorDefecto() {

        Usuario usuario = new Usuario();

        assertEquals(0, usuario.getId());
        assertNull(usuario.getNombre());
        assertNull(usuario.getApellido());
        assertNull(usuario.getTelefono());
        assertNull(usuario.getEmail());
        assertNull(usuario.getPassword());
        assertNull(usuario.getRol());
    }

    // ✅ Test de modificación de datos
    @Test
    public void testModificarDatos() {

        Usuario usuario = new Usuario();

        usuario.setNombre("Alumno");
        assertEquals("Alumno", usuario.getNombre());

        usuario.setNombre("Admin");
        assertEquals("Admin", usuario.getNombre());
    }

    // ✅ Test de campos no nulos después de asignar
    @Test
    public void testCamposNoNulos() {

        Usuario usuario = new Usuario();

        usuario.setEmail("test@gmail.com");
        usuario.setNombre("Test");

        assertNotNull(usuario.getEmail());
        assertNotNull(usuario.getNombre());
    }

    // ✅ Test de consistencia (sobrescritura de valores)
    @Test
    public void testSobreescritura() {

        Usuario usuario = new Usuario();

        usuario.setEmail("a@gmail.com");
        assertEquals("a@gmail.com", usuario.getEmail());

        usuario.setEmail("b@gmail.com");
        assertEquals("b@gmail.com", usuario.getEmail());
    }

    // ✅ Test de asignación múltiple
    @Test
    public void testAsignacionMultiple() {

        Usuario usuario = new Usuario();

        usuario.setNombre("Ramiro");
        usuario.setApellido("Vega");

        assertEquals("Ramiro", usuario.getNombre());
        assertEquals("Vega", usuario.getApellido());
    }
}
