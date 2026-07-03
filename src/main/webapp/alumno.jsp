<%@page import="modelo.Usuario"%>
<%@page import="java.util.*"%>

<%
Usuario u = (Usuario) session.getAttribute("usuario");
if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}

String lang = request.getParameter("lang");
if (lang == null) {
    lang = "es"; // idioma por defecto
}

Locale locale = new Locale(lang);
ResourceBundle bundle = ResourceBundle.getBundle(
        "idioma.messages",
        locale,
        Thread.currentThread().getContextClassLoader()
);
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">

<title>Alumno</title>

<!-- ICONO -->
<link rel="icon" type="image/png" href="img/iconoCafeteriaUaemex.png">

<!-- ICONOS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- CSS GLOBAL -->
<link rel="stylesheet" href="css/styleGlobal.css">

<style>

/* BUSCADOR */
.search-box {
    margin: 20px 40px;
    position: relative;
}

.search-box input {
    width: 100%;
    padding: 12px 45px;
    border-radius: 30px;
    border: none;
    background: #ffffff;
    box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
}

.search-box i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: gray;
}

/* TITULO */
.category-title {
    text-align: center;
    font-weight: bold;
    margin: 20px;
    color: #4b2e2b;
}

/* GRID */
.grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
    padding: 0 40px;
}

/* CARDS CATEGORIAS */
.card {
    text-align: center;
    cursor: pointer;
}

.card-box {
    background: #f5f1ea;
    border-radius: 20px;
    padding: 20px;
    height: 250px;             
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
}

.card-box:hover {
    background: #e8dfd3;
    transform: scale(1.1);
}

.card-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s;
    border-radius: 15px; /* opcional para bordes bonitos */
}

.card p {
    margin-top: 10px;
    color: #4b2e2b;
    font-weight: bold;
}

/* PRODUCTOS */
.producto {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #ffffff;
    margin: 15px 40px;
    padding: 12px;
    border-radius: 15px;
    box-shadow: 0px 3px 6px rgba(0,0,0,0.1);
}

/* RECOMENDADOS */
.recomendados {
    background: #fff8e1;
    margin: 20px 40px;
    padding: 15px;
    border-radius: 15px;
}

/* TARJETAS RECOMENDADOS */
.card-recomendado {
    background: #ffffff;
    padding: 15px;
    margin: 10px 0;
    border-radius: 12px;
    box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
    color: #000;
}

.card-recomendado strong {
    color: #000;
}

.card-recomendado span {
    color: #555;
}

/* CARRUSEL */
.carrusel {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px;
}

.card-carrusel {
    width: 580px;          /* más ancho */
    height: 220px;         /* más bajo = rectangular */
    background: #ffffff;
    padding: 20px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0px 4px 10px rgba(0,0,0,0.15);

    display: flex;
    flex-direction: column;
    justify-content: center;   /* centra vertical */
    align-items: center;       /* centra horizontal */
}

.card-carrusel img {
    width: 140px;
    margin: 10px auto;
    display: block;
    transition: transform 0.3s;
}

.card-carrusel img:hover {
    transform: scale(1.1);  /*  zoom bonito */
}

.flecha {
    background: #4b2e2b;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 50%;
    cursor: pointer;
}

.flecha:hover {
    background: #6d4c41;
}

.btn-agregar {
    margin-top: 12px;
    background: green;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 14px;
    cursor: pointer;
}

.flecha i {
    font-size: 20px;
}

.card-carrusel i {
    font-size: 24px;
    margin-bottom: 10px;
}

.card-carrusel strong {
    margin-top: 10px;
    font-size: 18px;
}

.card-carrusel span {
    margin-top: 5px;
    color: gray;
}
</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="header.jsp" />

<div class="main">

<!-- Boton cambiar idioma -->    
<div style="text-align:right; margin:10px;">

    <a href="<%= request.getContextPath() %>/alumno.jsp?lang=es"
       style="margin-right:15px; text-decoration:none; color:#4b2e2b; font-size:16px; display:inline-flex; align-items:center; gap:6px;">
        <i class="fa-solid fa-language"></i>
         Español
    </a>

    <a href="<%= request.getContextPath() %>/alumno.jsp?lang=en"
       style="text-decoration:none; color:#4b2e2b; font-size:16px; display:inline-flex; align-items:center; gap:6px;">
        <i class="fa-solid fa-globe"></i>
         English
    </a>

</div>
    
<!-- RECOMENDADOS -->
<div class="recomendados">
    
    <h3><%= bundle.getString("recomendados") %></h3>

    <div class="carrusel">

        <button class="flecha" onclick="anterior()">
            <i class="fa-solid fa-chevron-left"></i>
        </button>

        <div class="card-carrusel" id="carruselContenido">
            <img src="img/recomendados.png" style="width:120px; margin-top:40px;">
        </div>

        <button class="flecha" onclick="siguiente()">
            <i class="fa-solid fa-chevron-right"></i>
        </button>

    </div>
</div>

    <!-- TITULO -->
    <h3><%= bundle.getString("categorias") %></h3>

    <!-- CATEGORÍAS -->
    <div class="grid">

        <div class="card" onclick="cargarCategoria(1)">
            <div class="card-box">
                <img src="img/vegetales.jpg">
            </div>
            <p><%= bundle.getString("vegetales") %></p>
        </div>

        <div class="card" onclick="cargarCategoria(2)">
            <div class="card-box">
                <img src="img/frutas.png">
            </div>
            <p><%= bundle.getString("frutas") %></p>
        </div>

        <div class="card" onclick="cargarCategoria(3)">
            <div class="card-box">
                <img src="img/carnes.png">
            </div>
            <p><%= bundle.getString("carnes") %></p>
        </div>

        <div class="card" onclick="cargarCategoria(4)">
            <div class="card-box">
                <img src="img/desayuno.jpg">
            </div>
            <p><%= bundle.getString("desayunos") %></p>
        </div>

        <div class="card" onclick="cargarCategoria(5)">
            <div class="card-box">
                <img src="img/snacks.jpg">
            </div>
            <p><%= bundle.getString("snacks") %></p>
        </div>

        <div class="card" onclick="cargarCategoria(6)">
            <div class="card-box">
                <img src="img/bebidas.jpg">
            </div>
            <p><%= bundle.getString("bebidas") %></p>
        </div>

    </div>

    <!-- PRODUCTOS -->
    <div id="contenido"></div>

</div>

<!-- FOOTER -->
<jsp:include page="footer.jsp" />

<script>
const contexto = "<%= request.getContextPath() %>";
</script>

<!-- CARGAR RECOMENDADOS -->
<script>
function cargarRecomendados() {

    fetch(contexto + "/api/recomendados")
    .then(function(res) {
        return res.json();
    })
    .then(function(data) {

        console.log("DATA COMPLETA:", data);

        let html = "";

        // FORZAMOS LECTURA SEGURA
        data.forEach(function(p) {

            console.log("OBJETO:", p);

            html += '<div style="background:white; padding:15px; margin:10px 0; border-radius:10px;">';
            html += '<div style="color:black;">';
            html += '<strong>' + (p.nombre || "SIN NOMBRE") + '</strong><br>';
            html += '<span>' + (p.motivo || "SIN MOTIVO") + '</span>';
            html += '</div>';
            html += '</div>';
        });

        console.log("HTML FINAL:", html);

        document.getElementById("listaRecomendados").innerHTML = html;

    })
    .catch(function(error) {
        console.log("ERROR:", error);
        document.getElementById("listaRecomendados").innerHTML = "Error al cargar";
    });
}

window.addEventListener("DOMContentLoaded", cargarRecomendados);
</script>

<!-- CARGAR PRODUCTOS -->
<script>
function cargarCategoria(id) {

    fetch(contexto + "/ProductosServlet?categoria=" + id)
    .then(res => res.text())
    .then(data => {
        document.getElementById("contenido").innerHTML = data;
    });
}
</script>

<!-- CARRITO -->
<script>
function agregarCarrito(id, nombre, precio) {

    fetch("CarritoServlet?id=" + id + "&nombre=" + nombre + "&precio=" + precio)
    .then(res => res.text())
    .then(data => {
        document.getElementById("contador").innerText = data;
    });
}

</script>

<script>
let recomendados = [];
let index = 0;

// cargar datos
function cargarRecomendados() {

    fetch("/CafeteriaUaemex/api/recomendados")
    .then(res => res.json())
    .then(data => {

        recomendados = data;

        mostrarRecomendado();

        // auto cambio cada 3 segundos
        setInterval(siguiente, 3000);

    });
}

// mostrar uno
// mostrar uno
function mostrarRecomendado() {

    if (recomendados.length === 0) return;

    let p = recomendados[index];

    // ? RANKING
    let ranking = "";

    if (index === 0) {
        ranking = '<i class="fa-solid fa-medal" style="color:gold;"></i> Top 1';
    } 
    else if (index === 1) {
        ranking = '<i class="fa-solid fa-medal" style="color:silver;"></i> Top 2';
    } 
    else {
        ranking = '<i class="fa-solid fa-medal" style="color:#cd7f32;"></i> Top 3';
    }

    let html = '';

    html += '<div style="text-align:center;">';

    // ? ranking arriba
    html += '<div style="margin-bottom:5px;">' + ranking + '</div>';

    // ? imagen centrada
    html += '<img src="' + contexto + '/imagenes/' + p.imagen + '" style="width:80px; display:block; margin:10px auto;">

    // ? nombre separado
    html += '<strong style="display:block; margin-top:10px;">' + p.nombre + '</strong>';

    // ? motivo separado
    html += '<span style="display:block; margin-top:5px; color:gray;">' + p.motivo + '</span>';

    // ? botón
    html += '<button class="btn-agregar" style="margin-top:10px;" onclick="agregarCarrito(' 
            + p.id + ', \'' + p.nombre + '\', 10)">Agregar</button>';

    html += '</div>';

    document.getElementById("carruselContenido").innerHTML = html;
}

// botón siguiente
function siguiente() {
    index++;
    if (index >= recomendados.length) index = 0;
    mostrarRecomendado();
}

// botón anterior
function anterior() {
    index--;
    if (index < 0) index = recomendados.length - 1;
    mostrarRecomendado();
}

// iniciar
window.addEventListener("DOMContentLoaded", cargarRecomendados);
</script>




</body>
</html>