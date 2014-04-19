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
		<td style="width:250px"><input id="meu_fn" type="text" value="<?php echo $result['first_name']; ?>"></input></td>
	<tr>
	<tr>
		<td>Last Name</td>
		<td><input id="meu_ln" type="text" value="<?php echo $result['last_name']; ?>"></input></td>
	<tr>
	<tr>
		<td>Gender</td>
		<td>
			<select id="meu_gender">
				<option value='male'>Male</option>
				<option value='female'>Female</option>
			<select>
		</td>
	<tr>
	<tr>
		<td>HA Type</td>
		<td>
			<select id="meu_type">
				<option value='0'>Tour Guide</option>
				<option value='3'>Mingler</option>
			<select>
		</td>
	<tr>
	<tr>
		<td>Email</td>
		<td><input id="meu_email" type="text" value="<?php echo $result['email']; ?>"></input></td>
	<tr>
	<tr>
		<td>IV Trained</td>
		<td>
			<select id="meu_ivtrained">
				<option value='0'>No</option>
				<option value='1'>Yes</option>
			<select>
		</td>
	<tr>
	<tr>
		<td>Athletic Trained</td>
		<td>
			<select id="meu_athtrained">
				<option value='0'>No</option>
				<option value='1'>Yes</option>
			<select>
		</td>
	<tr>
	<tr>
		<td>Phone</td>
		<td><input id="meu_phone" type="text" value="<?php echo $result['phone']; ?>"></input></td>
	<tr>
	<tr>
		<td>Started HA</td>
		<td><input id="meu_sha" type="text" value="<?php echo $result['start_semester']; ?>"></input></td>
	<tr>
	<tr>
		<td>Ethnicity</td>
		<td><input id="meu_eth" type="text" value="<?php echo $result['ethnicity']; ?>"></input></td>
	<tr>
	<tr>
		<td>Major</td>
		<td><input id="meu_major" type="text" value="<?php echo $result['major']; ?>"></input></td>
	<tr>
	<tr>
		<td>College</td>
		<td>
			<select id="meu_college">
				<option value="Bouve">Bouve</option>
				<option value="CAMD">CAMD</option>
				<option value="CCIS">CCIS</option>
				<option value="COE">COE</option>
				<option value="COS">COS</option>
				<option value="CSSH">CSSH</option>
				<option value="DMSB">DMSB</option>
				<option value="CCIS/DMSB">CCIS/DMSB</option>
				<option value="CCIS/COS">CCIS/COS</option>
				<option value="CCIS/CAMD">CCIS/CAMD</option>
				<option value="COE/COS">COE/COS</option>
				<option value="CSSH/DMSB">CSSH/DMSB</option>
			</select>
		</td>
	<tr>
	<tr>
		<td>Graduation Year</td>
		<td><input id="meu_gy" type="text" value="<?php echo $result['grad_year']; ?>"></input></td>
	<tr>
	<tr>
		<td>Hometown</td>
		<td><input id="meu_ht" type="text" value="<?php echo $result['hometown']; ?>"></input></td>
	<tr>
	<tr>
		<td>State</td>
		<td><input id="meu_state" type="text" value="<?php echo $result['state']; ?>"></input></td>
	<tr>
	<tr>
		<td>Country</td>
		<td><input id="meu_country" type="text" value="<?php echo $result['country']; ?>"></input></td>
	<tr>
	<tr>
		<td>High School</td>
		<td><input id="meu_hs" type="text" value="<?php echo $result['highschool']; ?>"></input></td>
	<tr>
</table>
<button id='saveuserinfo' data-uid="<?php echo $uid ?>" >Save</button>
<button id='canceluserinfo' data-uid="<?php echo $uid ?>" >Cancel</button>
<script>
$(document).ready(function(){
	$("#canceluserinfo").click(loaduserinfo);
	$("#saveuserinfo").click(saveuserinfo);
	$("#meu_ivtrained option[value=<?php echo $result['trained_IV']; ?>]").attr("selected", "selected"); 
	$("#meu_athtrained option[value=<?php echo $result['trained_ath']; ?>]").attr("selected", "selected"); 
	$("#meu_gender option[value=<?php echo $result['gender']; ?>]").attr("selected", "selected");
	$("#meu_college option[value=<?php echo $result['college']; ?>]").attr("selected", "selected");
});

function saveuserinfo(){
	var uid = <?php echo $uid ?>;
	var meu_fn = $("#meu_fn").val();
	var meu_ln = $("#meu_ln").val();
	var meu_gender  = $("#meu_gender").val();
	var meu_type  = $("#meu_type").val();
	var meu_email  = $("#meu_email").val();
	var meu_ivtrained  = $("#meu_ivtrained").val();
	var meu_athtrained  = $("#meu_athtrained").val();
	var meu_phone  = $("#meu_phone").val();
	var meu_sha  = $("#meu_sha").val();
	var meu_eth  = $("#meu_eth").val();
	var meu_major  = $("#meu_major").val();
	var meu_college  = $("#meu_college").val();
	var meu_gy  = $("#meu_gy").val();
	var meu_ht  = $("#meu_ht").val();
	var meu_state  = $("#meu_state").val();
	var meu_country  = $("#meu_country").val();
	var meu_hs  = $("#meu_hs").val();

	$.ajax({
		type: "POST",
		url: "processedituserinfo.php",
		data: {uid: uid, fn: meu_fn, ln: meu_ln, gender: meu_gender, type: meu_type, email: meu_email,
				iv: meu_ivtrained, ath: meu_athtrained, phone: meu_phone, sha: meu_sha, eth: meu_eth,
				major: meu_major, college: meu_college, gy: meu_gy, ht: meu_ht, state: meu_state, country: meu_country, hs: meu_hs}
	})
	.done(function(){
		loaduserinfo();
	});
}


function loaduserinfo(){
	var uid = $("#canceluserinfo").data('uid');
	$("#userinfo").load("moduleuserinfo.php?uid=" + uid);
}

</script>

