<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    echo "Insufficient Permissions!";
}
include "../sql_login.php";

$uid = $_GET['uid'];

$zocon = array("No", "Yes");
$tourtypes = array('Explore NU', 'Athletic', 'IV', 'Mingle');
$gcon = array("male" => "M", "female" => "F");

$q = "SELECT * FROM master_roster WHERE uid = $uid";
$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
$result = mysqli_fetch_array($result);
?>
<table id="infotable"  >
	<caption>User Info</caption>
	<tr>
		<td style="width:150px">First Name</td>
		<td style="width:250px"><?php echo $result['first_name']; ?></td>
	<tr>
	<tr>
		<td>Last Name</td>
		<td><?php echo $result['last_name']; ?></td>
	<tr>
	<tr>
		<td>Gender</td>
		<td><?php echo $gcon[$result['gender']]; ?></td>
	<tr>
	<tr>
		<td>HA Type</td>
		<td><?php echo $tourtypes[$result['type']]; ?></td>
	<tr>
	<tr>
		<td>Email</td>
		<td><?php echo $result['email']; ?></td>
	<tr>
	<tr>
		<td>IV Trained</td>
		<td><?php echo $zocon[$result['trained_IV']]; ?></td>
	<tr>
	<tr>
		<td>Athletic Trained</td>
		<td><?php echo $zocon[$result['trained_ath']]; ?></td>
	<tr>
	<tr>
		<td>Country</td>
		<td><?php echo $result['country']; ?></td>
	<tr>
	<tr>
		<td>Phone</td>
		<td><?php echo $result['phone']; ?></td>
	<tr>
	<tr>
		<td>Started HA</td>
		<td><?php echo $result['start_semester']; ?></td>
	<tr>
	<tr>
		<td>Ethnicity</td>
		<td><?php echo $result['ethnicity']; ?></td>
	<tr>
	<tr>
		<td>Major</td>
		<td><?php echo $result['major']; ?></td>
	<tr>
	<tr>
		<td>College</td>
		<td><?php echo $result['college']; ?></td>
	<tr>
	<tr>
		<td>Graduation Year</td>
		<td><?php echo $result['grad_year']; ?></td>
	<tr>
	<tr>
		<td>Hometown</td>
		<td><?php echo $result['hometown']; ?></td>
	<tr>
	<tr>
		<td>State</td>
		<td><?php echo $result['state']; ?></td>
	<tr>
	<tr>
		<td>Country</td>
		<td><?php echo $result['country']; ?></td>
	<tr>
	<tr>
		<td>High School</td>
		<td><?php echo $result['highschool']; ?></td>
	<tr>
</table>
<button id='edituserinfo' data-uid="<?php echo $uid ?>" >Edit </button>

<script>
$("#edituserinfo").click(loadedituserinfo);
function loadedituserinfo(){
	var uid = $("#edituserinfo").data('uid');
	$("#userinfo").load("moduleedituserinfo.php?uid=" + uid);
}

</script>