<?php 

	if (isset($_GET["respuesta"]))
	{
		$respuesta = $_GET["respuesta"];

		switch ($respuesta)
		{
			case 'text':
				echo "Respuesta incorrecta";
				break;
			case 'val':
				echo "Respuesta Correcta !!!";
				break;
			case 'html':
				echo "Respuesta incorrecta";
				break;
		}
	}

 ?>