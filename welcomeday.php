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


    <style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>
<br> <br> <br> <br> <br>

<center>
    <h4> Please choose your name and the welcome day you are signing up for and click sign-up! <br>

        <h3>Minglers!!!</h3> Choosing a shift means you will be working in Curry Student Center from 7-10:30AM to help
        with Check-In!<br>

        <h3>Tour Guides!!!</h3> Choosing a shift means you will be working in the Visitor Center from 11:30AM-3:30PM giving
        tours!
    </h4>
</center>
<br> <br>

<div class="well col-lg-6 col-lg-offset-3">
    <form name="wd" class="horizontal-form" action="processwelcomeday.php" method="POST">
        <h3>Name: </h3>

        <div class="form-group">
            <select name="coverage" class="form-control" id="coverage">
                <option value='0'>Select...</option>
                <?php
                include "sql_login.php";

				$q = "SELECT first_name, last_name, uid FROM master_roster ORDER BY first_name ASC";
                $res = mysqli_query($mysqli, $q);


                while ($row = mysqli_fetch_array($res)) {
                    echo "<option value='".$row['uid']."'>".$row['first_name']." ".$row['last_name']."</option>";
                }
                ?>
			</select>
		</div>
        <h3> Welcome Day: </h3>

        <div class="form-group">
            <select class="form-control" name="welcomeday" class="form-control" id="welcomeday">
                <option value="">Select...</option>
                <option value="WD-04-05">April 5</option>
                <option value="WD-04-06">April 6</option>
            </select>
		</div>
        <button type="submit" style="margin-right:15px;margin-top:20px;" class=" pull-right btn btn-lg btn-primary">
            Submit
        </button>
    </form>
</div>


</body>
