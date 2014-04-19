<?php
include "sql_login.php";

$uid = $_POST["uid"];
$time = $_POST["time"];
$email = $_POST["email"];
$type = $_POST["type"];
$enterdate = $_POST["date"];


$enterdate = date('Y-m-d', strtotime($enterdate));
$day = date('w', strtotime($enterdate));
$week = date('W', strtotime($enterdate)) - 2;

$typecon = array("Explore NU", "Athletic", "IV", "Mingler");

if ($type == 3){
	$timecon = array(9=>'8:45 AM - 9:15 AM', 10=>'9:45 AM - 10:15 AM', 11=>'10:45 AM - 11:15 AM', 12=>'11:45 AM - 12:15 PM', 
					 13=>'12:45 PM - 1:15 PM', 14=>'1:45 PM - 2:15 PM', 15=>'2:45 PM - 3:15 PM', 16=>'3:45 PM - 4:15 PM');
}
else{
	$timecon = array(10=>'10 AM', 11=>'11 AM', 12=>'12 PM', 13=>'1 PM', 14=>'2 PM', 15=>'3 PM', 16=>'4 PM');
}

$daycon = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
$gendercon = array('male'=>'his', 'female'=>'her');
$res1 = "";

if ($type == 3) {
    $res1 = mysqli_query($mysqli, "SELECT ma.uid, mr.email FROM master_availability ma INNER JOIN master_roster mr ON mr.uid = ma.uid AND mr.type = $type WHERE ma.day=$day AND ma.time = $time ");
} else {
    $res1 = mysqli_query($mysqli, "SELECT ma.uid, mr.email FROM master_availability ma INNER JOIN master_roster mr ON mr.uid = ma.uid AND mr.type = 0 WHERE ma.day=$day AND ma.time = $time ");
}


$emails = "clamp.m@husky.neu.edu";

while ($row = mysqli_fetch_array($res1)) {
    $emails .= "," . $row['email'];
}


$res2 = mysqli_query($mysqli, "SELECT first_name, last_name, gender, email FROM master_roster WHERE uid = $uid");
$res2 = mysqli_fetch_array($res2);
$originemail = $res2['email'];
$firstname = $res2['first_name'];
$lastname = $res2['last_name'];
$pronoun = $gendercon[$res2['gender']];

$q = "INSERT INTO coverage VALUES($uid, $day, $time, $type, $week, '$enterdate', 0, NULL, NULL)";
mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

$to = "operations@matthewclamp.com";
$subject = "HUSKY AMBASSADORS: $firstname $lastname needs tour coverage for $pronoun ".$typecon[$type]." shift on ".$daycon[$day]." at ".$timecon[$time]." - $enterdate!";
$message = $email . "\n \n \n Remember to go to www.matthewclamp.com/prototype/coveratour.php and find this shift if you'd like to cover it!";
$from = $originemail;
$headers = "";
$headers .= "From:" . $from . "\r\n";
$headers .= "Bcc:" . $emails . "\r\n";


//mail($to, $subject, $message, $headers);

echo "Email sent, coverage posted to the coverage list!"

?>