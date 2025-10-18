<?php

$usuario = json_decode(file_get_contents("php://input"));
if(!$usuario) exit("No se encontraron datos");
include_once "encabezado.php";
include_once "funciones.php";
$respuesta = iniciarSesion($usuario->correo, $usuario->password);

if($respuesta){

	$usuario = [
		"nombreUsuario" => $respuesta->nombre,
		"idUsuario" => $respuesta->id
	];

	echo json_encode(["resultado" => true, "datos" => $usuario]);
} else {
	echo json_encode(["resultado" => false]);
}
