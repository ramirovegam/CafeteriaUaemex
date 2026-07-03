
<%@page import="java.util.*, modelo.ProductoCarrito"%>

<%
List<ProductoCarrito> carritoFooter =
(List<ProductoCarrito>) session.getAttribute("carrito");

int totalItems = 0;

if (carritoFooter != null) {
    for (ProductoCarrito p : carritoFooter) {
        totalItems += p.getCantidad();
    }
}
%>

<!-- FOOTER -->
<div class="footer">

    <a href="alumno.jsp">
        <i class="fas fa-store"></i>
    </a>

    <a href="carrito.jsp" style="position:relative;">
        <i class="fas fa-shopping-cart"></i>

        <span id="contador" class="badge"><%= totalItems %></span>
    </a>

    <a href="pedidos.jsp">
        <i class="fas fa-receipt"></i>
    </a>

</div>