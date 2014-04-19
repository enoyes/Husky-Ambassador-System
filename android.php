<?php

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("SELECT Name FROM `GuideList` ORDER BY Name ASC");

$res->data_seek(0);

$arr = array();
$count = 0;
while ($row = $res->fetch_assoc()) {
    $arr[] = array("Name" => $row['Name']);
    $count = $count + 1;
}

print(json_encode($arr));

?>