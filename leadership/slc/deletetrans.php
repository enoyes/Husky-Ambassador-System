<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] != "SLC") {
    header("location:http://matthewclamp.com/prototype/index.php");
}


$tid = $_GET['tid'];
$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("SELECT * FROM `Transactions` WHERE `id`=$tid");
$res->data_seek(0);

while ($row = $res->fetch_assoc()) {
    $query = $mysqli->query("UPDATE `Category` SET `Actual` = (`Actual` - $row[Amount]) WHERE `Category`='$row[Category]' AND `Chair`='$row[Chair]'");
    $query2 = $mysqli->query("UPDATE `Category` SET `Actual` = (`Actual` - $row[Amount]) WHERE `Category`='Total' AND `Chair`='$row[Chair]'");
    $query3 = $mysqli->query("DELETE FROM `Transactions` WHERE `id`=$tid");
}

echo "Deletion Complete!";
echo '<FORM METHOD="LINK" ACTION="budget.php">
    <INPUT TYPE="submit" VALUE="Go Back">
</FORM>';
?>