package modelo;

public class ProductoCarrito {

    private int id;
    private String nombre;
    private double precio;
    private int cantidad;

    // ✅ CONSTRUCTOR VACÍO
    public ProductoCarrito() {
    }

    // ✅ CONSTRUCTOR COMPLETO
    public ProductoCarrito(int id, String nombre, double precio, int cantidad) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    // ✅ GETTERS Y SETTERS

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    //----------------------

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    //----------------------

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    //----------------------

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    //----------------------

    // ✅ MÉTODO EXTRA (muy útil 🔥)
    public double getSubtotal() {
        return precio * cantidad;
    }
}
