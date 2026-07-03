<%@page import="java.sql.*"%>
<%@page import="dao.Conexion"%>
<%@page import="modelo.Usuario"%>

<%
Usuario u = (Usuario) session.getAttribute("usuario");
if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Mis pedidos</title>

<!-- ICONOS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- CSS GLOBAL -->
<link rel="stylesheet" href="css/styleGlobal.css">

<!-- ESTILOS SOLO DE ESTA VISTA -->
<style>

/* CONTENIDO */
.container{
    padding:100px 20px 100px;
}

/* TARJETA PEDIDO */
.pedido{
    background:white;
    border-radius:15px;
    padding:15px;
    margin-bottom:15px;
    box-shadow:0px 3px 6px rgba(0,0,0,0.1);
}

/* ESTADOS */
.estado{
    font-weight:bold;
}

.pendiente { color:orange; }
.preparado { color:green; }
.cancelado { color:red; }

/* BOTONES */
button{
    border:none;
    padding:8px 12px;
    border-radius:10px;
    margin-top:5px;
    cursor:pointer;
}

.btn-detalle{
    background:#2196f3;
    color:white;
}

.btn-cancelar{
    background:red;
    color:white;
}

</style>

</head>

<body>

<!-- ? HEADER GLOBAL -->
<jsp:include page="header.jsp" />
<div class="main">
<div class="container">
<h2 style="text-align:center; color:#4b2e2b;">Mis pedidos</h2>

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

    <p class="estado <%= estado %>">
        Estado: <%= estado %>
    </p>

    <p>Fecha: <%= rs.getTimestamp("fecha") %></p>

    <!-- ? VER DETALLE -->
    <button class="btn-detalle"
        onclick="verDetalle(<%= rs.getInt("id") %>)">
        Ver productos
    </button>

    <!-- ? CANCELAR -->
    <%
    if("pendiente".equals(estado)){
    %>

    <form action="CancelarServlet" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        <button class="btn-cancelar">Cancelar</button>
    </form>

    <%
    }
    %>

</div>

<%
    }

} catch(Exception e){
    e.printStackTrace();
}
%>

</div>
</div>

<!-- ? FOOTER GLOBAL -->
<jsp:include page="footer.jsp" />

<!-- ? SCRIPT DETALLE -->
<script>
function verDetalle(id){
    window.open(
        "DetallePedidoServlet?id=" + id,
        "_blank",
        "width=400,height=500"
    );
}
</script>

</body>
</html>