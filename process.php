<?php

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$highschool = $_POST["highSchool"];
$highschool = htmlentities($highschool, null, 'utf-8');
$highschool = str_replace("'", "", $highschool);

$hometown = $_POST["homeTown"];
$hometown = htmlentities($hometown, null, 'utf-8');
$hometown = str_replace("'", "", $hometown);

$name = $_POST["attendance"];

$res2 = $mysqli->query("INSERT INTO MasterRoster2014(LastName, FirstName, Hometown, State, Country, Gender, HighSchool, Major, College, GraduationYear, Email, PhoneNumber, SemesterStarted, Ethnicity, TrainedOnIV, TrainedOnAthletics, HereInFall) VALUES
('$_POST[lastName]','$_POST[firstName]','$hometown',
'$_POST[state]','$_POST[country]','$_POST[gender]','$highschool','$_POST[major]','$_POST[college]',
'$_POST[graduationYear]','$_POST[email]','$_POST[phoneNumber]','$_POST[semesterStarted]','$_POST[ethnicity]','$_POST[trainedOnIv]',
'$_POST[trainedOnAthletics]', '$_POST[hereInFall]')");

$res3 = $mysqli->query("UPDATE GuideList SET `TrainingAttendance`=1 WHERE `Name`='$name'");
echo '<FORM METHOD="LINK" ACTION="roster.php">
    <INPUT TYPE="submit" VALUE="Go Back">
</FORM>';
echo "Thanks for submitting your information, here's an extremely cute picture!\n";
echo "<img src=http://www.myhdwallpapers.org/img/2013/02/cute-animal-wallpaper-and-desktop-background-in-1024x768-px-resolution-id1610.jpg width='500' height='200' />";

?>