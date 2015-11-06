<!DOCTYPE html>
<html>

 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale-1.0">
    <title>Restaurant</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/main.css" media="screen" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style-portfolio.css">
    <link rel="stylesheet" href="css/picto-foundry-food.css" />
    <link rel="stylesheet" href="css/jquery-ui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="icon" href="favicon-1.ico" type="image/x-icon">
    
</head>

<body>

    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="images/logo72.png" alt="Inicio"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav main-nav   ">
                    <li><a class="color_animation" href="contenido.php">Inicio</a></li>
                   
                </ul>
                 <?php
    session_start();
   

    if (!isset($_SESSION['userid']))
        $_SESSION['userid']=0;

    if($_SESSION['userid']==0)
        echo '</br></br></br></br>','<a>Acceso Restringido: </a>';
    if($_SESSION['userid']==0)
        echo '<a><img src="images/logo72.png" alt="Inicio"></a>';
       
        if($_SESSION['userid']==0)
        echo '<a href="cerrarsesion.php">  Iniciar Sesion</a>';

       
 
    else
    {
?>

                <ul class="nav navbar-nav main-nav  clear navbar-right navbar-raght">
                    <li><a class="color_animation" href="cerrarsesion.php">Cerrar Sesion</a></li>
                </ul>
            </div>
        </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md col-lg-offset-1">
                    <table class="table table-hover table-responsive">
                       <tbody>
                            </br></br></br></br>
                            <div class="container-fluid">
   <div class="row">
    <div class="col-md-5">
      <table class="table table-hover table-responsive">
     <thead>
        <tr>
          <th>Empleado</th>
          <th>Puesto</th>
                 </tr>
      </thead>
    <tbody>
                            <?php
                          include_once "conexion2.php";

                        $query = "SELECT Usuarios.usuario, Intereses.intereses
                        FROM Usuarios LEFT JOIN Detalles
                        ON Usuarios.id=Detalles.Usuarios_id
                        LEFT JOIN Intereses
                        ON Intereses.id=Detalles.Intereses_id";

                        $record = mysql_query($query);

                        if ($row=mysql_fetch_array($record))
                         {
                            
                            do{
                           echo "<tr>";
                           echo "<td>".$row['usuario']."</td>";
                           echo "<td>".$row['intereses']."</td>";
                           echo "<tr>";
                        }
                        while ($row = mysql_fetch_array($record));
                        echo "</table>";
                        }

                        ?>

                        </tbody>    
                    </table>
                </div>
            </div>
            <div class="clearfix visible-lg"></div>
        </div >
   
    </body>
</html>
<?php
}
?>