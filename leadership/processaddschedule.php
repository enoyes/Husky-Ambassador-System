<?php

include "../sql_login.php";

$uid = $_POST['uid'];
$day = $_POST['day'];
$time = $_POST['time'];
$type = $_POST['type'];
$process = $_POST['process'];

if ($process == 1){
	$q = "INSERT INTO master_schedule VALUES($uid, $day, $time, $type)";
	mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
	echo "Added to Schedule!";
	exit;
}

if ($process == 2){
	$q = "DELETE FROM master_schedule WHERE uid = $uid AND day = $day AND time = $time";
	mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
	echo "Successfully Removed!";
	exit;
}


?>