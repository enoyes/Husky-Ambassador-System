<?php
session_start();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="../leadership/css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" href="../leadership/css/bootswatch.css" media="screen"/>
    <style>
        .navbar {
            background-image: -webkit-linear-gradient(rgb(255, 92, 92), rgb(187, 21, 21) 60%, rgb(255, 0, 0));
            border-bottom: 1px solid rgb(255, 0, 0);
        }

        .nav-tabs > li > a {
            color: rgb(255, 0, 0);
        }

        h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {

            color: rgb(185, 0, 0);
        }

        .navbar-brand {
            font-size: 25px;
        }</style>
    <style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>

<!-- <li><a href="#activity" data-toggle="tab">Activity</a></li> -->
<!-- <li><a href="#coverage" data-toggle="tab">Coverage?</a></li> -->
<!-- <li><a href="#reports" data-toggle="tab">Reports</a></li></ul> -->
<br><br>
<?php 
$time = time() + 60 * 60;$intersession = 0;
$curdate = date('Y-m-d', $time);
if (($curdate >= '2014-03-01') && ($curdate <= '2014-03-08')){
	$intersession = 1;
	}
?>
<div id="myTabContent" class="tab-content">
<div class="tab-pane fade active in" id="checkIn">

	<h2 class="col-md-offset-1"><?php if ($intersession == 1){echo "Intersession ";}?>Check In</h2>

    <div class="well col-md-6 col-md-offset-3">
        <p class="text-center" style="font-size: 120px; font-weight: 100"><span id="clock"></span></p>
        <fieldset>
            <div class="form-group"><label for="inputEmail" class="col-lg-2 control-label">
                    <h4>Name</h4></label>

                <div class="col-lg-10">
                    <select name="name" class="form-control" id="tourGuide" form="checkin">
                        <option>Select...</option>
                        <?php
                        $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                        if ($mysqli->connect_errno) {
                            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                        }

						
						$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
                        echo $mysqli->host_info . "\n";

                        $time = time() + 60 * 60;
                        $newtime = date('H:i', $time); // 24H : Leading 0s minute
                        $weekday = date('w', $time);
						$curdate = date('Y-m-d', $time);
						$intersession = 0;
						if (($curdate >= '2014-03-01') && ($curdate <= '2014-03-08')){
							$datetodayid = array('2014-03-01' => 0, '2014-03-03' => 1, '2014-03-04' => 2, '2014-03-05' => 3, '2014-03-06' => 4, '2014-03-07' => 5, '2014-03-08' => 6); // Convert the intersession day to the day_id of the intersession table
							$intersession = 1;
							
							// Get the current time as a time id
							if (strtotime("08:30") < strtotime($newtime) && strtotime($newtime) <= strtotime("9:00")) {
								$time_id = 9;
							}							
							else if (strtotime("09:30") < strtotime($newtime) && strtotime($newtime) <= strtotime("10:00")) {
								$time_id = 10;
							}
							elseif (strtotime("10:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("11:00")) {
								$time_id = 11;
							}
							elseif (strtotime("11:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("12:00")) {
								$time_id = 12;
							}
							elseif (strtotime("12:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("13:00")) {
								$time_id = 1;
							} 
							elseif (strtotime("13:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("14:00")) {
								$time_id = 2;
							} 
							elseif (strtotime("14:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("15:00")) {
								$time_id = 3;
							}
							elseif (strtotime("15:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("16:00")) {
								$time_id = 4;
							}
							else{ $time_id == -1;};
						}
						echo $weekday;
                        $realday = "";
                        if ($weekday == 0) {
                            $realday = "Sunday";
                        } else if ($weekday == 1) {
                            $realday = "Monday";
                        } else if ($weekday == 2) {
                            $realday = "Tuesday";
                        } else if ($weekday == 3) {
                            $realday = "Wednesday";
                        } else if ($weekday == 4) {
                            $realday = "Thursday";
                        } else if ($weekday == 5) {
                            $realday = "Friday";
                        } else if ($weekday == 6) {
                            $realday = "Saturday";
                        }

                        $date = date('Md', $time);

						if ($intersession){
							$day_id = $datetodayid[$curdate];
							$q = "	SELECT m.FirstName, m.LastName, inter.uid, inter.tour_type FROM intersession2014 inter 
									INNER JOIN MasterRoster2014 m ON m.UID = inter.uid 
									WHERE inter.day_id = $day_id AND inter.time_id = $time_id
									ORDER BY m.FirstName";
							$res = mysqli_query($mysqli, $q) or die (mysqli_error($mysqli));
							
							while ($people = mysqli_fetch_array($res)){
								echo "<option value='".$people['uid']."'>".$people['FirstName']." ".$people['LastName']." (".$tourtypes[$people['tour_type']].")</option>"; 
							}
							
						}
						else{

							$res = "";
							if (strtotime("08:30") < strtotime($newtime) && strtotime($newtime) <= strtotime("10:00")) {
								$res = $mysqli->query("SELECT * FROM " . $realday . "10AM ORDER BY Name ASC");
							} elseif (strtotime("10:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("11:00")) {
								$res = $mysqli->query("SELECT * FROM " . $realday . "11AM ORDER BY Name ASC");
							} elseif (strtotime("11:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("12:00")) {
								$res = $mysqli->query("SELECT * FROM " . $realday . "12PM ORDER BY Name ASC");
							} elseif ($realday != Saturday && strtotime("12:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("14:00")) {
								$res = $mysqli->query("SELECT * FROM " . $realday . "2PM ORDER BY Name ASC");
							} elseif ($realday != Saturday && strtotime("14:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("15:00")) {
								$res = $mysqli->query("SELECT * FROM " . $realday . "3PM ORDER BY Name ASC");
							} elseif ($realday != Saturday && strtotime("15:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("16:00")) {
								$res = $mysqli->query("SELECT * FROM " . $realday . "4PM ORDER BY Name ASC");
							} else {
								echo "<option>This time does not exist on the schedule</option>";
							}
						

                        $res->data_seek(0);

                        $cid = "";
                        while ($row = $res->fetch_assoc()) {
                            if ($row[$date] == 2) {
                                $date2 = date('Y-m-d');
                                $ans = $mysqli->query("SELECT * FROM Coverages WHERE `Date`='$date2' AND `Name`='$row[Name]'");
                                $ans->data_seek(0);
                                while ($row2 = $ans->fetch_assoc()) {
                                    if ($row2['Covered'] != 2) {
                                        echo "<option>" . $row2['Coverer'] . " (C) </option> \n";
                                    }
                                }
                            }
                            if ($row[$date] == 0) {
                                echo "<option>" . $row['Name'] . "</option> \n";
                            }
                        }}
                        ?>
                        <div class="form-group">
                            <div class="col-lg-4 col-md-offset-5">
                                <div class="coverage checkbox"><label><input type="checkbox"
                                                                             onclick="$('.coverage-open').slideToggle('1000')"/>
                                        Coverage/Additional Tour</label>

                                    <div class="shadow checkbox"><label><input type="checkbox"
                                                                               onclick="$('.shadow-open').slideToggle('1000')"/>Shadowing?</label>
                                    </div>
                                    <div class="support checkbox"><label><input type="checkbox"
                                                                               onclick="$('.support-open').slideToggle('1000')"/>Supporting a Tour?</label>
                                    </div>
                                </div>

                                <div class="coverage-open col-md-6">
                                    <h3>Select your Name: </h3>
                                    If covering, selecting the tour guide from above that you are covering, if
                                    additional tour, leave the above blank. In both cases, select your name below.
                                    <select name="coverage" class="form-control" id="tourGuide" form="checkin">
                                        <option>Select...</option>
                                        <?php
                                        $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                        if ($mysqli->connect_errno) {
                                            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                        }

                                        echo $mysqli->host_info . "\n";

                                        $res = $mysqli->query("SELECT Name FROM GuideList ORDER BY Name ASC");

                                        $res->data_seek(0);

                                        while ($row = $res->fetch_assoc()) {
                                            echo "<option>" . $row['Name'] . "</option> \n";
                                        }
                                        ?>
                                        $val</select></div>

                                <div class="shadow-open col-md-6">
                                    <h3>Select your Name: </h3>
                                    This is for new hires/Minglers who have shadowing requirements, NOT for official
                                    shadowing!
                                    <select name="shadow" class="form-control" id="tourGuide" form="checkin">
                                        <option>Select...</option>
                                        <?php
                                        $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                        if ($mysqli->connect_errno) {
                                            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                        }

                                        echo $mysqli->host_info . "\n";

                                        $res = $mysqli->query("SELECT Name FROM GuideList ORDER BY Name ASC");

                                        $res->data_seek(0);

                                        while ($row = $res->fetch_assoc()) {
                                            echo "<option>" . $row['Name'] . "</option> \n";
                                        }
                                        ?>
                                        $val</select></div>

                                <div class="support-open col-md-6">
                                    <h3>Select your Name: </h3>
                                    This is for Minglers who have support assistant requirements.
                                    <select name="support" class="form-control" id="support" form="checkin">
                                        <option>Select...</option>
                                        <?php
                                        $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                        if ($mysqli->connect_errno) {
                                            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                        }

                                        echo $mysqli->host_info . "\n";

                                        $res = $mysqli->query("SELECT Name FROM Minglers ORDER BY Name ASC");

                                        $res->data_seek(0);

                                        while ($row = $res->fetch_assoc()) {
                                            echo "<option>" . $row['Name'] . "</option> \n";
                                        }
                                        ?>
                                        $val</select></div>

                                <br/></div>
                        </div>

                        <form action="checkin.php" method="post" id="checkin">
                            <button type="submit" class="col-md-offset-8 btn btn-primary">Check In</button>
        </fieldset>
    </div>
</div>
</form>
<footer>
    <div class="row">
        <div class="col-lg-12">
            <ul class="list-unstyled">
                <li class="pull-right"><a href="#top">Back to top</a></li>
            </ul>
        </div>
    </div>
</footer>
</div>
<script src="../leadership/js/jquery.js"></script>
<script src="../leadership/js/bootstrap.js"></script>
<script>
    $('.coverage-open').slideUp(0);
    $('.shadow-open').slideUp(0);
    $('.support-open').slideUp(0);
    function updateClock() {
        var currentTime = new Date();
        var currentHoursAP = currentTime.getHours();
        var currentHours = currentTime.getHours();
        var currentMinutes = currentTime.getMinutes();
        var currentSeconds = currentTime.getSeconds();

        // Pad the minutes and seconds with leading zeros, if required
        currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
        currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;

        // Choose either "AM" or "PM" as appropriate
        var timeOfDay = (currentHours < 12) ? "AM" : "PM";

        // Convert the hours component to 12-hour format if needed
        currentHoursAP = (currentHours > 12) ? currentHours - 12 : currentHours;

        // Convert an hours component of "0" to "12"
        currentHoursAP = (currentHoursAP == 0) ? 12 : currentHoursAP;

        // Compose the string for display
        var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds;

        $("#clock").html(currentTimeString);
    }

    $(document).ready(function () {
        setInterval(updateClock, 1000);
    });
</script>

</body>
</html>