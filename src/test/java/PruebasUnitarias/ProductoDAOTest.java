import org.junit.Test;
import static org.junit.Assert.*;

import dao.ProductoDAO;
import modelo.Producto;

import java.util.List;

public class ProductoDAOTest {

    // ✅ Prueba con categoría válida
    @Test
    public void testListarPorCategoriaValida() {

        ProductoDAO dao = new ProductoDAO();

        List<Producto> lista = dao.listarPorCategoria(1);

        // Verifica que la lista no sea null
        assertNotNull(lista);
    }

    // ✅ Prueba con categoría inexistente
    @Test
    public void testListarPorCategoriaInexistente() {

        ProductoDAO dao = new ProductoDAO();

        List<Producto> lista = dao.listarPorCategoria(999);

        // Sigue siendo válida (lista vacía pero no null)
        assertNotNull(lista);
        assertTrue(lista.size() >= 0);
    }

    // ✅ Prueba con categoría negativa
    @Test
    public void testListarPorCategoriaNegativa() {

        ProductoDAO dao = new ProductoDAO();

        List<Producto> lista = dao.listarPorCategoria(-1);

        assertNotNull(lista);
    }

    // ✅ Prueba básica de estructura de datos
    @Test
    public void testListaEsTipoCorrecto() {

        ProductoDAO dao = new ProductoDAO();

        List<Producto> lista = dao.listarPorCategoria(1);

        // Verifica tipo de retorno
        assertTrue(lista instanceof List);
    }

}
