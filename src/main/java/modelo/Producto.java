package modelo;

public class Producto {

    private int id;
    private String nombre;
    private double precio;
    private String imagen;
    private int categoriaId;

    // ✅ CONSTRUCTOR VACÍO
    public Producto() {
    }

    // ✅ CONSTRUCTOR COMPLETO
    public Producto(int id, String nombre, double precio, String imagen, int categoriaId) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
        this.categoriaId = categoriaId;
    }

    // ✅ GETTERS Y SETTERS

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    //--------------------------

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    //--------------------------

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    //--------------------------

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    //--------------------------

    public int getCategoriaId() {
        return categoriaId;
    }

    public void setCategoriaId(int categoriaId) {
        this.categoriaId = categoriaId;
    }
}