<?php

$name = $_POST["coverage"];
$day = $_POST["day"];
$time = $_POST["time"];
$email = $_POST["email"];
$type = $_POST["type"];

$name = htmlentities($name, null, 'utf-8');
$name = str_replace("&nbsp;", " ", $name);


$firstname = substr($name, 0, strpos($name, " "));
$lastname = substr($name, strpos($name, " ") + 1);

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res1 = $mysqli->query("SELECT * FROM Availability WHERE `$day$time`=1");
$res1->data_seek(0);

$emails = "clamp.m@husky.neu.edu";

while ($row = $res1->fetch_assoc()) {
    $emails = $emails . "," . $row['Email'];
}

$res2 = $mysqli->query("SELECT * FROM Availability WHERE `FirstName`='$firstname' AND `LastName`='$lastname'");
$res2->data_seek(0);

$originemail = "";
while ($row = $res2->fetch_assoc()) {
    $originemail = $row['Email'];
}

$res3 = $mysqli->query("INSERT INTO `Coverages`(`Name`, `Day`, `Time`, `TourType`, `Date`, `Covered`) VALUES ('$name', '$day', '$time', '$type', '$date', 0)");

$to = $emails;
$subject = "HUSKY AMBASSADORS: " . $name . " needs tour coverage for his/her $type tour on $day at $time - $date!";
$message = $email . "\n \n \n Remember to go to www.matthewclamp.com/prototype/tour_portal/coveratour.php and find this tour if you'd like to cover it!";
$from = $originemail;
$headers = "From:" . $from;
mail($to, $subject, $message, $headers);

echo "Email sent, coverage posted to the coverage list!"

?>