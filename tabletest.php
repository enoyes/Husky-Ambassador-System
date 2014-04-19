<?php session_start();
include 'sql_login.php';
$date = $_GET['date'];
$mingle = $_GET['mingle'];

$day = date ('w', strtotime($date));
?>

<div id="showall">Show All</div>

<table id="datetable" class="table table-striped table-hover " >

<?php

if ($mingle == 1){
	$mtg = '=';
	$timeadd = array(9=>'8:45 AM - 9:15 AM',
					10=>'9:45 AM - 10:15 AM', 
					11=>'10:45 AM - 11:15 AM', 
					12=>'11:45 AM - 12:15 PM', 
					13=>'12:45 PM - 1:15 PM', 
					14=>'1:45 PM - 2:15 PM', 
					15=>'2:45 PM - 3:15 PM', 
					16=>'3:45 PM - 4:15 PM');
	if ($day == 0 || $day == 6){
		$times = array(9, 10, 11); 
	}
	else{
		$times = array(9, 10, 11, 13, 14, 15);
	}
	
	$selecttt = "<select name='type' id='intertype'><option value='3'>Mingle</option></select>";
}
if ($mingle == 0){
	$mtg = '<>';
	$timeadd = array(10=>'10 AM', 11=>'11 AM', 12=>'12 PM', 13=>'1 PM', 14=>'2 PM', 15=>'3 PM', 16=>'4 PM');
	if ($day == 0 || $day == 6){
		$times = array(10, 11, 12); 
	}
	else{
		$times = array(10, 11, 12, 14, 15, 16);
	}
	
	
	$selecttt = "<select name='type' id='intertype'>
					<option value='0'>Explore NU</option>
				</select> ";
	
}

$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
$bgtourcolors = array('#E7ABAB', '#ABE7AD', '#B0ABE7', 'rgb(226, 231, 171)');



// Get the list of people and generate a select ------------------

$q = "SELECT uid, first_name, last_name FROM master_roster ORDER BY first_name";
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

while ($people = mysqli_fetch_array($result)){
	$roster[] = $people;
}

$selectud = "<select name='uid' id='userdrop'><option value='0'/>";

foreach ($roster as $person){
	$selectud .= "<option value='".$person['uid']."'>".$person['first_name']." ".$person['last_name']."</option>";
}
$selectud .= "</select>";

// ---------------------------------------------------------

$q = "
	SELECT ia.time, ia.type, mr.first_name, mr.last_name
	FROM int_attendance ia
	INNER JOIN master_roster mr ON mr.UID = ia.uid
	WHERE ia.date = '$date'
	AND ia.type $mtg 3
	ORDER BY ia.type";

$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));

$row = array();

while ($people = mysqli_fetch_array($result)){

$row[] = $people;

}

foreach($times as $t){

$entry = 0;
$temp = $selecttt;
if (($day == 0 || $day == 6) && ($mingle == 0)){
	if ($t == 10){
		$temp = "<select name='type' id='intertype'>
						<option value='0'>Explore NU</option>
						<option value='1'>Athletic</option>
				</select> ";
	}
	if ($t == 11){
	$temp = "<select name='type' id='intertype'>
					<option value='0'>Explore NU</option>
					<option value='2'>IV</option>
			</select> ";
	}
}
else if (($day == 5) && ($mingle == 0)){
	if ($t == 12 || $t == 15){
		$temp = "<select name='type' id='intertype'>
						<option value='0'>Explore NU</option>
						<option value='1'>Athletic</option>
						<option value='2'>IV</option>
				</select> ";
	}
}
else if ($mingle == 0){
	if ($t == 12){
		$temp = "<select name='type' id='intertype'>
				<option value='0'>Explore NU</option>
				<option value='1'>Athletic</option>
						<option value='2'>IV</option>
				</select> ";
	}
	if ($t == 15){
		$temp = "<select name='type' id='intertype'>
						<option value='0'>Explore NU</option>
						<option value='1'>Athletic</option>
						<option value='2'>IV</option>
				</select> ";
	}
}
else {}
					
					

echo
	"
	<tr class='tablelarge'>
		<td>
			<div id='arrow".$t."' class='dropdown'>&#9660</div>
			<div class='tabletime'>".$timeadd[$t]."</div>
			" . $temp . $selectud . "
			<input type='submit' data-time='$t'></input>
			</div>
		</td>
	</tr>
	";
	
foreach($row as $person){

if ($person['time'] == $t ){

echo	
	"<tr class='person".$t."' style='display:none;background:".$bgtourcolors[$person['type']]."'>
		<td>".$person['first_name']. " " . $person['last_name'] . " -- ".$tourtypes[$person['type']]."</td>
	</tr>"
	;
$entry = 1;
	}
	

	}
	
	if ($entry == 0){
	
	echo	
	"<tr class='person".$t."' style='display:none;background:#F1F1F1'>
		<td>No entries for this time</td>
	</tr>"
	;
	
	}
	}
?>
</table>

<script>

$('.dropdown').click(function(){

	toggledd(($(this).attr('id')).substring(5, 15));

});


$("#showall").click(toggleall);

$(":submit").click(submit_inter);

function submit_inter(){
	var vtime = $(this).data('time');
	var vdate = <?php echo "'".$date."'"; ?>;
	var vuid = $(this).prev().val();
	var vtype = $(this).prev().prev().val();
	
	if (vuid == 0){
		alert("Please select a valid name");
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "processaddintersession.php",
		data: {date: vdate, time: vtime, uid: vuid, type: vtype}
	})
	.done(function(msg){
		alert(msg);
		location.reload();
	});

}

function toggledd(t){
	var personclass = ".person" + t;
	var state = $(personclass).css("display");
	if (state == "none"){
		$(personclass).show();
	}
	else{
		$(personclass).hide();
	}
}

function toggleall(){
	if ($("#showall").html().substring(0, 4) == "Show"){
		$("[class^=person]").show();
		$("#showall").html("Hide All");
	}
	else{
		$("[class^=person]").hide();
		$("#showall").html("Show All");
	}
}
</script>