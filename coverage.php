<?php
session_start();
if(!isset($_SESSION['username'])){
    header("location:index.php");
}
include "sql_login.php";
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>

    <style type="text/css"></style>
  
</head>
<body>
<?php include 'nav.php'; ?>
<br> <br> <br> <br> <br>

<center>
	<h4> 
		Please choose your name and the time you are requesting coverage for and then fill out the email! 
		<br>NOTE: THIS IS ONLY FOR TOUR GUIDES. Minglers please just email all minglers for coverage. 
	</h4>
</center>
<br> <br>

<div class="well col-lg-6 col-lg-offset-3">
    <div name="cov" class="horizontal-form">
	
        <h3>Name: </h3>
        <div class="form-group">
            <select name="coverage" class="form-control" id="coverage">
                <option value="">Select...</option>
                <?php
          

                $res = mysqli_query($mysqli, "SELECT uid, first_name, last_name FROM master_roster ORDER BY first_name ASC") or die(mysqli_error($mysqli));

                while ($row = mysqli_fetch_array($res)) {
                    echo "<option value=" . $row['uid'] . ">" . $row['first_name'] . " " . $row['last_name'] . "</option>";
                }
                ?>
            </select>
		</div>
		

        <h3> Tour Type: </h3>
        <div class="form-group">
            <select class="form-control" name="type" class="form-control" id="type" onchange="getTime()">
                <option value="">Select...</option>
                <option value="0">Regular</option>
                <option value="1">IV</option>
                <option value="2">Athletics</option>
                <option value="3">Mingler</option>

            </select>
		</div>

        <h3> Time: </h3>
        <div class="form-group" name="time">
			<select class="form-control" name="time" class="form-control" id="time">
				<option value="0">Select...</option>
			</select>
        </div>



        <h3>Date: </h3>
        <div class="form-group">
            <input type="date" class="form-control" id="date" name="date">
        </div>

        <h3> Email Text: </h3>
        <div class="form-group">
            <textarea id="email" cols="110" rows="10">Enter your email body here...</textarea><br>
        </div>
		
        <button id="covsubmit" style="margin-right:15px;margin-top:20px;" class=" pull-right btn btn-lg btn-primary">
            Submit
        </button>
    </div>
</div>
<script>

function getTime(){
	var type = $("#type").val();
	$("#time").load("getminglertime.php?name=" + type);
}

function submitcov(){
	var uid = $("#coverage").val();
	var type = $("#type").val();
	var time = $("#time").val();
	var date = $("#date").val();
	var email = $("#email").val();
	
	if (uid == ""){ alert("Please select a user"); return -1;}
	if (type == ""){ alert("Please select a tour type"); return -1;}
	if (time == 0){ alert("Please select a time"); return -1;}
	if (email == "Enter your email body here..."){ alert("Please enter an email body"); return -1;}
	
	$.ajax({
		type: "POST",
		url: "processcoverage.php",
		data: {uid: uid, type: type, time: time, date: date, email: email}
	})
	.done(function(msg){
	alert(msg);
	location.reload();
	});
}

$("#covsubmit").click(submitcov);

</script>


</body>
</html>