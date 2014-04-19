<?php
$uid = $_GET['uid'];

include "../sql_login.php";

$q = "	SELECT * FROM master_roster mr
		LEFT JOIN (SELECT uid, count(*) AS missed FROM attendance WHERE uid = $uid AND status = 3) c
		ON c.uid = mr.uid
		WHERE mr.uid = $uid";
$result = mysqli_query($mysqli, $q);

$row = mysqli_fetch_array($result);
$missed = $row["missed"];
if ($missed === NULL){$missed = 0;}
    
echo '
<div class="form-group">
	<label for="firstName" class="col-lg-4 control-label">First Name</label>
	<div class="col-lg-8">
	  ' . $row["first_name"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="lastName" class="col-lg-4 control-label">Last Name</label>
	<div class="col-lg-8">
	  ' . $row["last_name"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="missed" class="col-lg-4 control-label">Missed Shifts</label>
	<div class="col-lg-8">
		' . $missed . '
	</div><br>
</div>
<div class="form-group">
	<label for="gender" class="col-lg-4 control-label">Gender</label>
	<div class="col-lg-8">
		' . $row["gender"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="homeTown" class="col-lg-4 control-label">Home Town</label>
	<div class="col-lg-8">
	  ' . $row["hometown"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="state" class="col-lg-4 control-label">State or Country</label>
	<div class="col-lg-8">
		' . $row["state"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="country" class="col-lg-4 control-label">Country</label>
	<div class="col-lg-8">
		' . $row["country"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="highSchool" class="col-lg-4 control-label">High School</label>
	<div class="col-lg-8">
		' . $row["highschool"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="major" class="col-lg-4 control-label">Major</label>
	<div class="col-lg-8">
		' . $row["major"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="college" class="col-lg-4 control-label">College</label>
	<div class="col-lg-8">
		' . $row["college"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="graduationYear" class="col-lg-4 control-label">Graduation Year</label>
	<div class="col-lg-8">
	' . $row["grad_year"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="email" class="col-lg-4 control-label">Email</label>
	<div class="col-lg-8">
		<a href="mailto:' . $row["email"] . '">' . $row["email"] . ' </a>
	</div><br>
</div>
<div class="form-group">
	<label for="phoneNumber" class="col-lg-4 control-label">Phone Number</label>
	<div class="col-lg-8">
		' . $row["phone"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="semesterStarted" class="col-lg-4 control-label">Started with HA</label>
	<div class="col-lg-8">
		' . $row["start_semester"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="ethnicity" class="col-lg-4 control-label">Ethnicity</label>
	<div class="col-lg-8">
		' . $row["ethnicity"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="trainedOnIv" class="col-lg-4 control-label">Trained on IV</label>
	<div class="col-lg-8">
		' . $row["trained_IV"] . '
	</div><br>
</div>
<div class="form-group">
	<label for="trainedOnAthletics" class="col-lg-4 control-label">Trained on Athletics</label>
	<div class="col-lg-8">
		' . $row["trained_ath"] . '
	</div><br>
</div>
<center><a href="slc/getaudits.php?uid=' .$row["uid"] . '"><button type="button">Get Audits</button></a>    <a href="createaudit.php?uid=' .$row["uid"] . '"><button type="button">Create New Audit</button></a></center>
';

?>