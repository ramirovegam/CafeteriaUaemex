<%@page import="java.sql.*"%>
<%@page import="dao.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection con = Conexion.getConexion();

// ✅ ESTA LÍNEA ERA LA QUE TE FALTABA
String filtro = request.getParameter("rol");
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Panel Admin</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>

/* 🎨 ESTILO CAFETERÍA */
body{
    background:#f5efe6;
}

/* TARJETAS */
.card{
    background:white;
    border-radius:16px;
    padding:20px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

/* BOTONES */
.btn-cafe{
    background:#6f4e37;
    color:white;
    padding:6px 12px;
    border-radius:8px;
}

.btn-cafe:hover{
    background:#5c4033;
}

.btn-cream{
    background:#c19a6b;
    color:white;
    padding:6px 12px;
    border-radius:8px;
}

.btn-cream:hover{
    background:#a67c52;
}

/* INPUTS */
.input{
    padding:8px;
    border-radius:8px;
    border:1px solid #d2b48c;
}

</style>

</head>

<body class="p-6">

<h1 class="text-3xl font-bold mb-6 text-[#5c4033]">
☕ Panel Administrador
</h1>

<!-- ✅ FORMULARIO -->
<div class="card mb-6">

<form action="<%= request.getContextPath() %>/UsuarioServlet" 
      method="post"
      class="grid grid-cols-2 gap-4">

    <input type="text" name="nombre" placeholder="Nombre" class="input" required>
    <input type="text" name="apellido" placeholder="Apellido" class="input" required>

    <input type="text" name="telefono" placeholder="Teléfono" class="input" required>
    <input type="email" name="email" placeholder="Email" class="input" required>

    <input type="password" name="password" placeholder="Password" class="input" required>

    <select name="rol" class="input">
        <option value="alumno">Alumno</option>
        <option value="cocinero">Cocinero</option>
    </select>

    <button class="btn-cafe col-span-2">
        ➕ Agregar Usuario
    </button>

</form>

</div>

<!-- ✅ FILTRO -->
<form method="get" class="mb-4">

<select name="rol" onchange="this.form.submit()" class="input">

    <option value="">Todos</option>

    <option value="alumno" <%= "alumno".equals(filtro) ? "selected" : "" %>>
        Alumnos
    </option>

    <option value="cocinero" <%= "cocinero".equals(filtro) ? "selected" : "" %>>
        Cocineros
    </option>

</select>

</form>

<!-- ✅ TABLA -->
<div class="card">

<table class="w-full">

<thead>
<tr class="border-b text-[#5c4033]">
    <th>ID</th>
    <th>Nombre</th>
    <th>Email</th>
    <th>Rol</th>
    <th>Acciones</th>
</tr>
</thead>

<tbody>

<%
PreparedStatement ps;

if(filtro != null && !filtro.equals("")){
    ps = con.prepareStatement("SELECT * FROM usuarios WHERE rol=?");
    ps.setString(1, filtro);
} else {
    ps = con.prepareStatement("SELECT * FROM usuarios");
}

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr class="border-b">

<td><%= rs.getInt("id") %></td>

<td>
    <%= rs.getString("nombre") %>
    <%= rs.getString("apellido") %>
</td>

<td><%= rs.getString("email") %></td>

<td><%= rs.getString("rol") %></td>

<td class="flex gap-2 py-2">

    <!-- EDITAR -->
    <a href="<%= request.getContextPath() %>/editarUsuario.jsp?id=<%= rs.getInt("id") %>"
       class="btn-cream">
        Editar
    </a>

    <!-- ELIMINAR -->
    <a href="<%= request.getContextPath() %>/EliminarUsuarioServlet?id=<%= rs.getInt("id") %>"
       class="btn-cafe"
       onclick="return confirm('¿Eliminar usuario?')">
        Eliminar
    </a>

</td>

</tr>

<%
}
rs.close();
ps.close();
con.close();
%>

</tbody>

</table>

</div>

<!-- BOTÓN SALIR -->
<div class="mt-6">
<button onclick="window.location='login.jsp'"
        class="btn-cafe px-4 py-2">
     Cerrar sesión
</button>
</div>

</body>
</html>