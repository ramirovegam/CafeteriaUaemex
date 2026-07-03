import org.junit.Test;
import static org.junit.Assert.*;

import modelo.Producto;

public class ProductoTest {

    // ✅ Test del constructor vacío + setters + getters
    @Test
    public void testSettersYGetters() {

        Producto producto = new Producto();

        producto.setId(1);
        producto.setNombre("Café");
        producto.setPrecio(25.5);
        producto.setImagen("cafe.jpg");
        producto.setCategoriaId(2);

        assertEquals(1, producto.getId());
        assertEquals("Café", producto.getNombre());
        assertEquals(25.5, producto.getPrecio(), 0.01);
        assertEquals("cafe.jpg", producto.getImagen());
        assertEquals(2, producto.getCategoriaId());
    }

    // ✅ Test del constructor completo
    @Test
    public void testConstructorCompleto() {

        Producto producto = new Producto(
                10,
                "Capuccino",
                30.0,
                "capuccino.jpg",
                3
        );

        assertEquals(10, producto.getId());
        assertEquals("Capuccino", producto.getNombre());
        assertEquals(30.0, producto.getPrecio(), 0.01);
        assertEquals("capuccino.jpg", producto.getImagen());
        assertEquals(3, producto.getCategoriaId());
    }

    // ✅ Test para valores vacíos o por defecto
    @Test
    public void testValoresPorDefecto() {

        Producto producto = new Producto();

        assertEquals(0, producto.getId());
        assertNull(producto.getNombre());
        assertEquals(0.0, producto.getPrecio(), 0.01);
        assertNull(producto.getImagen());
        assertEquals(0, producto.getCategoriaId());
    }
}