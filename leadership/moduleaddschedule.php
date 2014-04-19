<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    echo "Insufficient Permissions!";
}
include "../sql_login.php";

$uid = $_GET['uid'];
?>
<div id="dayofweekselect">
	<label>Day of Week:</label>
	<select id="allweekdays" class="form-control">
		<option value='0'></option>
		<option value='1'>Monday</option>
		<option value='2'>Tuesday</option>
		<option value='3'>Wednesday</option>
		<option value='4'>Thursday</option>
		<option value='5'>Friday</option>
		<option value='6'>Saturday</option>
	</select>
</div>
<br>
<div id="timeselect">
	<label>Time:</label>
	<select id="alltimes" class="form-control">
		<option value='0'></option>
		<option value='9'>8:45 AM - 9:15 AM</option>
		<option value='10'>10:00 AM</option>
		<option value='10'>9:45 AM - 10:15 AM</option>
		<option value='11'>11:00 PM</option>
		<option value='11'>10:45 AM - 11:15 AM</option>
		<option value='12'>12:00 PM</option>
		<option value='12'>11:45 AM - 12:15 PM</option>
		<option value='13'>1:00 PM</option>
		<option value='13'>12:45 PM - 1:15 PM</option>
		<option value='14'>2:00 PM</option>
		<option value='14'>1:45 PM - 2:15 PM</option>
		<option value='15'>3:00 PM</option>
		<option value='15'>2:45 PM - 3:15 PM</option>
		<option value='16'>4:00 PM</option>
	</select>
</div>
<br>
<div id="typeselect">
	<label>Type:</label>
	<select id="alltypes" class="form-control">
		<option value='0'>Explore NU</option>
		<option value='2'>IV</option>
		<option value='1'>Athletic</option>
		<option value='3'>Mingle</option>
	</select>
</div>
<br><br><br>
<button id="addtosched" class="operation" data-pro='1'>Add To Schedule</button>
<button id="closeaddtosched" class="togbutton" data-type='add'>Close</button>

<script>
$("#addtosched").click(addtoschedule);
$("#closeaddtosched").click(toggleadd2);

function addtoschedule(){
	var uid = <?php echo $uid ?>;
	var day = $("#allweekdays").val();
	var time = $("#alltimes").val();
	var type = $("#alltypes").val(); 
	
	if (uid == 0){alert("Please choose an HA!"); return -1;}
	if (day == 0){alert("Please choose a day!"); return -1;}
	if (time == 0){alert("Please choose a time!"); return -1;}
	
	$.ajax({
		type: "POST",
		url: "processaddschedule.php",
		data: {uid:uid, day:day, time:time, type:type, process:1}
	})
	.done(function(msg){
		$("#pschedule").load("processgetschedule.php?uid=<?php echo $uid ?>");
		alert(msg);
		toggleadd2();
	});
}
</script>