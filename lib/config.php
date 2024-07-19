<?php
$host = "localhost";
$dbuser = "root";
$dbpwd = "";
$db = "redsocial2";
$connect = mysqli_connect ($host, $dbuser, $dbpwd,$db);
	if(mysqli_connect_error()){
		echo ("No se ha conectado a la base de datos");
	}
?>