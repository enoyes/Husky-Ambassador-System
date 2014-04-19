<?php
include "../sql_login.php";

$uid = $_POST['uid'];
$day = $_POST['day'];
$time = $_POST['time'];
$week = $_POST['week'];
$process = $_POST['process'];

if ($process == 0){
	$q = "DELETE FROM attendance WHERE uid = $uid AND day = $day AND time = $time AND week = $week";
	mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
	echo "Successful removal!";
}
?>