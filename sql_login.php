<?php
// Use mysqli to connect db

$host = "localhost";
$username = "admin";
$password = "admin"; 
$db_name = "ha_main";

$mysqli = mysqli_connect($host, $username, $password, $db_name);

if ($mysqli->connect_errno) {
	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

?>