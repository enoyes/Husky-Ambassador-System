<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    echo "Insufficient Permissions!";
}
include "../sql_login.php";

$uid = $_GET['uid'];
?>
<div>
	<label>Date:</label>
	<input type="date" id="maa_date" class="form-control"/>
</div>
<br>
<div>
	<label>Status:</label>
	<select id="maa_status" class="form-control">
		<option value='1'>Attended</option>
		<option value='4'>Excused</option>
		<option value='2'>Covered</option>
		<option value='3'>Missed</option>
	</select>
</div>
<br>
<div id="timeselect">
	<label>Time:</label>
	<select id="maa_times" class="form-control">
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
	<select id="maa_types" class="form-control">
		<option value='0'>Explore NU</option>
		<option value='2'>IV</option>
		<option value='1'>Athletic</option>
		<option value='3'>Mingle</option>
	</select>
</div>
<button id='savenewattendance' data-uid="<?php echo $uid ?>" >Save</button>
<button id='cancelnewattendance' data-uid="<?php echo $uid ?>" >Cancel</button>

<script>

$("#savenewattendance").click(saveattendance);
$("#cancelnewattendance").click(toggleadd);

function saveattendance(){
	var uid = <?php echo $uid ?>;
	var date = $("#maa_date").val();
	var status = $("#maa_status").val();
	var time = $("#maa_times").val();
	var type = $("#maa_types").val();
	
	if (time == 0){alert("Please choose a valid time"); return -1;}
	
	$.ajax({
		type: "POST",
		url: "processaddattendance.php",
		data: {uid: uid, date: date, status: status, time: time, type: type}
	})
	.done(function(){
		$("#attendancetable").load("moduleattendancetable.php?uid=" + uid);
		$("#attendance").load("moduleattendance.php?uid=" + uid);
		toggleadd();
	});
}

</script>