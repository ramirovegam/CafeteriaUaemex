<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Login Cafetería</title>

<!-- ICONO -->
<link rel="icon" href="<%= request.getContextPath() %>/img/iconoCafeteriaUaemex.png">

<style>

/* RESET */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

/* BODY */
body{
    font-family:'Segoe UI',sans-serif;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;

    /* ✅ TONOS CAFÉ */
    background:linear-gradient(135deg,#6f4e37,#c8a27a);
}

/* CONTENEDOR */
.login-container{
    width:900px;
    height:480px;
    display:flex;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,0.25);
}

/* IZQUIERDA */
.left-panel{
    width:50%;
    background:linear-gradient(135deg,#6f4e37,#a67c52);
    color:white;
    padding:40px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.left-panel h1{
    font-size:32px;
    margin-bottom:15px;
}

.left-panel p{
    font-size:14px;
}

/* DERECHA */
.right-panel{
    width:50%;
    background:#f5efe6;
    padding:35px;
}

/* HEADER */
.comfort-header{
    text-align:center;
    margin-bottom:25px;
}

.login-logo{
    width:70px;
    height:auto;
    margin-bottom:10px;
}

.comfort-title{
    font-size:22px;
    color:#5c4033;
}

.gentle-subtitle{
    font-size:13px;
    color:#8b6f47;
}

/* INPUTS */
.soft-field{
    margin-bottom:20px;
    position:relative;
}

.field-container{
    background:#f0e4d7;
    border-radius:20px;
    padding:12px;
}

.field-container input{
    width:100%;
    border:none;
    outline:none;
    background:transparent;
    font-size:14px;
}

/* LABEL */
.soft-field label{
    position:absolute;
    left:18px;
    top:50%;
    transform:translateY(-50%);
    color:#8b6f47;
    transition:0.3s;
    font-size:13px;
}

/* EVITAR ENCIMADO */
.soft-field input:focus + label,
.soft-field input:not(:placeholder-shown) + label{
    opacity:0;
}

/* BOTON */
.comfort-button{
    width:100%;
    padding:10px;
    border:none;
    border-radius:20px;

    /* ✅ TONO CAFÉ */
    background:linear-gradient(135deg,#8b5e3c,#c19a6b);

    color:white;
    cursor:pointer;
    font-weight:bold;
}

.comfort-button:hover{
    background:linear-gradient(135deg,#6f4e37,#a67c52);
}

/* LINK */
.comfort-signup{
    text-align:center;
    margin-top:10px;
    font-size:13px;
}

.comfort-link{
    color:#8b5e3c;
    text-decoration:none;
    font-weight:bold;
}

.comfort-link:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="login-container">

    <!-- IZQUIERDA -->
    <div class="left-panel">
        <h1>Bienvenido</h1>
        <p>
            Accede a tu cuenta para gestionar pedidos, productos
            y disfrutar del sistema de cafetería.
        </p>
    </div>

    <!-- DERECHA -->
    <div class="right-panel">

        <div class="comfort-header">
            <!-- ✅ CORREGIDO -->
            <img src="<%= request.getContextPath() %>/img/cafelogin.png" class="login-logo">

            <h2 class="comfort-title">Iniciar sesión</h2>
            <p class="gentle-subtitle">Ingresa tus credenciales</p>
        </div>

        <!-- ERROR -->
        <%
            String error = request.getParameter("error");
            if ("1".equals(error)) {
        %>
        <p style="color:red;text-align:center;margin-bottom:10px;">
            Usuario o contraseña incorrectos
        </p>
        <%
            }
        %>

        <!-- FORM -->
        <form action="<%= request.getContextPath() %>/LoginServlet" method="post">

            <div class="soft-field">
                <div class="field-container">
                    <input type="email" name="email" placeholder=" " required>
                    <label>Correo electrónico</label>
                </div>
            </div>

            <div class="soft-field">
                <div class="field-container">
                    <input type="password" name="password" placeholder=" " required>
                    <label>Contraseña</label>
                </div>
            </div>

            <button type="submit" class="comfort-button">
                Iniciar sesión
            </button>

        </form>

        <!-- ✅ LINK CORREGIDO -->
        <div class="comfort-signup">
            <span>¿No tienes cuenta?, contacta al administrador</span>
        </div>

    </div>

</div>

</body>
</html>
