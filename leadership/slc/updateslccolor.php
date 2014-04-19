<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] != "SLC") {
    header("location:http://matthewclamp.com/prototype/index.php");
}
?>

<?php

$uid = $_GET["uid"];
$date = $_GET["date"];

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res2 = $mysqli->query("UPDATE Evaluations SET `SLCColor`='$_POST[slccolor]' WHERE `UID`=$uid AND `Date`='$date'");
echo "Update successful!";
echo "<a href='http://matthewclamp.com/prototype/leadership/slc/openaudit.php?uid=" . $uid . "&date=" . $date . "'><button type='submit'>Go Back</button></a>";

?>