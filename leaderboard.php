<?php
session_start();
if(!isset($_SESSION['username'])){
    header("location:index.php");
}
?>


<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
	<link rel="stylesheet" href="bootstrap/css/evan.css" media="screen"/>
</head>
<body>
<?php include 'nav.php'; ?>
<br> <br>

<div id="button-row">
	<button id="totaltours" class="leaderboard-cat" data-scope="0">Total Shifts</button>
	<button id="coveredtours" class="leaderboard-cat" data-scope="1">Covered Shifts</button>
	<button id="addtours" class="leaderboard-cat" data-scope="2">Additional Shifts</button>
</div>

<div id="lbarea" >
	<div id="lbareainner" />
</div>

</body>
<script>
$(document).ready(function(){
	$("#lbareainner").load("processleaderboard.php?scope=0");

});

$(".leaderboard-cat").click(function(){
	var scope = $(this).data("scope");
	$("#lbareainner").load("processleaderboard.php?scope=" + scope);
});

</script>