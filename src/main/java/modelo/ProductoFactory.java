package modelo;

public class ProductoFactory {

    // ✅ Factory Method
    public static Producto crearProducto(int categoriaId) {

        Producto producto = new Producto();

        // ✅ decidir tipo según categoría
        switch (categoriaId) {

            case 1:
                // Ej: bebidas
                producto.setCategoriaId(1);
                break;

            case 2:
                // Ej: alimentos
                producto.setCategoriaId(2);
                break;

            case 3:
                // Ej: postres
                producto.setCategoriaId(3);
                break;

            default:
                // categoría genérica
                producto.setCategoriaId(0);
                break;
        }

        return producto;
    }
}