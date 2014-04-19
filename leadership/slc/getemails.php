<?php

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                        if ($mysqli->connect_errno) {
                            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                        }

$time = $_POST["time"];
$day = $_POST["day"];
$res = "";
$emails = "clamp.m@husky.neu.edu";
if ($time == "All") {
$res = $mysqli->query("SELECT * FROM master_schedule ms INNER JOIN master_roster mr ON mr.uid = ms.uid WHERE ms.day = $day");

	} else {
	$res = $mysqli->query("SELECT * FROM master_schedule ms INNER JOIN master_roster mr ON mr.uid = ms.uid WHERE ms.day = $day AND ms.time=$time");
	}
	
	$res->data_seek(0);
	while ($row = $res->fetch_assoc()) {
		$emails = $emails . ", " . $row["email"];
	}
	
	echo 'mailto:clamp.m@husky.neu.edu?bcc=' . $emails;
	?>
	