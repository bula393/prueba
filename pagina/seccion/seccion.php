<?php
$servername = "127.0.0.1";
    $database = "ASTRO_SPORT";
    $username = "alumno";
    $password = "alumnoipm";
    
    $conexion = mysqli_connect($servername, $username, $password, $database); // se crea la conexion


    if (!$conexion) {
        die("Conexion fallida: " . mysqli_connect_error());
    }
    else{
        $CATEGIRIA=$_GET['categoria'];
        $consulta1 = "select  * from productos where subcategoria_idsubcategoria in(select * from subcategoria where select categoria_id=(select id from categoria where nombre=$CATEGORIA)) and (subcategoria_idsubcategoria%2)=0;";
        $consulta2 = "select  * from productos where subcategoria_idsubcategoria in(select * from subcategoria where select categoria_id=(select id from categoria where nombre=$CATEGORIA)) and (subcategoria_idsubcategoria%2)!=0;"
        $resultado0=mysqli_query($conexion, $consulta1);
        $resultado1=mysqli_query($conexion, $consulta2);

    }

    mysqli_close($conexion);
?>


<html>
  <head>
    <meta charset="utf-8" />

    <title>ASTRO SPORT</title>
    <link rel="stylesheet" href="seccion.css" />
  </head>
  <body>
    <header>
      <a href="\principal\principal.html"><img id=logo src="\imagenes\logo-blanco.png"/></a>
      <img id=nombre src="\imagenes\NOMBRELOGO.png"/>
      <button id="esquina">
        <a href="\formulario\iniciosesion.php"><h1>INICIO SESION</h1></a>
    </button>  
    </header> 
    <h1 class="subseccion">
      <?php
          echo $CATEGIRIA;
      ?>
    </h1> 
    <ul class="nav">    
    <li>
      <a href=""><img id=opciones src="\imagenes\opciones.png"></a>
      <ul class="desplegable">
        <h1>Equipamiento</h1>

        <li><a class="desplegable" href="\seccion\seccion.php?categoria=botines"><h3>Botines</h3></a></li>
        <li><a class="desplegable" href="\seccion\seccion.php?categoria=Guantes de arquero"><h3>Guantes de arquero</h3></a></li>
        <li><a class="desplegable" href="\seccion\seccion.php?categoria=Remeras"><h3>Remeras de entrenamiento</h3></a></li>
        <li><a class="desplegable" href="\Kits-de-entrenamiento\KitsDeEntrenamiento.html"><h3>Kits de entrenamiento</h3></a></li>

        <h1>Indumentaria</h1> 

        <li><a class="desplegable" href="\seccion\seccion.html"><h3>Accesorios</h3></a></li> 
        <li><a class="desplegable" href="\seccion\seccion.html"><h3>Calzado</h3></a> </li> 
         
  </ul>
      </li>
    </ul>
    <?php  
      $subtitulos=mysqli_fetch_assoc($resultado0);
    ?>
    <h1 class="subseccion">
      <?php  
        echo $subtitulos;
      ?>
    </h1> 
  <div class="desplazable">
    <?php
    while($fila=mysqli_fetch_assoc($resultado0)){ ?>
    <a href="/productos/productos.php"><img class="item" src="<?php echo $fila['fotos'] ?> "/></a>
<?php
    }
  ?>
  </div>
  <?php  
      $subtitulo=mysqli_fetch_assoc($resultado1);
    ?>
    <h1 class="subseccion">
      <?php  
        echo $subtitulo;
      ?>
  <div class="desplazable">
  <?php
    while($fila=mysqli_fetch_assoc($resultado1)){ ?>
    <a href="/productos/productos.php"><img class="item" src="<?php echo $fila['fotos'] ?> "/></a>
<?php
    }
  ?>
  </div>
  </body>
</html>

