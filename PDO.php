<?php

//CONEXION (conexion.php)
    class Conexion
    {
        public function conectar()
        {
            try {
                $usuario = 'root';
                $password = '';
                $host = 'localhost';
                $db = 'WM2';                                            

                $instance = new PDO(
                    "mysql:host=$host;dbname=$db;charset=utf8",
                    $usuario,
                    $password,
                    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
                );

                $instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $instance->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
                return $instance;

            } catch (PDOException $e) {
                echo $e->getMessage();
                die();
            }
        }
    }

//SELECT SIN PARAMETROS
    require_once('conexion.php');
    try{
        $conexion = new Conexion();
        $conn = $conexion->conectar();
        $sql = "SELECT * FROM POSTS";
        $sth = $conn->prepare($sql);
        $sth->execute();  
        $filas = $sth->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//SELECT CON PARAMETROS y esperando un array consultando el elemento en primera posiocion (0)
    require_once('conexion.php');
    try{
        $conexion = new Conexion();
        $conn = $conexion->conectar();
        $sql = "SELECT * FROM USUARIOS WHERE nombre=:nombre AND pass=:pass";
        $data = array(
            ":nombre"=>$_POST["user"],
            ":pass"=>SHA1($_POST["pass"])
        );
        $sth = $conn->prepare($sql);
        $sth->execute($data);
        $fila = $sth->fetchAll(PDO::FETCH_ASSOC);  //cuando se espera un solo resultado se pone $sth->fetch(PDO::FETCH_ASSOC);

        if(sizeof($fila)==1)
        {
            $_SESSION['iduser'] = $fila[0]['id_usuario'];  //fetcAll devuelve un array consultamos el primero, aunque solo debería revolver uno
            $_SESSION['nombreuser'] = $fila[0]['nombre'];
        }
        else
        {
            echo 'error'; //esto lo devolvemos al ajax para que sepa que mensaje mostrar
        }

    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//SELECT CON PARAMETROS y esperando un único resultado
    try{
        $sql = "SELECT id_categoria FROM categorias_posts WHERE categoria=:categoria";
        $data = array(
            ":categoria"=>$_GET['categoria']
        );
        $sth = $conn->prepare($sql);
        $sth->execute($data);
        $id_categoria = $sth->fetch(PDO::FETCH_ASSOC);

        $id_categoria_seleccionada = $id_categoria['id_categoria'];  //fetch devuelve un un solo resultado y aqui lo consultamos


    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//OTRO SELECT ESPERANDO UN ÚNICO RESULTADO
    try{
        $conexion = new Conexion();
        $conn = $conexion->conectar();
        $sql = "SELECT * FROM web";
        $sth = $conn->prepare($sql);
        $sth->execute();  
        $fila = $sth->fetch(PDO::FETCH_ASSOC); //no hacemos fetchALL xq esperamos un único resultado

        //variables globales
        $web_url = $fila['url'];
        $web_titulo = $fila['titulo'];
        $web_nombre = $fila['nombre'];

    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//SELECT CON %LIKE%
    $search = $_POST['search'];

    try{
        $conexion = new Conexion();
        $conn = $conexion->conectar();

        $sql = "SELECT * FROM POSTS WHERE titulo LIKE :titulo";

        $data = array(  //parametros
            ":titulo"=>"%".$search."%"
        );

        $sth = $conn->prepare($sql);
        $sth->execute($data);  //hay que poner $data xq lleva parametro
        $filas = $sth->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//INSERT
    require_once('conexion.php');
    try{
        $conexion = new Conexion();
        $conn = $conexion->conectar();
        $sql = "INSERT INTO busca_vehiculo (nombre, email, telefono, descripcion) VALUES (:nombre, :email, :telefono, :descripcion)";
        $data = array(
            ":nombre"=>$_POST["nombre"],
            ":email"=>$_POST["email"],
            ":telefono"=>$_POST["telefono"],
            ":descripcion"=>$_POST["mensaje"]
        );
        $sth = $conn->prepare($sql);
        $sth->execute($data);   
    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//UPDATE SIN PARAMETROS
     try{
        $conexion = new Conexion();
        $conn = $conexion->conectar();

        $sql3 = "UPDATE POSTS SET visitas=visitas+1";
        $sth3 = $conn->prepare($sql3);
        $sth3->execute();

    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//UPDATE CON PARAMETROS
    try{
        $conexion = new Conexion();
        $conn = $conexion->conectar();
        $sql = "UPDATE POSTS SET visitas=visitas+1 WHERE id_post=:idpost";
        $data = array(
            ":idpost"=>$fila['id_post']
        );
        $sth = $conn->prepare($sql);
        $sth->execute($data);

    } catch (PDOException $e) {
        echo $e->getLine() . ': ' . $e->getMessage();
    }

//TRANSACCION O HACE LAS DOS CONSULTAS O NO HACE NINGUNA
    try{
    $conexion = new Conexion();
    $conn = $conexion->conectar();
    $conn->beginTransaction(); //empezamos la transaccion, o hace todo o ninguno

        $sql3 = "UPDATE fotos_vehiculos SET foto_destacada=0 WHERE id_vehiculo=:id_vehiculo";
        $data3 = array(
            ":id_vehiculo"=>$id_vehiculo
        );
        $sth3 = $conn->prepare($sql3);
        $sth3->execute($data3);


        $sql4 = "UPDATE fotos_vehiculos SET foto_destacada=1 WHERE id_foto=:id_foto";
        $data4 = array(
            ":id_foto"=>$id_foto
        );
        $sth4 = $conn->prepare($sql4);
        $sth4->execute($data4);

    $conn->commit();

} catch (PDOException $e) {
    //var_dump($e);
    $conn->rollback(); //si no hace todos que vuelva atras
}

?>
