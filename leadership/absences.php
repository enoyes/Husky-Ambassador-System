<?php

include "../sql_login.php";


date_default_timezone_set('EST');


$day = date('w'); // Day of the week
$week = date('W') - 2; // Week in the year

$q = "UPDATE attendance SET status = 3 WHERE week = $week AND status = 0 AND day = $day";
mysqli_query($mysqli, $q);

$day = $day + 1;
if ($day == 1){ $week += 1;}

$q = "	INSERT INTO attendance 
		SELECT ms.uid, ms.day, ms.time, ms.type, $week, 0, 0, NULL FROM master_schedule ms
		LEFT JOIN attendance a 
		ON a.uid = ms.uid AND a.time = ms.time AND a.day = ms.day AND a.week = $week
		WHERE ms.day = $day
		AND a.status IS NULL";
mysqli_query($mysqli, $q);


?>