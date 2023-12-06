<?php
include 'conexion.php';

// Obtiene el ID del contacto a eliminar desde la URL.
$id = $_GET['id'];

// Elimina el contacto de la base de datos.
$sql = "DELETE FROM contacts WHERE id = $id";

if ($connect->query($sql) === true) {
	echo "Contacto eliminado correctamente";
} else {
	echo "Error al eliminar contacto: " . $connect->error;
}

// Cierra la conexión.
$connect->close();
?>
