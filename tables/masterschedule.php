<table id="datetable">
	
<?php
include '../sql_login.php';

$bgtourcolors = array('#E7ABAB', '#ABE7AD', '#B0ABE7', 'rgb(226, 231, 171)');
$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
$daycon = array("", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");




$mtimecon = array(9=>'8:45 AM - 9:15 AM', 10=>'10AM / 9:45 AM - 10:15 AM', 11=>'11 AM/ 10:45 AM - 11:15 AM', 12=>'12PM / 11:45 AM - 12:15 PM', 
				 13=>'12:45 PM - 1:15 PM', 14=>'2PM / 1:45 PM - 2:15 PM', 15=>'3PM / 2:45 PM - 3:15 PM', 16=>'4PM');
				 
$q = "SELECT mr.uid, mr.first_name, mr.last_name, ms.day, ms.time, ms.type FROM master_schedule ms
		INNER JOIN master_roster mr ON mr.uid = ms.uid ORDER BY ms.day, ms.time, mr.type, mr.last_name";
		
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
$row = array();

while ($people = mysqli_fetch_array($result)){
	$row[] = $people;
}

for ($day = 1; $day < 7; $day++){
	echo "<tr class='schedDay'>
			<div>".$daycon[$day]."</div>
			</tr>";
	
	foreach($row as $person){
	if ($person['day'] == $day){
	echo	
		"<tr class='person".$day."' style='display:none;background:".$bgtourcolors[$person['type']]."'>
			<td>".$person['first_name']. " " . $person['last_name'] . " -- ".$tourtypes[$person['type']]."</td>
		</tr>";
	}
		
	}
}


?>
</table>
