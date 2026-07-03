<%@page import="java.util.*, modelo.ProductoCarrito"%>

<%
List<ProductoCarrito> carrito =
(List<ProductoCarrito>) session.getAttribute("carrito");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
<!-- ICONO -->
<link rel="icon" type="image/png" href="img/iconoCafeteriaUaemex.png">
<link rel="stylesheet" href="css/styleGlobal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
    font-family: Arial;
    background: #f5f5f5;
}

.producto {
    display:flex;
    justify-content:space-between;
    background:white;
    margin:10px;
    padding:10px;
    border-radius:10px;
}

button {
    background:red;
    color:white;
    border:none;
    padding:5px 10px;
    border-radius:8px;
}
</style>

</head>

<body>
<jsp:include page="header.jsp" />
<h2 style="text-align:center;">Carrito</h2>

<%
double total = 0;

if (carrito != null && !carrito.isEmpty()) {

    for (ProductoCarrito p : carrito) {

        total += p.getSubtotal();
%>

<div class="producto">

    <div>
        <p><%= p.getNombre() %></p>
        <p>Cantidad: <%= p.getCantidad() %></p>
        <p>$<%= p.getSubtotal() %></p>
    </div>

    <!--BOTÓN ELIMINAR -->
    <form action="CarritoServlet" method="get">
        <input type="hidden" name="accion" value="eliminar">
        <input type="hidden" name="id" value="<%= p.getId() %>">
        <button>Eliminar</button>
    </form>

</div>

<%
    }

} else {
%>

<p style="text-align:center;">El carrito está vacío</p>

<%
}
%>

<h3 style="text-align:center;">Total: $<%= total %></h3>

<!-- ? CONFIRMAR PEDIDO -->
<form action="PedidoServlet" method="post" style="text-align:center;">
    <button style="background:green;">Confirmar pedido</button>
</form>
<jsp:include page="footer.jsp" />
</body>

</html>
