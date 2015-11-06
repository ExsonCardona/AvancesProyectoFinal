<?php 

	$vNombre=$_POST['name'];
	$vEmail=$_POST['email'];
	$vMotivo=$_POST['subject'];
	$vMjs=$_POST['message'];



	$Conexion = mysql_connect('localhost','root','1234');
	mysql_select_db('Proyecto_Paginas', $Conexion);

		
	$query = "INSERT INTO comentarios (cliente, email, motivo, mensaje) 
	VALUES ('$vNombre','$vEmail','$vMotivo','$vMjs')";

	if (mysql_query($query)) 
		echo "Datos Insertados";
	else
		echo "NO se pudo insertar";


	echo $query;
 ?>

 
<script language="javascript">window.location="index.html";</script>
