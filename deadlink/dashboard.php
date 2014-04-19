<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" href="css/bootswatch.css" media="screen"/>
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
<li class="active"><a href="#checkIn" data-toggle="tab">Check In</a></li>
<!-- <li><a href="#activity" data-toggle="tab">Activity</a></li> -->
<!-- <li><a href="#coverage" data-toggle="tab">Coverage?</a></li> -->
<!-- <li><a href="#reports" data-toggle="tab">Reports</a></li></ul> -->
<br><br>

<div id="myTabContent" class="tab-content">
<div class="tab-pane fade active in" id="checkIn">
    <h2 class="col-md-offset-1">Check In</h2>

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

                        echo $mysqli->host_info . "\n";

                        $time = time() + 60 * 60;
                        $newtime = date('H:i', $time);
                        $weekday = date(w, $time);
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
                        }
                        ?>
                        <div class="form-group">
                            <div class="col-lg-4 col-md-offset-5">
                                <div class="coverage checkbox"><label><input type="checkbox"
                                                                             onclick="$('.coverage-open').slideToggle('1000')"/>
                                        Coverage/Additional Tour</label>

                                    <div class="shadow checkbox"><label><input type="checkbox"
                                                                               onclick="$('.shadow-open').slideToggle('1000')"/>Shadowing?</label>
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

                                <br/></div>
                        </div>

                        <form action="checkin.php" method="post" id="checkin">
                            <button type="submit" class="col-md-offset-8 btn btn-primary">Check In</button>
        </fieldset>
    </div>
</div>
</form>

<div class="tab-pane fade col-md-8 col-md-offset-2" id="activity"><br/>
    <br/><br/>

    <p class=" lead"><img alt="" src="images/user.png"/> <a>Andrew</a> has checked in at <a>4:36pm, 24 November,
            2013</a></p>
    <hr/>
    <p class="lead"><img alt="" src="images/user.png"/> <a>Matt</a> has checked in at <a>2:36am, 22 November, 2013</a>
    </p>
    <hr/>
    <p class=" lead"><img alt="" src="images/user.png"/> <a>Kogmaw</a> has checked in at <a>1:00pm, 21 November,
            2013</a></p>
    <hr/>
    <p class="lead"><img alt="" src="images/user.png"/> <a>Jessica</a> has checked in for <a>Mike</a> at <a>8:06am, 20
            November, 2013</a></p></div>
<div class="tab-pane fade col-md-6 col-md-offset-2" id="coverage">
    <h3>Select your Name: </h3><select class="col-md-offset-2 form-control" id="tourGuide">
        <option>Select...</option>
        <option>Matt</option>
        <option>Andrew</option>
        <option>Jessica</option>
        <option>Kogmaw</option>
        <option>Kogmaw</option>
        <option>Kogmaw</option>
        <option>Kogmaw</option>
        <option>Kogmaw</option>
        <option>Kogmaw</option>
        <option>Kogmaw</option>
        <option>Kogmaw</option>
    </select><br/>
    <br/><br/>
    <br/>

    <h3>Select time coverage needed for: </h3>

    <div class="row col-md-offset-2">
        <div class="col-md-4"><select class="form-control" id="tourGuide">
                <option>Time</option>
                <option>2pm</option>
                <option>6pm</option>
            </select></div>
        <div class="col-md-4"><select class="form-control" id="tourGuide">
                <option>Day</option>
                <option>1</option>
                <option>2</option>
            </select></div>
        <div class="col-md-4"><select class="form-control" id="tourGuide">
                <option>Month</option>
                <option>1</option>
                <option>2</option>
            </select></div>
    </div>
    <br/>
    <br/><br/>
    <br/>
    <button type="submit" class="col-md-offset-10 btn btn-warning">Find Coverage</button>
</div>
<div class="tab-pane fade col-md-8 col-md-offset-2" id="reports">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h1 class="panel-title">Download Report</h1></div>
        <div class="panel-body">
            <h3>Select report for: </h3><select class="form-control">
                <option>All</option>
                <option>Matt</option>
                <option>Andrew</option>
                <option>Jessica</option>
                <option>Kogmaw</option>
                <option>Kogmaw</option>
                <option>Kogmaw</option>
                <option>Kogmaw</option>
            </select><br/>

            <h3>Select report format: </h3>

            <div class="col-md-offset-2 row">
                <div class="col-md-4"><label><input type="radio" name="optionsRadios" id="optionsRadios2"
                                                    value="option1"/>
                        XLS File</label></div>
                <div class="col-md-4"><label><input type="radio" name="optionsRadios" id="optionsRadios2"
                                                    value="option2"/>
                        CSV</label></div>
                <div class="col-md-4"><label><input type="radio" name="optionsRadios" id="optionsRadios2"
                                                    value="option3"/>
                        PDF</label></div>
            </div>
            <br/>
            <br/>
            <button type="submit" class="col-md-offset-8 btn btn-success">Generate and Download</button>
        </div>
    </div>
</div>
</div>
</div></div><br/>
<br/><br/>
<br/><br/>
<br/><br/>
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
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script>
    $('.coverage-open').slideUp(0);
    $('.shadow-open').slideUp(0);
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