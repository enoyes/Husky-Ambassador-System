<?php
$q = $_GET['q'];

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$lastname = substr($q, 0, strpos($q, ","));
$firstname = substr($q, strpos($q, ",") + 2);

$res = $mysqli->query("SELECT * FROM MasterRoster2014 WHERE LastName='" . $lastname . "' AND FirstName='" . $firstname . "'");

$res->data_seek(0);

while ($row = $res->fetch_assoc()) {

    echo '
  	<div class="form-group">
                    <label for="firstName" class="col-lg-4 control-label">First Name</label>
                    <div class="col-lg-8">
                      ' . $row["FirstName"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="lastName" class="col-lg-4 control-label">Last Name</label>
                    <div class="col-lg-8">
                      ' . $row["LastName"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="gender" class="col-lg-4 control-label">Gender</label>
                    <div class="col-lg-8">
                    	' . $row["Gender"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="homeTown" class="col-lg-4 control-label">Home Town</label>
                    <div class="col-lg-8">
                      ' . $row["Hometown"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="state" class="col-lg-4 control-label">State or Country</label>
                    <div class="col-lg-8">
                    	' . $row["State"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="country" class="col-lg-4 control-label">Country</label>
                    <div class="col-lg-8">
                    	' . $row["Country"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="highSchool" class="col-lg-4 control-label">High School</label>
                    <div class="col-lg-8">
                    	' . $row["HighSchool"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="major" class="col-lg-4 control-label">Major</label>
                    <div class="col-lg-8">
                    	' . $row["Major"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="college" class="col-lg-4 control-label">College</label>
                    <div class="col-lg-8">
                    	' . $row["College"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="graduationYear" class="col-lg-4 control-label">Graduation Year</label>
                    <div class="col-lg-8">
                    ' . $row["GraduationYear"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="email" class="col-lg-4 control-label">Email</label>
                    <div class="col-lg-8">
                    	<a href="mailto:' . $row["Email"] . '">' . $row["Email"] . ' </a>
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="col-lg-4 control-label">Phone Number</label>
                    <div class="col-lg-8">
                    	' . $row["PhoneNumber"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="semesterStarted" class="col-lg-4 control-label">Semester Started with HA</label>
                    <div class="col-lg-8">
                    	' . $row["SemesterStarted"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="ethnicity" class="col-lg-4 control-label">Ethnicity</label>
                    <div class="col-lg-8">
                    	' . $row["Ethnicity"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="trainedOnIv" class="col-lg-4 control-label">Trained on IV</label>
                    <div class="col-lg-8">
                    	' . $row["TrainedOnIV"] . '
                    </div><br>
                </div>
                <div class="form-group">
                    <label for="trainedOnAthletics" class="col-lg-4 control-label">Trained on Athletics</label>
                    <div class="col-lg-8">
                    	' . $row["TrainedOnAthletics"] . '
                    </div><br>
                </div>';
}
?>