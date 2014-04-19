<?php
/**
 * Created by PhpStorm.
 * User: matthewclamp
 * Date: 2/25/14
 * Time: 7:21 PM
 */
$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("SELECT `Name` FROM `GuideList` WHERE `Name` LIKE '%(M)%'");

$res->data_seek(0);

while ($row = $res->fetch_assoc()) {
    $break = explode(" ", $row['Name']);
    $res2 = $mysqli->query("UPDATE `MasterRoster2014` SET `Level`='M' WHERE `FirstName`='$break[0]' AND `LastName`='$break[1]'");
}

?>