<?php session_start();
if(!isset($_SESSION['username'])){
    header("location:index.php");
	
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" href="css/bootswatch.css" media="screen"/>
    <style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>
<br> <br> <br> <br> <br>

<center><h4> Please choose your name (you are the person covering the tour) and click submit! </h4></center>
<br> <br>

<div class="well col-lg-6 col-lg-offset-3">
    <div name="wd" class="horizontal-form">
        <h3>Name: </h3>

        <div class="form-group">
            <select name="coverage" class="form-control" id="coverage">
                <option value='0'>Select...</option>
                <?php
                //$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
				include "sql_login.php";
				

                $res = mysqli_query($mysqli, "SELECT uid, first_name, last_name FROM master_roster ORDER BY first_name ASC");


                while ($row = mysqli_fetch_array($res)) {
                    echo "<option value='".$row['uid']."'>" . $row['first_name'] . " " . $row['last_name'] . "</option>";
                }
                ?>
            </select>
		</div>
		<div/>
        <button type="submit" style="margin-right:15px;margin-top:20px;" class=" pull-right btn btn-lg btn-primary" id="submit">Submit</button>
    </div>
</div>
<script>
$("#submit").click(acceptcoverage);

function acceptcoverage(){
	var uid = <?php echo $_GET['uid'] ?>;
	var day = <?php echo $_GET['day'] ?>;
	var time = <?php echo $_GET['time'] ?>;
	var week = <?php echo $_GET['week'] ?>;
	var coverage = $("#coverage").val();
	
	if (coverage == 0){alert("Please choose a person"); return -1;}
	
	$.ajax({
		method: "POST",
		url: "processacceptcoverage.php",
		data: {uid: uid, day: day, time: time, week: week, coverage: coverage}
	})
	.done(function(msg){
		alert(msg);
		location.replace("coveratour.php");
	});
}
</script>
</body>
</html>