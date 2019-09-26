<?php 

	if(isset($_POST["nombre"]) && isset($_POST["email"]))
	{
		$nombre = $_POST["nombre"];
		$email = $_POST["email"];

		echo "Nombre es: $nombre y tu email: $email" ;
	}

 ?>