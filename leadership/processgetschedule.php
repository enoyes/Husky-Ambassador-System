<table id="pschedule" class='personalizedschedule'>
	<caption>Schedule</caption>
	<tr>
		<th>Name</td>
		<th>Type</td>
		<th>Day</td>
		<th>Time</td>
		<th>Delete</td>
	</tr>
<?php
include "../sql_login.php";


$uid = $_GET['uid'];

$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
$daycon = array("", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");

$mtimecon = array(9=>'8:45 AM - 9:15 AM', 10=>'9:45 AM - 10:15 AM', 11=>'10:45 AM - 11:15 AM', 12=>'11:45 AM - 12:15 PM', 
				 13=>'12:45 PM - 1:15 PM', 14=>'1:45 PM - 2:15 PM', 15=>'2:45 PM - 3:15 PM');
$ttimecon = array(10=>'10:00 AM', 11=>'11:00 AM', 12=>'12:00 PM', 13=>'1:00 PM', 14=>'2:00 PM', 15=>'3:00 PM', 16=>'4:00 PM');

$uid = $_GET['uid'];

$q = "SELECT mr.first_name, mr.last_name, ms.* FROM master_schedule ms INNER JOIN master_roster mr ON ms.uid = mr.uid WHERE ms.uid = $uid";
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

while($person = mysqli_fetch_array($result)){
	if ($person['type'] == 3){$use = $mtimecon;}
	else {$use = $ttimecon;}
	
	echo	
		"<tr >
			<td>".$person['first_name']." ".$person['last_name']."</td>
			<td>".$tourtypes[$person['type']]."</td>
			<td>".$daycon[$person['day']]."</td>
			<td>".$use[$person['time']]."</td>
			<td><button class='removesrow' data-uid='$uid' data-day='".$person['day']."' data-time='".$person['time']."'>X</button></td>
		</tr>";
}


?>
</table>
<button id="addnewschedule">Add</button>
<script>
$(".removesrow").click(function(){
	remove_row($(this).data('uid'), $(this).data('day'), $(this).data('time'), -1);
});

$("#addnewschedule").click(toggleadd2);

function toggleadd2(){
	var state = $("#addrow").css("display");
	if (state == "none"){
		$("#addrow-inner").load("moduleaddschedule.php?uid=<?php echo $uid?>");
		$("#addrow").show();
		$("#greyout").show();
	}
	else{
		$("#addrow").hide();
		$("#greyout").hide();
	}
}
</script>