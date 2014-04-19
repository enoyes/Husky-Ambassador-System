<?php

include "../sql_login.php";

$messcon = array("", "Reminder should be sent.", "Reminder should be sent.", "Action should be taken.", "Immediate action should be taken.", 
					"Immediate action should be taken.", "Immediate action should be taken.", "Immediate action should be taken.", "Immediate action should be taken.",
					"Immediate action should be taken.", "Immediate action should be taken.", "Immediate action should be taken.", "Immediate action should be taken.");

$q = "SELECT m.uid, mr.first_name, mr.last_name, m.missed, r.status FROM (SELECT uid, count(*) AS missed FROM attendance WHERE status = 3 group by uid) m 
		INNER JOIN master_roster mr ON m.uid = mr.uid 
		LEFT JOIN requirements r ON r.uid = m.uid AND r.event = 'email level' WHERE missed >= 1"; // Get all users with more than 1 3's
$res = mysqli_query($mysqli, $q);

while ($row = mysqli_fetch_array($res)) {
	if ($row['status'] == NULL) {
		$to = "clamp.m@husky.neu.edu, h.burnett@neu.edu";
		$subject = $row['first_name'] . " " . $row['last_name'] . " now has ".$row['missed']." absences";
		$message = $messcon[$row['missed']];
		$from = "operations@matthewclamp.com";
		$headers = "From:" . $from;
		mail($to, $subject, $message, $headers);
		mysqli_query($mysqli, "INSERT INTO requirements VALUES(".$row['uid'].", 'email level', ".$row['missed'].")");
	}
	else if ($row['status'] < $row['missed']){
		$to = "clamp.m@husky.neu.edu, h.burnett@neu.edu";
		$subject = $row['first_name'] . " " . $row['last_name'] . " now has ".$row['missed']." absences";
		$message = $messcon[$row['missed']];
		$from = "operations@matthewclamp.com";
		$headers = "From:" . $from;
		mail($to, $subject, $message, $headers);
		mysqli_query($mysqli, "UPDATE requirements SET status = ".$row['missed']." WHERE uid = ".$row['uid']." AND event = 'email level'");
	}
	
}


echo "Reached end of file.";

?>