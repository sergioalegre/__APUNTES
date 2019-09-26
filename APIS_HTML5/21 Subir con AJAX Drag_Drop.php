<?php

$nombreArchivo = $_FILES['nombre_archivo']['name'];
$tipoArchivo = $_FILES['nombre_archivo']['type'];
$tempArchivo = $_FILES['nombre_archivo']['tmp_name'];
if(move_uploaded_file($tempArchivo,"21_uploads/".$nombreArchivo))
{
	echo "21_uploads/".$nombreArchivo;
}
else
{
	print_r($_FILES);
}

