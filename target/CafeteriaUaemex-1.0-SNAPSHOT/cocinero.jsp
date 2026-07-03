<%@page import="java.sql.*"%>
<%@page import="dao.Conexion"%>
<%@page import="modelo.Usuario"%>

<%
Usuario u = (Usuario) session.getAttribute("usuario");

if (u == null || !"cocinero".equals(u.getRol())) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Panel Cocinero</title>

<!-- ICONOS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- CSS GLOBAL -->
<link rel="stylesheet" href="css/styleGlobal.css">

<style>

/* CONTENEDOR */
.container {
    padding: 100px 20px;
}

/* TARJETA */
.pedido {
    background: white;
    padding: 15px;
    border-radius: 12px;
    margin-bottom: 15px;
    box-shadow: 0 3px 6px rgba(0,0,0,0.1);
}

/* SELECT */
select {
    padding: 6px;
    border-radius: 6px;
}

/* BOTON */
button {
    padding: 6px 12px;
    border: none;
    background: #4b2e2b;
    color: white;
    border-radius: 8px;
    cursor: pointer;
}

/* TITULO */
.title {
    text-align: center;
    color: #4b2e2b;
}

/* CRUD */
.crud {
    text-align:center;
    margin-top:20px;
}

.crud a button {
    margin:5px;
    background:#2196f3;
}

</style>

</head>

<body>

<!--HEADER -->
<jsp:include page="header.jsp" />

<div class="main">
<div class="container">

<h2 class="title">Panel Cocinero </h2>

<%
try {

    Connection con = Conexion.getConexion();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM pedidos ORDER BY id DESC");

    while(rs.next()){

        String estado = rs.getString("estado");
%>

<div class="pedido">

    <p><b>Pedido #<%= rs.getInt("id") %></b></p>
    <p>Total: $<%= rs.getDouble("total") %></p>
    <p>Fecha: <%= rs.getTimestamp("fecha") %></p>

    <!--CAMBIAR ESTADO -->
    <form action="PedidoServlet" method="post">

        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

        <select name="estado">
            <option <%= estado.equals("pendiente") ? "selected" : "" %>>pendiente</option>
            <option <%= estado.equals("preparado") ? "selected" : "" %>>preparado</option>
            <option <%= estado.equals("terminado") ? "selected" : "" %>>terminado</option>
            <option <%= estado.equals("cancelado") ? "selected" : "" %>>cancelado</option>
        </select>

        <button>Guardar</button>

    </form>

</div>

<%
    }

} catch(Exception e){
    e.printStackTrace();
}
%>

<!--CRUD PRODUCTOS -->
<div class="crud">

    <a href="productoForm.jsp">
        <button>Agregar producto</button>
    </a>

    <a href="productoLista.jsp">
        <button>Ver productos</button>
    </a>

</div>

</div>
</div>

</body>
</html>
