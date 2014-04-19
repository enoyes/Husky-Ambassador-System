<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "leadership" || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    header("location:http://matthewclamp.com/prototype/index.php");
}
include '../sql_login.php';
?>
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>

    <link rel="stylesheet" href="../bootstrap/css/evan.css" media="screen"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
</head>
<body>
<div id="greyout" ></div>
<?php include 'nav.php'; ?>
<br> <br> <br> <br> <br>


<div id="removerow">
	<div id="removerow-inner" style="overflow:hidden;">
	<div id="removehaselect">
		<label>Husky Ambassador:</label>
		<select id="allrtourguide" class="form-control">
			<option value='0'></option>
			<?php
			
			$hatype = array("Tour Guide", "", "", "Mingler");
			
			$q = "SELECT uid, first_name, last_name, type FROM master_roster ORDER BY first_name";
			$result = mysqli_query($mysqli, $q);
			while($row = mysqli_fetch_array($result)){
				echo "<option value='".$row['uid']."'>".$row['first_name']." ".$row['last_name']." (".$hatype[$row['type']].")</option>";
			}
			
			?>
		</select>
	</div>
	<br><br><br>
	<div id="personalschedule"> </div>

	<br><br><br>

	<button class="togbutton" data-type='remove'>Close</button>
	</div>
</div>
<div id="addrow">
	<div id="addrow-inner">
	<div id="haselect">
		<label>Husky Ambassador:</label>
		<select id="alltourguide" class="form-control">
			<option value='0'></option>
			<?php
			
			$hatype = array("Tour Guide", "", "", "Mingler");
			
			$q = "SELECT uid, first_name, last_name, type FROM master_roster ORDER BY first_name";
			$result = mysqli_query($mysqli, $q);
			while($row = mysqli_fetch_array($result)){
				echo "<option value='".$row['uid']."'>".$row['first_name']." ".$row['last_name']." (".$hatype[$row['type']].")</option>";
			}
			
			?>
		</select>
	</div>
	<br>
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
	<button class="togbutton" data-type='add'>Close</button>
	</div>
</div>

	
<div id="tcontainer">
<div id="cpanel" >
	<button id="btnExport" class="togbutton" data-type='ddddd'>Export</button>
	<button class="togbutton" data-type='add'>Add</button>
	<button class="togbutton" data-type='remove'>Remove</button>
	<button id="showall">Show All</button>
</div>

<br><br><br>

<table id="datetable">
	<tr>
	  <th style="width:150px">Firstname</th>
	  <th style="width:300px">Lastname</th> 
	  <th style="width:150px">Type</td>
	  <th style="width:150px">Day</th>
	  <th style="width:200px">Time</th>
	  <th style="width:50px">View</th>
	</tr>
	
<?php


$bgtourcolors = array(	9=>'background-color: #F6F4F0',
						10=>'background-color: #FCFCFC', 
						11=>'background-color: #F6F4F0', 
						12=>'background-color: #FCFCFC', 
						13=>'background-color: #F6F4F0', 
						14=>'background-color: #FCFCFC', 
						15=>'background-color: #F6F4F0', 
						16=>'background-color: #FCFCFC');
$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
$daycon = array("", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");




$mtimecon = array(9=>'8:45 AM - 9:15 AM', 10=>'9:45 AM - 10:15 AM', 11=>'10:45 AM - 11:15 AM', 12=>'11:45 AM - 12:15 PM', 
				 13=>'12:45 PM - 1:15 PM', 14=>'1:45 PM - 2:15 PM', 15=>'2:45 PM - 3:15 PM');
$ttimecon = array(10=>'10:00 AM', 11=>'11:00 AM', 12=>'12:00 PM', 13=>'1:00 PM', 14=>'2:00 PM', 15=>'3:00 PM', 16=>'4:00 PM');
				 
$q = "SELECT mr.uid, mr.first_name, mr.last_name, ms.day, ms.time, ms.type FROM master_schedule ms
		INNER JOIN master_roster mr ON mr.uid = ms.uid ORDER BY ms.day, ms.time, mr.type, mr.last_name";
		
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
$row = array();

while ($people = mysqli_fetch_array($result)){
	$row[] = $people;
}
$use = array();
for ($day = 1; $day < 7; $day++){
	$rday = $daycon[$day];
	echo "<tr class='schedDay' id=day$day>
			<td>$rday</td><td></td><td></td><td></td><td></td><td></td>
			</tr>";
	
	foreach($row as $person){
	if ($person['day'] == $day){
	
	if ($person['type'] == 3){$use = $mtimecon;}
	else {$use = $ttimecon;}
	
	echo	
		"<tr class='person".$day."' style='display:none;".$bgtourcolors[$person['time']].";'>
			<td>".$person['first_name']."</td>
			<td>".$person['last_name']."</td> 
			<td>".$tourtypes[$person['type']]."</td>
			<td>$rday</td>
			<td>".$use[$person['time']]."</td>
			<td><a href='openprofile.php?uid=".$person['uid']."'>Edit</td>
			
		</tr>";
	}
		
	}
}


?>
</table>
</div>
<script>
$('.schedDay').click(function(){
	toggledd(($(this).attr('id')).substring(3, 15));
});


$("#btnExport").click(function(e){
    window.open('data:application/vnd.ms-excel,' + $('#datetable').html());
    e.preventDefault();
});


$("#removehaselect").change(function(){
	$("#personalschedule").load("processgetschedule.php?uid=" + $("#allrtourguide").val());
});



$("#showall").click(toggleall);
$(".togbutton").click(function(){
	toggleadd($(this).data('type'));
});

$(".operation").click(function(){
	addtoschedule($(this).data('pro'));
});

function remove_row(uid, day, time, week){
	$.ajax({
		type: "POST",
		url: "processaddschedule.php",
		data: {uid:uid, day:day, time:time, type:"0", process:"2"}
	})
	.done(function(msg){
		alert(msg);
		$("#personalschedule").load("processgetschedule.php?uid=" + uid);
	});
}

function addtoschedule(pro){
	var uid = $("#alltourguide").val();
	var day = $("#allweekdays").val();
	var time = $("#alltimes").val();
	var type = $("#alltypes").val(); 
	
	if (uid == 0){alert("Please choose an HA!"); return -1;}
	if (day == 0){alert("Please choose a day!"); return -1;}
	if (time == 0){alert("Please choose a time!"); return -1;}
	
	$.ajax({
		type: "POST",
		url: "processaddschedule.php",
		data: {uid:uid, day:day, time:time, type:type, process:pro}
	})
	.done(function(msg){
		alert(msg);
		location.reload();
	});
}

function toggleadd(type){
	var id = "#" + type + "row";
	var state = $(id).css("display");
	if (state == "none"){
		$(id).show();
		$("#greyout").show();
	}
	else{
		$(id).hide();
		$("#greyout").hide();
	}
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
</body>