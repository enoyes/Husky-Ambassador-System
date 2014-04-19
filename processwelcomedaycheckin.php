<?php
$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$mysqli->query("UPDATE GuideList SET WelcomeDayAttendance=1 WHERE Name='$_POST[coverage]'");

echo "Checkin successful!<br>";
echo '<FORM METHOD="LINK" ACTION="welcomedaycheckin.php">
    <INPUT TYPE="submit" VALUE="Go Back">
</FORM>';

?>