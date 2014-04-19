<?php

include "../sql_login.php";

$uid = $_POST['uid'];
$fn = $_POST['fn'];
$ln = $_POST['ln'];
$gender = $_POST['gender'];
$type = $_POST['type'];
$email = $_POST['email'];
$iv = $_POST['iv'];
$ath = $_POST['ath'];
$phone = $_POST['phone'];
$sha = $_POST['sha'];
$eth = $_POST['eth'];
$major = $_POST['major'];
$college = $_POST['college'];
$gy = $_POST['gy'];
$ht = $_POST['ht'];
$state = $_POST['state'];
$country = $_POST['country'];
$hs = $_POST['hs'];

$q = "UPDATE master_roster 
		SET first_name = '$fn',
			last_name = '$ln',
			gender = '$gender',
			type = $type,
			email = '$email',
			trained_IV = $iv,
			trained_ath = $ath,
			phone = $phone,
			start_semester = '$sha',
			ethnicity = '$eth',
			major = '$major',
			college = '$college',
			grad_year = '$gy',
			highschool = '$hs',
			hometown = '$ht',
			country = '$country',
			state = '$state'
		WHERE uid = $uid";
mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

echo "Success!";





?>