<?php 

	 //vuelca lo que recibe por POST de otra página
	var_dump($_POST); 



	//volcado de una consulta sql
	$sql = "INSERT INTO PUBLICACIONES (titulo, descripcion, orden, es, en, fr) VALUES (:titulo, :descripcion, :orden, :es, :en, :fr)";
    $data = array(
        ":titulo"=>$_POST["titulo"],
        ":descripcion"=>$_POST["descripcion"],
        ":orden"=>$maximo_orden["MAXIMO"] +1,
        ":es"=>$es,
        ":en"=>$en,
        ":fr"=>$fr
    );
	var_dump($data);
  
 ?>

 aaa
