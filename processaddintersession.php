<?php session_start();
include 'sql_login.php';

$uid = $_POST['uid'];
$type = $_POST['type'];
$date = $_POST['date'];
$time = $_POST['time'];

$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
if ($type == 3){
		$timeadd = array(9=>'8:45 AM - 9:15 AM',
						10=>'9:45 AM - 10:15 AM', 
						11=>'10:45 AM - 11:15 AM', 
						12=>'11:45 AM - 12:15 PM', 
						1=>'12:45 PM - 1:15 PM', 
						2=>'1:45 PM - 2:15 PM', 
						3=>'2:45 PM - 3:15 PM', 
						4=>'3:45 PM - 4:15 PM');
}
else{
	$timeadd = array(10=>'10 AM', 11=>'11 AM', 12=>'12 PM', 1=>'1 PM', 2=>'2 PM', 3=>'3 PM', 4=>'4 PM');
}
$q = "
	SELECT ia.uid, ia.type
	FROM int_attendance ia 
	WHERE ia.date = $date
	AND ia.time = $time";
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

$max = array(8, 2, 2, 3);

$error = 0;
$fullness = 0;
while ($people = mysqli_fetch_array($result)){
	if ($people['type'] == $type){$fullness += 1;}
	if ($people['uid'] == $uid){$error = 1;}
}

if ($error == 1){
	echo "Sorry, you are already added to the ".$timeadd[$time]." slot, don't be an overachiever!";
	exit;
}

if ($fullness >= $max[$type]){
	echo "Sorry, the ".$timeadd[$time]." slot for ".$tourtypes[$type]." has already been filled :(  (".$max[$type]." Maximum)";
	exit;
}

$q = "INSERT INTO int_attendance VALUES (1, $uid, '$date', $time, $type, 0)";
mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

echo "You are now signed up for an ".$tourtypes[$type]." at ".$timeadd[$time]."!";

?>
