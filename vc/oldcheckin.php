
<?php
include "../sql_login.php";

$uid = $_POST["uid"];
$shadow = $_POST["shadow"];
$support = $_POST["support"];

$daycon = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
$typecon = array("Explore NU", "Athletic", "IV", "Mingler");

date_default_timezone_set('EST');

$newtime = date('H:i'); // 24H : Leading 0s minute
$day = date('w'); // Day of the week
$curdate = date('Y-m-d'); // Current date
$week = date('W') - 2; // Week in the year
$time = date('G') + 2; // Hour of the day
//$day = $daycon[$day];
//$date = date('Md', $time);

$file = fopen("changelist.txt", "a+");

if ($shadow != 0) {
	$q = "SELECT first_name, last_name FROM master_roster WHERE uid = $shadow";
	$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
	$result = mysqli_fetch_array($result);
	$name = $result['first_name']." ".$result['last_name'];
	
	$answer = fwrite($file, $curdate . " " . $newtime . ": " . $name . " shadowed a tour!\n");
	
	$q = "INSERT INTO requirements VALUES($shadow, 'Shadowed', 1)";
	mysqli_query($mysqli, $q);
	
	echo "Thanks for shadowing a tour, " . $name . "!";
} 
else if ($support != 0) {
	$q = "SELECT first_name, last_name FROM master_roster WHERE uid = $support";
	$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
	$result = mysqli_fetch_array($result);
	$name = $result['first_name']." ".$result['last_name'];
	
	$answer = fwrite($file, $curdate . " " . $newtime  . ": " . $name . " assisted on a tour!\n");
	
	$q = "INSERT INTO requirements VALUES($support, 'Support', 1)";
	mysqli_query($mysqli, $q);
	
	echo "Thanks for supporting a tour, " . $support . "!";
}
elseif ($uid == 0) {
	echo "You did not choose a tour guide to check in.";
}
else {
	$q = "SELECT mr.first_name, mr.last_name, c.coverer FROM coverage c 
			INNER JOIN master_roster mr ON mr.uid = c.coverer
			WHERE c.day = $day AND c.time = $time AND c.week = $week";
	$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
	
	if (mysqli_num_rows($result) !== 0){
		$name = $result['first_name']." ".$result['last_name'];
		$q = "UPDATE coverage SET covered = 1 WHERE day = $day AND time = $time AND week = $week";
		mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
		echo "Thank you for covering a shift, $name";
	}
	else{
		$q = "SELECT mr.first_name, mr.last_name, ms.type FROM master_schedule ms 
				INNER JOIN master_roster mr ON mr.uid = ms.uid WHERE ms.uid = $uid AND ms.day = $day AND ms.time = $time";
		$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
		$result = mysqli_fetch_array($result);
		$type = $result['type'];
		$name = $result['first_name']." ".$result['last_name'];
		$q = "UPDATE attendance SET status = 1, timestamp = NULL WHERE uid = $uid AND day = $day AND time = $time AND week = $week";
		mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
		echo "$name is now checked in (day: $day, week: $week, time: $time";
	
	}
}


?>
