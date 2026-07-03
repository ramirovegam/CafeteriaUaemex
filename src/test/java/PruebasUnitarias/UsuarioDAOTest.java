import org.junit.Test;
import static org.junit.Assert.*;

import dao.UsuarioDAO;
import modelo.Usuario;

public class UsuarioDAOTest {

    // ✅ Login correcto REAL
    @Test
    public void testLoginCorrecto() {

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = dao.login("admin@gmail.com", "1234");

        assertNotNull(usuario);
    }

    // ✅ Login incorrecto
    @Test
    public void testLoginIncorrecto() {

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = dao.login("x@x.com", "wrong");

        assertNull(usuario);
    }

    // ✅ Caso vacío
    @Test
    public void testLoginVacio() {

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = dao.login("", "");

        assertNull(usuario);
    }
}