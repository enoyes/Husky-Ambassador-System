<?php

include "sql_login.php";

$coverer = $_POST["coverage"]; // Coverer id
$uid = $_POST['uid']; // Coveree id
$day = $_POST['day']; // Day of week of coverage
$time = $_POST['time']; // Time of coverage
$week = $_POST['week']; // Week of coverage

// Conversion Arrays
$mtimecon = array(9=>'8:45 AM - 9:15 AM', 10=>'9:45 AM - 10:15 AM', 11=>'10:45 AM - 11:15 AM', 12=>'11:45 AM - 12:15 PM', 
					 13=>'12:45 PM - 1:15 PM', 14=>'1:45 PM - 2:15 PM', 15=>'2:45 PM - 3:15 PM', 16=>'3:45 PM - 4:15 PM');
$ttimecon = array(10=>'10 AM', 11=>'11 AM', 12=>'12 PM', 13=>'1 PM', 14=>'2 PM', 15=>'3 PM', 16=>'4 PM');
$daycon = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
$typecon = array("Explore NU", "Athletic", "IV", "Mingler");

if ($coverer == 0) {
    echo "No name selected, coverage not recorded.";
	exit;
}

$q = "UPDATE coverage SET covered=2, coverer=$coverer WHERE uid=$uid AND day=$day AND time=$time AND week=$week";
mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

$q = "	SELECT mr1.email AS email1, mr2.email AS email2,
		mr1.first_name AS fn1, mr1.last_name AS ln1,
		mr2.first_name AS fn2, mr2.last_name AS ln2, c.date, c.type
		FROM coverage c 
		INNER JOIN master_roster mr1 ON mr1.uid = c.uid 
		INNER JOIN master_roster mr2 ON mr2.uid = c.coverer
		WHERE c.uid=$uid AND c.day=$day AND c.time=$time AND c.week=$week";
$result = mysqli_query($mysqli, $q);
$result = mysqli_fetch_array($result);
$covereename = $result["fn1"]." ".$result["ln1"]; // Person being covered
$coverername = $result["fn2"]." ".$result["ln2"]; // Coverer
$date = $result["date"]; // Date of the coverage
$emailcoveree = $result['email1']; // Coveree's email
$emailcoverer = $result['email2']; // Coverer's email
$type = $result['type']; // Type of coverage

if ($type == 3){$timecon = $mtimecon;} // Use the mingler times
else{$timecon = $ttimecon;} // Use the tour times


$q = "INSERT INTO attendance VALUES($uid, $day, $time, $type, $week, 2, 0, NULL)";
mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));



$to = "clamp.m@husky.neu.edu," . $emailcoveree . "," . $emailcoverer;
$subject = "HUSKY AMBASSADORS: ".$coverername
			." has agreed to cover $covereename"."'s ".$typecon[$type]." shift on "
			.$daycon[$day].", $date at ".$timecon[$time]."!";
$message = "Please let Matt Clamp and Hannah Burnett (clamp.m@husky.neu.edu, h.burnett@neu.edu) know if this was a mistake!";
$from = "clamp.m@husky.neu.edu";
$headers = "From:" . $from;
//mail($to, $subject, $message, $headers);

echo "Thank you for accepting this tour, an email has been sent to you and $covereename. It is now your responsibility to complete this tour!";




?>