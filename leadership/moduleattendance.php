<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    echo "Insufficient Permissions!";
}
include "../sql_login.php";

$yncon = array("No", "Yes");

$uid = $_GET['uid'];
mysqli_query($mysqli, "SET SQL_BIG_SELECTS=1");
$q = " SELECT mr.first_name, mr.last_name, m.missed, c.completed, co.coveree, co2.coverer, r2.status AS febmonth, r3.status AS train FROM master_roster mr
		LEFT JOIN (SELECT uid, count(*) AS missed FROM attendance WHERE status = 3 group by uid) m ON m.uid = mr.uid
		LEFT JOIN (SELECT uid, count(*) AS completed FROM attendance WHERE status = 1 group by uid) c ON c.uid = mr.uid
		LEFT JOIN (SELECT uid, count(*) AS coveree FROM attendance WHERE status = 2 group by uid) co ON co.uid = mr.uid
		LEFT JOIN (SELECT uid, count(*) AS coverer FROM coverage WHERE covered = 1 group by coverage.coverer) co2 ON co2.coverer = mr.uid
		LEFT JOIN requirements r2 ON r2.uid = mr.uid AND r2.event = 'MONTHLY-02-25'
		LEFT JOIN requirements r3 ON r3.uid = mr.uid AND r3.event = 'TRAIN-02-02'
		WHERE mr.uid=$uid";
		
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
$result = mysqli_fetch_array($result);

$missed = $result['missed'];
if ($missed == NULL){$missed = 0;}

$completed = $result['completed'];
if ($completed == NULL){$completed = 0;}

$coverer = $result['coverer'];
if ($coverer == NULL){$coverer = 0;}

$coveree = $result['coveree'];
if ($coveree == NULL){$coveree = 0;}

$train = $result['train'];
if ($train == NULL){$train = 0;}
$train = $yncon[$train];

$febmonth = $result['febmonth'];
if ($febmonth == NULL){$febmonth = 0;}
$febmonth = $yncon[$febmonth];
?>
<table id="infotable">
	<caption>Attendance Stats</caption>
	<tr>
		<td style="width:200px">Missed Shifts:</td>
		<td style="width:200px"><?php echo $missed; ?></td>
	<tr>
	<tr>
		<td>Completed Shifts:</td>
		<td><?php echo $completed; ?></td>
	<tr>
	<tr>
		<td>Covered Shifts:</td>
		<td><?php echo $coverer; ?></td>
	<tr>
	<tr>
		<td>Requested Coverage Shifts:</td>
		<td><?php echo $coveree; ?></td>
	<tr>
	<tr>
		<td>Febuary Training:</td>
		<td><?php echo $train; ?></td>
	<tr>
	<tr>
		<td>Febuary Monthly Meeting:</td>
		<td><?php echo $febmonth; ?></td>
	<tr>
	
</table>