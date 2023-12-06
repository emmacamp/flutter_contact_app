<?php

$connect = new mysqli("localhost","root","","contacts_bd");

if($connect){	
	// echo "Conexión exitosa";
}else{
	echo "Fallo, revise ip o firewall";
	exit();
}