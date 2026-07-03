package modelo;

public class UsuarioFactory {

    // ✅ Factory Method (IMPORTANTE)
    public static Usuario crearUsuario(String rol) {

        // ✅ crear objeto base
        Usuario usuario = new Usuario();

        // ✅ validar null para evitar error
        if (rol != null) {

            switch (rol.toLowerCase()) {

                case "admin":
                    usuario.setRol("admin");
                    break;

                case "alumno":
                    usuario.setRol("alumno");
                    break;

                case "cocinero":
                    usuario.setRol("cocinero");
                    break;

                default:
                    usuario.setRol("usuario");
                    break;
            }

        } else {
            // ✅ si es null
            usuario.setRol("usuario");
        }

        // ✅ regresar objeto
        return usuario;
    }
}
