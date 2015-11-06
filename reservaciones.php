
<?php 

	$vNombre=$_POST['nombre'];
	$vApellido=$_POST['apellido'];
	$vCiudad=$_POST['ciudad'];
	$vFecha=$_POST['fecha'];
	$vTel=$_POST['telefono'];
	$vTel2=$_POST['telefono2'];
	$vEmail=$_POST['email'];
	$vMotivo=$_POST['motivo'];



	$Conexion = mysql_connect('localhost','root','1234');
	mysql_select_db('Proyecto_Paginas', $Conexion);

		
	$query = "INSERT INTO Clientes (Nombre_Cliente, Apellido_Cliente, Direccion_Cliente, Telefono_Cliente,fecha_reserv,otro_telefono,email,Motivo) 
	VALUES ('$vNombre','$vApellido','$vCiudad','$vTel','$vFecha','$vTel2','$vEmail','$vMotivo')";

	if (mysql_query($query)) 
		echo "Datos Insertados";
	else
		echo "NO se pudo insertar";


	echo $query;
 ?>

 
<script language="javascript">window.location="index.html";</script>



