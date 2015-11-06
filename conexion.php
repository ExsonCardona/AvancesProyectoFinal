<?php 
	//datos para la coneccion a maysql
define('DB_SERVER', 'localhost');
define('DB_NAME', 'Proyecto_Paginas');
define('DB_USER', 'root');
define('DB_PASS', '1234');
 
 $con = mysql_connect(DB_SERVER, DB_USER,DB_PASS);
 mysql_select_db(DB_NAME, $con);

 ?>