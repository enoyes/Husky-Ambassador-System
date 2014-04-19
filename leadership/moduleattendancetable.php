<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    echo "Insufficient Permissions!";
}
include "../sql_login.php";

$uid = $_GET['uid'];


?>
<table id="pschedule" class='personalizedschedule'>
	<caption>Attendance</caption>
	<tr>
		<td>Week</td>
		<td>Date</td>
		<td>Status</td>
		<th>Type</td>
		<th>Day</td>
		<th>Time</td>
		<th>Delete</td>
	</tr>
<?php
$q = "SELECT * FROM attendance WHERE uid=$uid ORDER BY week, day";
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
date_default_timezone_set('EST');
$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
$daycon = array("", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");

$statuscon = array("Excused", "Attended", "Covered", "Missed", "Excused", "",  "Additional");

$mtimecon = array(9=>'8:45 AM - 9:15 AM', 10=>'9:45 AM - 10:15 AM', 11=>'10:45 AM - 11:15 AM', 12=>'11:45 AM - 12:15 PM', 
				 13=>'12:45 PM - 1:15 PM', 14=>'1:45 PM - 2:15 PM', 15=>'2:45 PM - 3:15 PM');
$ttimecon = array(10=>'10:00 AM', 11=>'11:00 AM', 12=>'12:00 PM', 13=>'1:00 PM', 14=>'2:00 PM', 15=>'3:00 PM', 16=>'4:00 PM');


while($person = mysqli_fetch_array($result)){
	$weekdiff = date('W') - 2 - $person['week'];
	$date=  date('n/j/y', strtotime("-$weekdiff WEEK ".$daycon[$person['day']], strtotime("-1 WEEK Sunday")));
	//$week =  2 + $person['week'];
	//$date=  date('n/j/y', strtotime("$week WEEK ".$daycon[$person['day']]));
	if ($person['type'] == 3){$use = $mtimecon;}
	else {$use = $ttimecon;}
	echo	
		"<tr >
			<td>".$person['week']."</td>
			<td>$date</td>
			<td>".$statuscon[$person['status']]."</td>
			<td>".$tourtypes[$person['type']]."</td>
			<td>".$daycon[$person['day']]."</td>
			<td>".$use[$person['time']]."</td>
			<td><button class='removesattend' data-uid='$uid' data-day='".$person['day']."' data-time='".$person['time']."' data-week='".$person['week']."'>X</button></td>
		</tr>";
}
?>
</table>

<button id="addattendancebutton">Add</button>

<script>
$("#addattendancebutton").click(toggleadd);

$(".removesattend").click(function(){
	remove_row($(this).data('uid'), $(this).data('day'), $(this).data('time'), $(this).data('week'));
});

function toggleadd(){
	var state = $("#addrow").css("display");
	if (state == "none"){
		$("#addrow-inner").load("moduleaddattendance.php?uid=<?php echo $uid?>");
		$("#addrow").show();
		$("#greyout").show();
	}
	else{
		$("#addrow").hide();
		$("#greyout").hide();
	}
}
</script>


