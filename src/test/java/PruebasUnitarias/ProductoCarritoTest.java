import org.junit.Test;
import static org.junit.Assert.*;

import modelo.ProductoCarrito;

public class ProductoCarritoTest {

    // ✅ Test constructor vacío + setters y getters
    @Test
    public void testSettersYGetters() {

        ProductoCarrito producto = new ProductoCarrito();

        producto.setId(1);
        producto.setNombre("Café");
        producto.setPrecio(20.0);
        producto.setCantidad(3);

        assertEquals(1, producto.getId());
        assertEquals("Café", producto.getNombre());
        assertEquals(20.0, producto.getPrecio(), 0.01);
        assertEquals(3, producto.getCantidad());
    }

    // ✅ Test constructor completo
    @Test
    public void testConstructorCompleto() {

        ProductoCarrito producto = new ProductoCarrito(
                5,
                "Capuccino",
                30.0,
                2
        );

        assertEquals(5, producto.getId());
        assertEquals("Capuccino", producto.getNombre());
        assertEquals(30.0, producto.getPrecio(), 0.01);
        assertEquals(2, producto.getCantidad());
    }

    // ✅ Test del método getSubtotal (IMPORTANTE 🔥)
    @Test
    public void testSubtotal() {

        ProductoCarrito producto = new ProductoCarrito();

        producto.setPrecio(15.0);
        producto.setCantidad(4);

        double subtotal = producto.getSubtotal();

        assertEquals(60.0, subtotal, 0.01);
    }

    // ✅ Test subtotal con valores en cero
    @Test
    public void testSubtotalCero() {

        ProductoCarrito producto = new ProductoCarrito();

        producto.setPrecio(0.0);
        producto.setCantidad(5);

        assertEquals(0.0, producto.getSubtotal(), 0.01);
    }

    // ✅ Test valores por defecto
    @Test
    public void testValoresPorDefecto() {

        ProductoCarrito producto = new ProductoCarrito();

        assertEquals(0, producto.getId());
        assertNull(producto.getNombre());
        assertEquals(0.0, producto.getPrecio(), 0.01);
        assertEquals(0, producto.getCantidad());
    }
}