<%@page import="java.sql.*"%>
<%@page import="dao.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = Conexion.getConexion();

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM productos WHERE id=?"
    );

    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Producto</title>

<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-[#f5efe6] p-6">

<h1 class="text-3xl font-bold mb-6 text-[#5c4033]">
    ✏️ Editar Producto
</h1>

<form action="<%= request.getContextPath() %>/EditarProductoServlet" 
      method="post">

    <!-- ID oculto -->
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <!-- NOMBRE -->
    <label class="block mt-2 text-[#5c4033]">Nombre</label>
    <input type="text" name="nombre"
           value="<%= rs.getString("nombre") %>"
           class="w-full p-2 rounded-lg border">

    <!-- PRECIO -->
    <label class="block mt-2 text-[#5c4033]">Precio</label>
    <input type="number" step="0.01" name="precio"
           value="<%= rs.getDouble("precio") %>"
           class="w-full p-2 rounded-lg border">

    <!-- BOTÓN -->
    <button class="mt-4 bg-[#8b5e3c] text-white px-4 py-2 rounded-lg">
        Guardar cambios
    </button>

</form>

<!-- REGRESAR -->
<button onclick="window.location='productoLista.jsp'"
        class="mt-4 bg-[#6f4e37] text-white px-4 py-2 rounded-lg">
    Regresar
</button>

</body>
</html>