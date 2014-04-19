<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    header("location:http://matthewclamp.com/prototype/index.php");
}
include "../sql_login.php";
$uid = $_GET['uid'];

$result = mysqli_query($mysqli, "SELECT mr.first_name, mr.last_name FROM master_roster mr WHERE uid = $uid");
$result = mysqli_fetch_array($result);

?>

<head>
	<title>Tour Guide Management System</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.css" media="screen"/>
	<link rel="stylesheet" href="../bootstrap/css/evan.css" media="screen"/>
	<style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>
<div id="greyout" ></div>
    <br>  
<h2 class="col-md-offset-1"><?php echo $result['first_name']." ".$result['last_name']?></h2>
<center>
	<a href="slc/getaudits.php?uid=<?php echo $uid?>">
		<button type="button">Get Audits</button>
	</a>    
	<a href="createaudit.php?uid=<?php echo $uid?>">
		<button type="button">Create New Audit</button>
	</a>
	</center>
	<br>
<div id="addrow">
	<div id="addrow-inner">
	</div>
</div>	

<div style="position:relative;left:50%;margin-left:-602.5;width:1205px"><div class="opmodule" ><div id="userinfo" class="opmoduleinner"></div></div>
<div class="opmodule"><div id="pschedule" class="opmoduleinner"></div></div></div>
<div style="position:relative;left:50%;margin-left:-602.5;width:1205px"><div class="opmodule"><div id="attendance" class="opmoduleinner"></div></div>
<div class="opmodule"><div id="attendancetable" class="opmoduleinner"></div></div></div>

<script>
$(document).ready(function(){
	$("#userinfo").load("moduleuserinfo.php?uid=<?php echo $uid ?>");
	$("#pschedule").load("processgetschedule.php?uid=<?php echo $uid ?>");
	$("#attendance").load("moduleattendance.php?uid=<?php echo $uid ?>");
	$("#attendancetable").load("moduleattendancetable.php?uid=<?php echo $uid ?>");
	}
);

function remove_row(uid, day, time, week){

if (week == -1){
	$.ajax({
		type: "POST",
		url: "processaddschedule.php",
		data: {uid:uid, day:day, time:time, type:"0", process:"2"}
	})
	.done(function(msg){
		alert(msg);
		$("#pschedule").load("processgetschedule.php?uid=" + uid);
	});
}
else{
	$.ajax({
		type: "POST",
		url: "processeditattendance.php",
		data: {uid:uid, day:day, time:time, week:week, process:"0"}
	})
	.done(function(msg){
		alert(msg);
		$("#attendancetable").load("moduleattendancetable.php?uid=" + uid);
		$("#attendance").load("moduleattendance.php?uid=" + uid);
	});
}
}
</script>

</body>
</html>