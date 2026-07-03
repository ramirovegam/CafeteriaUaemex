<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Cafetería UAEMEX</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">

   <link rel="icon" type="image/png" href="img/iconoCafeteriaUaemex.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 

    <!-- Librerías -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Bootstrap -->
    <link href="css/style.min.css" rel="stylesheet">
</head>

<body>

<!-- NAVBAR -->
<div class="container-fluid p-0 nav-bar">
    <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">

        <a href="index.jsp" class="navbar-brand px-lg-4 m-0">
            <h1 class="m-0 display-4 text-uppercase text-white">UAEMEX</h1>
        </a>

        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav ml-auto p-4">

                <a href="index.jsp" class="nav-item nav-link active">Inicio</a>
                <a href="about.html" class="nav-item nav-link">Nosotros</a>
                <a href="service.html" class="nav-item nav-link">Servicios</a>
                <a href="menu.html" class="nav-item nav-link">Menú</a>

                <!-- BOTÓN INICIAR SESIÓN -->
                <a href="login.jsp" class="btn btn-primary ml-3">
                    Iniciar sesión
                </a>

            </div>
        </div>

    </nav>
</div>

<div class="container-fluid p-0 mb-5">
    <div id="blog-carousel" class="carousel slide overlay-bottom" data-ride="carousel" data-interval="3000">
        
        <div class="carousel-inner">

            <!-- SLIDE 1 -->
            <div class="carousel-item active">
                <img class="w-100" src="img/carousel-1.png">
                
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    
                    <img src="img/cafe.png" 
                         style="width:200px; margin-bottom:15px;">

                    <h2 class="text-primary">Consulta en tu espacio academico</h2>
                    <h2 class="text-white">8:00am-6:00pm</h2>

                    <!-- BOTÓN LOGIN -->
                    <a href="login.jsp" class="btn btn-primary mt-3">
                        Iniciar sesión
                    </a>
                </div>
            </div>

            <!-- SLIDE 2 -->
            <div class="carousel-item">
                <img class="w-100" src="img/chilaquiles.jpg">
                
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <h2 class="text-primary">Sirviendo desde</h2>
                    <h1 class="display-1 text-white">Comida</h1>
                    <h2 class="text-white">* DESDE 1990 *</h2>

                <!-- BOTÓN REGISTRO -->
                </div>
            </div>

        </div>

</div> <!-- carousel-inner -->

<!-- CONTROLES -->
<a class="carousel-control-prev" href="#blog-carousel" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
</a>

<a class="carousel-control-next" href="#blog-carousel" data-slide="next">
    <span class="carousel-control-next-icon"></span>
</a>

</div>


    </div>
</div>



        <!-- CONTROLES -->
        <a class="carousel-control-prev" href="#blog-carousel" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>

        <a class="carousel-control-next" href="#blog-carousel" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>

    </div>
</div>


<!-- SOBRE NOSOTROS -->
<!-- About Start -->
<div class="container-fluid py-5">
    <div class="container">
        <div class="section-title">
            <h4 class="text-primary text-uppercase" style="letter-spacing: 5px;">SOBRE NOSOTROS</h4>
            <h1 class="display-4">Sirviendo desde 1990</h1>
        </div>
        <div class="row">

            <div class="col-lg-4 py-0 py-lg-5">
                <h1 class="mb-3">Nuestra Historia</h1>
                <h5 class="mb-3">
                    Somos una cafetería con tradición que brinda calidad en cada taza.
                </h5>
                <p>
                    Durante años hemos ofrecido un ambiente agradable y productos de alta calidad,
                    combinando tradición y buen servicio para todos nuestros clientes.
                </p>
                <a href="" class="btn btn-secondary font-weight-bold py-2 px-4 mt-2">
                    Saber más
                </a>
            </div>

            <div class="col-lg-4 py-5 py-lg-0" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100" src="img/about.png" style="object-fit: cover;">
                </div>
            </div>

            <div class="col-lg-4 py-0 py-lg-5">
                <h1 class="mb-3">Nuestra Visión</h1>
                <p>
                    Ser una cafetería reconocida por su excelente sabor, calidad y servicio.
                </p>
                <h5 class="mb-3"><i class="fa fa-check text-primary mr-3"></i>Calidad garantizada</h5>
                <h5 class="mb-3"><i class="fa fa-check text-primary mr-3"></i>Ambiente agradable</h5>
                <h5 class="mb-3"><i class="fa fa-check text-primary mr-3"></i>Servicio rápido</h5>
                <a href="" class="btn btn-primary font-weight-bold py-2 px-4 mt-2">
                    Saber más
                </a>
            </div>

        </div>
    </div>
</div>
<!-- About End -->


<!-- SERVICIOS -->
<!-- Service Start -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title">
            <h4 class="text-primary text-uppercase" style="letter-spacing: 5px;">SERVICIOS</h4>
            <h1 class="display-4">Café fresco y orgánico</h1>
        </div>

        <div class="row">

            <div class="col-lg-6 mb-5">
                <div class="row align-items-center">
                    <div class="col-sm-5">
                        <img class="img-fluid mb-3 mb-sm-0" src="img/service-1.jpg" alt="">
                    </div>
                    <div class="col-sm-7">
                        <h4><i class="fa fa-truck service-icon"></i>Entrega rápida a domicilio</h4>
                        <p class="m-0">
                            Recibe tu pedido de café directamente en tu puerta de manera rápida y segura.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 mb-5">
                <div class="row align-items-center">
                    <div class="col-sm-5">
                        <img class="img-fluid mb-3 mb-sm-0" src="img/service-2.jpg" alt="">
                    </div>
                    <div class="col-sm-7">
                        <h4><i class="fa fa-coffee service-icon"></i>Granos de café frescos</h4>
                        <p class="m-0">
                            Utilizamos granos seleccionados de la mejor calidad para un sabor único.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 mb-5">
                <div class="row align-items-center">
                    <div class="col-sm-5">
                        <img class="img-fluid mb-3 mb-sm-0" src="img/service-3.jpg" alt="">
                    </div>
                    <div class="col-sm-7">
                        <h4><i class="fa fa-award service-icon"></i>Café de la mejor calidad</h4>
                        <p class="m-0">
                            Ofrecemos productos cuidadosamente preparados para garantizar excelencia.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 mb-5">
                <div class="row align-items-center">
                    <div class="col-sm-5">
                        <img class="img-fluid mb-3 mb-sm-0" src="img/service-4.jpg" alt="">
                    </div>
                    <div class="col-sm-7">
                        <h4><i class="fa fa-table service-icon"></i>Reservación de mesas en línea</h4>
                        <p class="m-0">
                            Reserva tu mesa fácilmente desde cualquier dispositivo.
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- Service End -->



<!-- FOOTER -->
<div class="container-fluid footer text-white mt-5 pt-5 px-0">
    <div class="text-center py-4">
        <p>© Cafetería UAEMEX - Todos los derechos reservados</p>
    </div>
</div>


<!-- JS -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

</body>
</html>