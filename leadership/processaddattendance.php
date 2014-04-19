<?php
include "../sql_login.php";

$uid = $_POST['uid'];
$date = $_POST['date'];
$status = $_POST['status'];
$time = $_POST['time'];
$type = $_POST['type'];

$date = date('Y-m-d', strtotime($date));

$week = date('W', strtotime($date)) - 2;
$weekday = date('w', strtotime($date));

$q = "INSERT INTO attendance VALUES($uid, $weekday, $time, $type, $week, $status, 5, NULL)";
mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

echo "Success!";
?>