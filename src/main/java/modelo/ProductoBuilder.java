
package modelo;

import modelo.Producto;

public class ProductoBuilder {

    // ✅ Objeto que vamos a construir
    private Producto producto;

    // ✅ Constructor: crea el objeto base vacío
    public ProductoBuilder() {
        producto = new Producto();
    }

    // ✅ Métodos encadenables (fluent)

    public ProductoBuilder setId(int id) {
        producto.setId(id);
        return this;
    }

    public ProductoBuilder setNombre(String nombre) {
        producto.setNombre(nombre);
        return this;
    }

    public ProductoBuilder setPrecio(double precio) {
        producto.setPrecio(precio);
        return this;
    }

    public ProductoBuilder setImagen(String imagen) {
        producto.setImagen(imagen);
        return this;
    }

    public ProductoBuilder setCategoriaId(int categoriaId) {
        producto.setCategoriaId(categoriaId);
        return this;
    }

    // ✅ Método final: devuelve el objeto construido
    public Producto build() {
        return producto;
    }
}