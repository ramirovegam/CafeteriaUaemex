<%@page import="java.sql.*"%>
<%@page import="dao.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = Conexion.getConexion();
    String categoriaSeleccionada = request.getParameter("categoria");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Productos</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>
/* 🎨 TONOS CAFÉ */
body{
    background:#f5efe6;
}

/* TARJETA */
.card{
    background:white;
    border-radius:20px;
    box-shadow:0 6px 15px rgba(0,0,0,0.1);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

/* BOTONES */
.btn-cafe{
    background:#8b5e3c;
    color:white;
    border-radius:10px;
    padding:6px 10px;
    font-size:12px;
}

.btn-cafe:hover{
    background:#6f4e37;
}

.btn-cream{
    background:#d2b48c;
    color:white;
    border-radius:10px;
    padding:6px 10px;
    font-size:12px;
}

.btn-cream:hover{
    background:#c19a6b;
}
</style>

</head>

<body class="p-6">

<h1 class="text-3xl font-bold mb-6 text-[#5c4033]">
    ☕ Lista de Productos
</h1>

<!-- ✅ SELECT -->
<form method="get">
    <select name="categoria"
            onchange="this.form.submit()"
            class="mb-6 p-2 rounded-xl border border-[#c8a27a] bg-white text-[#5c4033]">

        <option value="">Todas las categorías</option>

        <%
        Statement stCat = con.createStatement();
        ResultSet rsCat = stCat.executeQuery("SELECT * FROM categorias");

        while(rsCat.next()){
            String id = rsCat.getString("id");
            String nombre = rsCat.getString("nombre");

            String selected = "";
            if(categoriaSeleccionada != null && id.equals(categoriaSeleccionada)){
                selected = "selected";
            }
        %>

        <option value="<%= id %>" <%= selected %>>
            <%= nombre %>
        </option>

        <%
        }
        rsCat.close();
        stCat.close();
        %>

    </select>
</form>

<!-- ✅ PRODUCTOS -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

<%
String query = "SELECT * FROM productos";

if(categoriaSeleccionada != null && !categoriaSeleccionada.equals("")){
    query += " WHERE categoria_id=" + categoriaSeleccionada;
}

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);

while(rs.next()){
    String imagen = rs.getString("imagen");
%>

<div class="card p-4">

    <!-- ✅ IMAGEN -->
    <img
        src="<%= request.getContextPath() %>/imagenes/<%= imagen %>"
        class="w-full h-40 object-cover rounded-xl mb-3"
        onerror="this.src='img/default.png'"
    />

    <!-- NOMBRE -->
    <h2 class="text-xl font-semibold text-[#5c4033]">
        <%= rs.getString("nombre") %>
    </h2>

    <!-- PRECIO -->
    <p class="text-lg font-bold text-[#8b5e3c] mt-2">
        $<%= rs.getDouble("precio") %>
    </p>

    <!-- ✅ BOTONES -->
    <div class="flex gap-2 mt-3">

        <!-- MODIFICAR -->
        <a href="editarProducto.jsp?id=<%= rs.getInt("id") %>"
           class="btn-cream">
            Modificar
        </a>

        <!-- ELIMINAR -->
        <a href="EliminarProductoServlet?id=<%= rs.getInt("id") %>"
           class="btn-cafe"
           onclick="return confirm('¿Eliminar producto?')">
            Eliminar
        </a>

    </div>

</div>

<%
}
rs.close();
st.close();
con.close();
%>

</div>

<!-- ✅ BOTÓN REGRESAR -->
<div class="mt-10">
    <button onclick="window.location='cocinero.jsp'"
        class="btn-cafe px-6 py-2">
        Regresar
    </button>
</div>

</body>
</html>