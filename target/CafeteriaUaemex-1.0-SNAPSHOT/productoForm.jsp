<%@page import="modelo.Usuario"%>
<%@page import="java.sql.*"%>
<%@page import="dao.Conexion"%>

<%
Usuario u = (Usuario) session.getAttribute("usuario");

// ? SEGURIDAD
if (u == null || !"cocinero".equals(u.getRol())) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Agregar producto</title>

<!-- ICONOS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* BODY */
body {
    font-family: Arial;
    background: #f5f1ea;
    margin: 0;
}

/* CONTENEDOR */
.container {
    max-width: 420px;
    margin: 80px auto;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0px 3px 10px rgba(0,0,0,0.2);
}

/* TITULO */
h2 {
    text-align: center;
    color: #4b2e2b;
}

/* INPUTS Y SELECT */
input, select {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
}

/* LABEL */
label {
    font-size: 14px;
    color: #333;
}

/* INPUT FILE BONITO */
input[type="file"] {
    border: 2px dashed #4b2e2b;
    background: #fff;
    padding: 10px;
    cursor: pointer;
}

input[type="file"]:hover {
    background: #f5f1ea;
}

/* BOTONES */
button {
    width: 100%;
    padding: 10px;
    background: #4b2e2b;
    color: white;
    border: none;
    border-radius: 10px;
    margin-top: 10px;
    cursor: pointer;
}

button:hover {
    background: #3a221f;
}

/* BOTON BACK */
.back {
    background: gray;
}

.back:hover {
    background: #555;
}

</style>
</head>

<body>

<div class="container">

<h2>Agregar producto</h2>

<!-- FORM COMPLETO -->
<form action="<%= request.getContextPath() %>/ProductoServlet"
      method="post"
      enctype="multipart/form-data">

    <!-- NOMBRE -->
    <label>Nombre</label>
    <input type="text" name="nombre" placeholder="Ej. Pizza" required>

    <!-- PRECIO -->
    <label>Precio</label>
    <input type="number" step="0.01" name="precio" placeholder="Ej. 45.50" required>

    <!-- CATEGORIA -->
    <label>Categoría</label>
    <select name="categoria" required>

        <option value="">Selecciona categoría</option>

        <%
        try {
            Connection con = Conexion.getConexion();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM categorias");

            while (rs.next()) {
        %>

        <option value="<%= rs.getInt("id") %>">
            <%= rs.getString("nombre") %>
        </option>

        <%
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>

    </select>

    <!-- ? IMAGEN -->
    <label>Imagen del producto</label>
    <input type="file" name="imagen" accept="image/*" required>

    <!-- BOTON -->
    <button type="submit">
        <i class="fa fa-save"></i> Guardar producto
    </button>

</form>

<!-- BOTÓN REGRESAR -->
<button class="back" onclick="window.location='cocinero.jsp'">
    <i class="fa fa-arrow-left"></i> Regresar
</button>

</div>

</body>
</html>