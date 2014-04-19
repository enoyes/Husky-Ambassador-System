<?php

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$guidename = $_POST["name"];
$coverage = $_POST["coverage"];
$time = time() + 60 * 60;
$newtime = date('H:i', $time);
$weekday = date(w, $time);
$realday = "";
if ($weekday == 0) {
    $realday = "Sunday";
} else if ($weekday == 1) {
    $realday = "Monday";
} else if ($weekday == 2) {
    $realday = "Tuesday";
} else if ($weekday == 3) {
    $realday = "Wednesday";
} else if ($weekday == 4) {
    $realday = "Thursday";
} else if ($weekday == 5) {
    $realday = "Friday";
} else if ($weekday == 6) {
    $realday = "Saturday";
}

$date = date('Md', $time);

$res = $mysqli->query("UPDATE " . $realday . "10AM SET " . $date . "=3 WHERE $date=0");
$res = $mysqli->query("UPDATE " . $realday . "11AM SET " . $date . "=3 WHERE $date=0");
$res = $mysqli->query("UPDATE " . $realday . "12PM SET " . $date . "=3 WHERE $date=0");

if ($realday != "Saturday") {
    $res = $mysqli->query("UPDATE " . $realday . "2PM SET " . $date . "=3 WHERE $date=0");
    $res = $mysqli->query("UPDATE " . $realday . "3PM SET " . $date . "=3 WHERE $date=0");
    $res = $mysqli->query("UPDATE " . $realday . "4PM SET " . $date . "=3 WHERE $date=0");
}

$res = $mysqli->query("SELECT Name FROM " . $realday . "10AM WHERE " . $date . "=3");
if ($res->num_rows > 0) {
    $res->data_seek(0);

    while ($row = $res->fetch_assoc()) {
        $res2 = $mysqli->query("UPDATE GuideList SET missed=missed + 1 WHERE Name=" . "'" . $row['Name'] . "'");
    }
}

$res = $mysqli->query("SELECT Name FROM " . $realday . "11AM WHERE " . $date . "=3");

if ($res->num_rows > 0) {
    $res->data_seek(0);

    while ($row = $res->fetch_assoc()) {
        $res2 = $mysqli->query("UPDATE GuideList SET missed=missed + 1 WHERE Name=" . "'" . $row['Name'] . "'");
    }
}


$res = $mysqli->query("SELECT Name FROM " . $realday . "12PM WHERE " . $date . "=3");
if ($res->num_rows > 0) {
    $res->data_seek(0);

    while ($row = $res->fetch_assoc()) {
        $res2 = $mysqli->query("UPDATE GuideList SET missed=missed + 1 WHERE Name=" . "'" . $row['Name'] . "'");
    }
}

if ($realday != "Saturday") {
    $res = $mysqli->query("SELECT Name FROM " . $realday . "2PM WHERE " . $date . "=3");
    if ($res->num_rows > 0) {
        $res->data_seek(0);

        while ($row = $res->fetch_assoc()) {
            $res2 = $mysqli->query("UPDATE GuideList SET missed=missed + 1 WHERE Name=" . "'" . $row['Name'] . "'");
        }
    }

    $res = $mysqli->query("SELECT Name FROM " . $realday . "3PM WHERE " . $date . "=3");
    if ($res->num_rows > 0) {
        $res->data_seek(0);

        while ($row = $res->fetch_assoc()) {
            $res2 = $mysqli->query("UPDATE GuideList SET missed=missed + 1 WHERE Name=" . "'" . $row['Name'] . "'");
        }
    }

    $res = $mysqli->query("SELECT Name FROM " . $realday . "4PM WHERE " . $date . "=3");
    if ($res->num_rows > 0) {
        $res->data_seek(0);

        while ($row = $res->fetch_assoc()) {
            $res2 = $mysqli->query("UPDATE GuideList SET missed=missed + 1 WHERE Name=" . "'" . $row['Name'] . "'");
        }
    }
}

?>