<%@page import="java.sql.*"%>
<%@page import="dao.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection con = Conexion.getConexion();

// ✅ OBTENER ID
String idStr = request.getParameter("id");

if (idStr == null) {
    response.sendRedirect("admin.jsp");
    return;
}

int id = Integer.parseInt(idStr);

// ✅ CONSULTAR USUARIO
PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM usuarios WHERE id=?"
);

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

if (!rs.next()) {
    response.sendRedirect("admin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar Usuario</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>
body{
    background:#f5efe6;
}

/* TARJETA */
.card{
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0px 5px 15px rgba(0,0,0,0.1);
}

/* BOTÓN */
.btn-cafe{
    background:#6f4e37;
    color:white;
    padding:8px 15px;
    border-radius:10px;
}

.btn-cafe:hover{
    background:#5c4033;
}

/* INPUT */
.input{
    padding:10px;
    border-radius:8px;
    border:1px solid #c19a6b;
}
</style>

</head>

<body class="p-6">

<h1 class="text-3xl font-bold mb-6 text-[#5c4033]">
    ️ Editar Usuario
</h1>

<div class="card max-w-xl">

<!--  FORM -->
<form action="<%= request.getContextPath() %>/EditarUsuarioServlet"
      method="post"
      class="grid grid-cols-1 gap-4">

    <!-- ID oculto -->
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <!-- NOMBRE -->
    <input type="text" name="nombre"
           value="<%= rs.getString("nombre") %>"
           class="input" required>

    <!-- APELLIDO -->
    <input type="text" name="apellido"
           value="<%= rs.getString("apellido") %>"
           class="input" required>

    <!-- TELÉFONO -->
    <input type="text" name="telefono"
           value="<%= rs.getString("telefono") %>"
           class="input" required>

    <!-- EMAIL -->
    <input type="email" name="email"
           value="<%= rs.getString("email") %>"
           class="input" required>

    <!-- PASSWORD -->
    <input type="text" name="password"
           value="<%= rs.getString("password") %>"
           class="input" required>

    <!-- ROL -->
    <select name="rol" class="input">

        <option value="alumno"
            <%= rs.getString("rol").equals("alumno") ? "selected" : "" %>>
            Alumno
        </option>

        <option value="cocinero"
            <%= rs.getString("rol").equals("cocinero") ? "selected" : "" %>>
            Cocinero
        </option>

    </select>

    <!-- BOTÓN -->
    <button class="btn-cafe">
         Guardar cambios
    </button>

</form>

<!--  REGRESAR -->
<button onclick="window.location='admin.jsp'"
        class="mt-4 btn-cafe">
    Regresar
</button>

</div>

</body>
</html>