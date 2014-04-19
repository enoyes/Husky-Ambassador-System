<?php

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("SELECT * FROM Coverages");

$res->data_seek(0);

$date = date('Y-m-d');

echo $date;

while ($row = $res->fetch_assoc()) {
    if ($row["Date"] == $date && $row["Covered"] == 0) {
        $ans = $mysqli->query("UPDATE `Coverages` SET `Covered`=1,`Coverer`='Not Covered' WHERE `CID`=$row[CID]");
    } else if ($row["Date"] == $date && $row["Covered"] == 1) {
        $ans = $mysqli->query("UPDATE `GuideList` SET missed=missed + 1 WHERE `Name`='$row[Coverer]'");
    }
}

?>