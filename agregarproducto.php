<?php
session_start();
	include "../conexion.php";
	if(isset($_SESSION['Usuario'])){

	}else{
		header("Location: ./index.php?Error=Acceso denegado");
	}
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<title>Panel de Administración</title>
	<link rel="stylesheet" type="text/css" href="../css/estilos.css">
	<script type="text/javascript" src="./js/jquery-1.10.2.js"></script>
	<script type="text/javascript"  src="./js/scripts.js"></script>
</head>
<body>
	<header>
		<img src="../imagenes/logo.png" id="logo">
		<a href="../carritodecompras.php" title="ver carrito de compras">
			<img src="../imagenes/carrito.png">
		</a>
	</header>
	<section>
	<nav class="menu2">
	  <menu>
	    <li><a href="./">Inicio</a></li>
		<li><a href="../admin.php">Ultimas Compras</a></li>
	    <li><a href="#" class="selected">Agregar</a></li>
	    <li><a href="./login/cerrar.php">Salir</a></li>
	  </menu>
	</nav>

	<center><h1>Agregar un Nuevo Producto</h1></center>
	<table border="1px" width="100%">	
		<tr>
			<td>Nombre</td>
			<td>Descripcion</td>
			<td>Imagen</td>
			<td>Precio</td>
		</tr>
		<form name="agregar" action="altaproducto.php" method = "post">
		<tr>
			<td><INPUT TYPE="text" NAME="nombre" SIZE="20" MAXLENGTH="30"></td>
			<td><INPUT TYPE="text" NAME="descripcion" SIZE="20" MAXLENGTH="144"></td>
			<td><INPUT TYPE="text" NAME="imagen" SIZE="20" MAXLENGTH="30"></td>
			<td><INPUT TYPE="text" NAME="precio" SIZE="20" MAXLENGTH="30"></td>
		</tr>
			</table>
			<input type="submit" name="accion" value="Enviar" class="aceptar">
		</form>
	</section>
</body>
</html>