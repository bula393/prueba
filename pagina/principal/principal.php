<?php 
session_start();
?>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300;400;700&display=swap" rel="stylesheet">
    <title>ASTRO SPORT</title>
    <link rel="icon" href="/imagenes/logo-negro.png" />
    <link rel="stylesheet" href="principal.css" />
  </head>
  <body>
  <div id="loader" class="loader">
        <img src="/imagenes/logo-blanco.png" alt="Logo de la página" class="loader-logo">
    </div>
    <script>
        window.addEventListener('load', function() {
            // Espera 3 segundos antes de ocultar la pantalla de carga
            setTimeout(function() {
                document.getElementById('loader').style.display = 'none';
                document.getElementById('content').style.display = 'block';
                document.body.style.overflow = 'auto'; // Permite el desplazamiento una vez que se carga el contenido
            }, 2000); // Cambia el tiempo de espera según lo necesites (3000 ms = 3 segundos)
        });
    </script>
  <header>
  <a href="\principal\principal.php"><img id=logo src="\imagenes\logo-blanco.png"/></a>
      <img id=nombre src="\imagenes\NOMBRELOGO.png"/>
  <?php
  if(!isset($_SESSION["iniciada"])){
  echo "<button>
      <a href='/formulario/iniciosesion.php'><h1>INICIO SESION</h1></a>
   </button> ";
   }
   else if($_SESSION["iniciada"]){
   echo "<img id=perfil src='/imagenes/perfil.jpg'>";
   }?>
    </header> 
    <?php
        echo "<h2 id='mail'>".$_SESSION['correo']."</h2>";
      ?>
    <ul class="nav">    
    <li>
          <ul class="desplegable">

              <h1>Equipamiento</h1>

              <li><a class="desplegable" href="\Botines\Botines.html"><h3>Botines</h3></a></li>
              <li><a class="desplegable" href="\GUANTES-ARQUERO\guantes-arquero.html"><h3>Guantes de arquero</h3></a></li>
              <li><a class="desplegable" href="\remeras\Remera.html"><h3>Remeras de entrenamiento</h3></a></li>
              <li><a class="desplegable" href="\Kits-de-entrenamiento\KitsDeEntrenamiento.html"><h3>Kits de entrenamiento</h3></a></li>
 
              <h1>Indumentaria</h1>
 
              <li><a class="desplegable" href="\seccion\seccion.html"><h3>Accesorios</h3></a></li>
              <li><a class="desplegable" href="\seccion\seccion.html"><h3>Calzado</h3></a> </li>

        </ul>
      </li>
    </ul>  
        <nav>
    </nav>
  </body>
</html>

