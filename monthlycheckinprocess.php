<?php
/**
 * Created by PhpStorm.
 * User: matthewclamp
 * Date: 2/25/14
 * Time: 5:31 PM
 */

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
$array = explode(" ", $_POST["shadow"]);
$res2 = $mysqli->query("INSERT INTO `requirements`(`uid`, `event`, `status`) VALUES ((SELECT uid FROM master_roster WHERE `first_name`='$array[0]' AND `last_name`='$array[1]'), 'MONTHLY-03-27', 1)");

echo "$_POST[shadow] checked in!";
?>