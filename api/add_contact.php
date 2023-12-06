<?php
include 'conexion.php';

// Obtiene los datos del nuevo contacto desde la solicitud POST.
$name = $_POST['name'];
$surname = $_POST['surname'];
$phone = $_POST['phone'];

// Inserta el nuevo contacto en la base de datos.
$sql = "INSERT INTO contacts (name, surname, phone) VALUES ('$name', '$surname', '$phone')";

if ($connect->query($sql) === true) {
	echo "Contacto añadido correctamente";
} else {
	echo "Error al añadir contacto: " . $connect->error;
}

// Cierra la conexión.
$connect->close();
