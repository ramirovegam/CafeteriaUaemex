<%@page import="modelo.Usuario"%>
<%
Usuario u = (Usuario) session.getAttribute("usuario");
if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!-- HEADER -->
<div class="header">

    <div class="header-left">
        Hola, <%= u.getNombre() %>
    </div>

    <div>
        <a href="LogoutServlet" class="btn-logout">
            <i class="fas fa-sign-out-alt"></i> Salir
        </a>
    </div>

</div>