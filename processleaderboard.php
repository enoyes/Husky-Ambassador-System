<?php 
include "sql_login.php";

$scope = $_GET['scope'];
$scopetrans = array("Total Shifts", "Covered Shifts", "Additional Shifts");
?>



<table id="pschedule" class='personalizedschedule'>
	<caption><?php echo $scopetrans[$scope]; ?></caption>
	<tr style="font-weight: bold">
		<td>Rank</td>
		<td>Name</td>
		<td>Attended</td>
	</tr>

<?php

// Get all the tour guide attendances
if ($scope == 0){
$q = "SELECT mr.first_name, mr.last_name, count(*) AS attended 
		FROM attendance a 
		INNER JOIN master_roster mr on a.uid = mr.uid 
		WHERE status in (1, 6) AND week > 11
		AND a.type = 0
		GROUP BY a.uid 
		ORDER BY attended DESC, mr.last_name ";
}

// Get all the coverages
elseif ($scope == 1){
$q = "SELECT mr.first_name, mr.last_name, count(*) AS attended
		FROM coverage c
		INNER JOIN master_roster mr ON mr.uid = c.coverer
		WHERE c.covered = 1 AND week > 11
		AND c.type = 0
		GROUP BY c.coverer
		ORDER BY attended DESC, mr.last_name";
}

// Get all additional shifts
elseif ($scope == 2){
$q = "SELECT mr.first_name, mr.last_name, count(*) AS attended 
		FROM attendance a 
		INNER JOIN master_roster mr on a.uid = mr.uid 
		WHERE status = 6 AND week > 11
		AND a.type = 0
		GROUP BY a.uid 
		ORDER BY attended DESC, mr.last_name";
}

$lasthigh = 1000;
$rank = 0;

$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

while($person = mysqli_fetch_array($result)){
	
	$attended = $person['attended'];
	if ($attended < $lasthigh){
		$lasthigh = $attended;
		$rank += 1;
	}
	
	echo "	<tr>
				<td>$rank</td>
				<td>".$person['first_name']." ".$person['last_name']."</td>
				<td>$attended</td>
			</tr>";
	

}



?>