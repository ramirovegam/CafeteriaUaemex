package modelo;

import modelo.Usuario;

public class UsuarioBuilder {

    // ✅ Objeto que vamos a construir
    private Usuario usuario;

    // ✅ Constructor
    public UsuarioBuilder() {
        usuario = new Usuario();
    }

    // ✅ Métodos encadenables

    public UsuarioBuilder setId(int id) {
        usuario.setId(id);
        return this;
    }

    public UsuarioBuilder setNombre(String nombre) {
        usuario.setNombre(nombre);
        return this;
    }

    public UsuarioBuilder setApellido(String apellido) {
        usuario.setApellido(apellido);
        return this;
    }

    public UsuarioBuilder setTelefono(String telefono) {
        usuario.setTelefono(telefono);
        return this;
    }

    public UsuarioBuilder setEmail(String email) {
        usuario.setEmail(email);
        return this;
    }

    public UsuarioBuilder setRol(String rol) {
        usuario.setRol(rol);
        return this;
    }

    // ✅ Método final
    public Usuario build() {
        return usuario;
    }
}