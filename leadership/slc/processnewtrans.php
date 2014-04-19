<?php

$chair = $_GET['chair'];
$date = $_POST['date'];
$cat = $_POST['category'];
$desc = $_POST['desc'];
$amt = $_POST['amt'];

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("UPDATE `Category` SET `Actual`=`Actual` + $amt WHERE `Chair`='$chair' AND `Category`='$cat'");
$res2 = $mysqli->query("UPDATE `Category` SET `Actual`=`Actual` + $amt WHERE `Chair`='$chair' AND `Category`='Total'");
$res3 = $mysqli->query("INSERT INTO `Transactions`(`Chair`, `Date`, `Category`, `Description`, `Amount`) VALUES ('$chair','$date','$cat', '$desc', '$amt')");

echo "Transaction added!";
echo '<FORM METHOD="LINK" ACTION="budget.php">
    <INPUT TYPE="submit" VALUE="Go Back">
</FORM>';
?>