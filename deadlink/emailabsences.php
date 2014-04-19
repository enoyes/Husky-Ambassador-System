<?php

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("SELECT * FROM GuideList WHERE missed=4");
if ($res->num_rows > 0) {
    $res->data_seek(0);

    while ($row = $res->fetch_assoc()) {
        if ($row['EmailLevel'] < 4) {
            $to = "clamp.m@husky.neu.edu, h.burnett@neu.edu";
            $subject = $row['Name'] . " now has 4 absences";
            $message = "Immediate action should be taken.";
            $from = "operations@matthewclamp.com";
            $headers = "From:" . $from;
            mail($to, $subject, $message, $headers);
        }
        $resnew = $mysqli->query("UPDATE GuideList SET EmailLevel=4 WHERE Name=" . "'" . $row['Name'] . "'");
    }
}

$res2 = $mysqli->query("SELECT * FROM GuideList WHERE missed=3");
if ($res2->num_rows > 0) {
    $res2->data_seek(0);

    while ($row = $res2->fetch_assoc()) {
        if ($row['EmailLevel'] < 3) {
            $to = "clamp.m@husky.neu.edu, h.burnett@neu.edu";
            $subject = $row['Name'] . " now has 3 absences";
            $message = "Action should be taken.";
            $from = "operations@matthewclamp.com";
            $headers = "From:" . $from;
            mail($to, $subject, $message, $headers);
        }
        $res2new = $mysqli->query("UPDATE GuideList SET EmailLevel=3 WHERE Name=" . "'" . $row['Name'] . "'");
    }
}

$res3 = $mysqli->query("SELECT * FROM GuideList WHERE missed=2");
if ($res3->num_rows > 0) {
    $res3->data_seek(0);

    while ($row = $res3->fetch_assoc()) {
        if ($row['EmailLevel'] < 2) {
            $to = "clamp.m@husky.neu.edu, h.burnett@neu.edu";
            $subject = $row['Name'] . " now has 2 absences";
            $message = "Reminder should be sent.";
            $from = "operations@matthewclamp.com";
            $headers = "From:" . $from;
            mail($to, $subject, $message, $headers);
        }
        $res3new = $mysqli->query("UPDATE GuideList SET EmailLevel=2 WHERE Name=" . "'" . $row['Name'] . "'");
    }
}

$res3 = $mysqli->query("SELECT * FROM GuideList WHERE missed=1");
if ($res3->num_rows > 0) {
    $res3->data_seek(0);

    while ($row = $res3->fetch_assoc()) {
        if ($row['EmailLevel'] == 0) {
            $to = "clamp.m@husky.neu.edu, h.burnett@neu.edu";
            $subject = $row['Name'] . " now has 1 absences";
            $message = "Reminder should be sent.";
            $from = "operations@matthewclamp.com";
            $headers = "From:" . $from;
            mail($to, $subject, $message, $headers);
        }
        $res3new = $mysqli->query("UPDATE GuideList SET EmailLevel=1 WHERE Name=" . "'" . $row['Name'] . "'");
    }
}

echo "Reached end of file.";

?>