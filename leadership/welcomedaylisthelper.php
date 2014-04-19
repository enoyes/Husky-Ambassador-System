<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    header("location:http://matthewclamp.com/prototype/index.php");
}
?>

<?php
$event = $_GET['q'];

include "../sql_login.php";

$i = array("", "Attended");
$t = array("Guide", "", "", "Mingler");

if ($event == 0){
	$q = "SELECT mr.first_name, mr.last_name, mr.type FROM master_roster mr
			WHERE mr.uid NOT IN (SELECT uid FROM requirements WHERE event LIKE 'WD%') ORDER BY mr.type, mr.first_name";
	$res = mysqli_query($mysqli, $q) or die (mysqli_error($mysqli));
	
	while ($row = mysqli_fetch_array($res)) {
		echo $row['first_name']." ".$row['last_name']." (".$t[$row['type']].")<br>";
	}
	exit;
}

$q = "SELECT mr.first_name, mr.last_name, mr.type, r.status FROM requirements r 
		INNER JOIN master_roster mr ON mr.uid = r.uid WHERE event = '$event' ORDER BY r.status, mr.first_name";
$res = mysqli_query($mysqli, $q) or die (mysqli_error($mysqli));

while ($row = mysqli_fetch_array($res)) {
    echo $row['first_name']." ".$row['last_name']." (".$t[$row['type']].")   -   ".$i[$row['status']] . "<br>";
}
?>