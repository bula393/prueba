<html>
  <head>
    <meta charset="utf-8" />

    <title>ASTRO SPORT</title>
    <link rel="icon" type="icon" href="/imagenes/logo-negro.png">
    <link rel="stylesheet" href="inicio secion.css" />
  </head>
  <body>
    <header>
      <a href="\principal\principal.php"><img id=logo src="\imagenes\logo-blanco.png"/></a>
      <img id=nombre src="\imagenes\NOMBRELOGO.png"/>
      <button>
        <a href="FORMULARIO.html"><h1>REGISTRARSE</h1></a>
    </button>  
    </header>
        <nav>
            <div id="pipip">
                <form action="iniciarSesion.php" method="post">  
                    <input type="text "  required class="input" placeholder="CORREO" name="CORREO"/>
                    <input type="password"  required class="input" placeholder="CONTRASEÑA" name="CONTRASEÑA"/>
                    <input type="submit" class="input" value="INICIAR"/>
                </form>
            </div>
    </nav>
  </body>
</html>

