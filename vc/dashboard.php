<?php
session_start();
?>
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>

	<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>

    <style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>
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
                        <option value='0'>Select...</option>
                        <?php
						include "../sql_login.php";
						

						date_default_timezone_set('EST');
						
                        $newtime = date('H:i'); // 24H : Leading 0s minute
                        $day = date('w');
						$curdate = date('Y-m-d');
						$week = date('W') - 2;
						$daycon = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
						$typecon = array("Explore NU", "Athletic", "IV", "Mingler");
						
						$realday = $daycon[$day];

                        $date = date('Md');
						
 
						date_default_timezone_set('EST');

						$hour = date('G') + 2;
						//echo "TIME:".$hour;
						if (date('i') < 30){
							
						}
						else{
							$q = "	SELECT mr.first_name, mr.last_name, mr.uid, ms.type
									FROM master_schedule ms
									INNER JOIN master_roster mr ON mr.uid = ms.uid
									WHERE ms.day = $day AND ms.time = $hour 
									AND ms.uid NOT IN 
									(SELECT uid FROM attendance WHERE day = $day AND time = $hour AND week = $week AND status <> 0)
									ORDER BY mr.first_name";
							$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
							
							while($row = mysqli_fetch_array($result)){
								echo "<option value='".$row['uid']."'>".$row['first_name']." ".$row['last_name']."</option>";
							}
							
							$q = "SELECT mr.first_name, mr.last_name, c.coverer FROM coverage c 
									INNER JOIN master_roster mr ON mr.uid = c.coverer
									WHERE c.day = $day AND c.time = $hour AND c.week = $week";
							$result = mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
							while($row = mysqli_fetch_array($result)){
								echo "<option value='".$row['coverer']."'>".$row['first_name']." ".$row['last_name']." (Coverage)</option>";
							}
						}

                        ?>
						</select>
                        

                        
        
						<div class="shadow checkbox">
							<label><input type="checkbox" onclick="$('.shadow-open').slideToggle('1000')"/>Shadowing?</label>
                        </div>
                                    
						<div class="support checkbox">
							<label><input type="checkbox" onclick="$('.support-open').slideToggle('1000')"/>Supporting a Tour?</label>
                        </div>
						
						<div class="additional checkbox">
							<label><input type="checkbox" onclick="$('.additional-open').slideToggle('1000')"/>Additonal Tour</label>
						</div>
						
						<div class="shadow-open col-md-6">
                            <h3>Select your Name: </h3>
                                This is for new hires/Minglers who have shadowing requirements, NOT for official
                                shadowing!
                            <select name="shadow" class="form-control" id="shadow" form="checkin">
                                <option value='0'>Select...</option>
								<?php
								
								$q = "SELECT first_name, last_name, uid FROM master_roster ORDER BY first_name";
								$result = mysqli_query($mysqli, $q);


								while($row = mysqli_fetch_array($result)){
									echo "<option value='".$row['uid']."'>".$row['first_name']." ".$row['last_name']."</option>";
								}
								?>
                            </select>
						</div>

                        <div class="support-open col-md-6">
							<h3>Select your Name: </h3>
                            This is for Minglers who have support assistant requirements.
                            <select name="support" class="form-control" id="support" form="checkin">
								<option value='0'>Select...</option>
								<?php
							   

								$q = "SELECT first_name, last_name, uid FROM master_roster WHERE type = 3 ORDER BY first_name";
								$result = mysqli_query($mysqli, $q);


								while($row = mysqli_fetch_array($result)){
									echo "<option value='".$row['uid']."'>".$row['first_name']." ".$row['last_name']."</option>";
								}
								?>
                            </select>
						</div>
						
						<div class="additional-open col-md-6">
							<h3>Select your Name: </h3>
                            This is if you are giving an additional tour. Anyone requesting coverage will also receive it at this time
                            <select name="additional" class="form-control" id="additional" form="checkin">
								<option value='0'>Select...</option>
								<?php
							   

								$q = "SELECT first_name, last_name, uid FROM master_roster ORDER BY first_name";
								$result = mysqli_query($mysqli, $q);


								while($row = mysqli_fetch_array($result)){
									echo "<option value='".$row['uid']."'>".$row['first_name']." ".$row['last_name']."</option>";
								}
								?>
                            </select>
						</div>

                <br/>
				</div>
            </div>

			<div  id="checkin">
                <button type="submit" class="col-md-offset-8 btn btn-primary">Check In</button>
			</div>
		</fieldset>
	</div>
</div>



</div>
<br/>
<br/><br/>
<br/><br/>
<br/><br/>
<footer>
    
</footer>
</div>
<script src="../leadership/js/bootstrap.js"></script>
<script>
    //$('.coverage-open').slideUp(0);

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
		
		if ((currentMinutes == 0 || currentMinutes == 30) && currentSeconds == 00){
			location.reload();
		}
    }
	
	function checkin(){
		var uid = $("#tourGuide").val();
		var shadow = $("#shadow").val();
		var support = $("#support").val();
		var additional = $("#additional").val();
		
		if (uid == 0 && shadow == 0 && support == 0 && additional == 0){alert("Please select a user");return -1;}
		
		$.ajax({
			type: "POST",
			url: "checkin.php",
			data: {uid: uid, shadow: shadow, support: support, additional:additional}
		})
		.done(function(msg){
			alert(msg);
			location.reload();
		});
	}
	
	console.log("Day: <?php echo $day?>, Date: <?php echo $curdate?>, Week: <?php echo $week?>, Time: <?php echo $newtime?>");

    $(document).ready(function () {
		$("#checkin").click(checkin);
		updateClock();
        setInterval(updateClock, 1000);
		$('.shadow-open').slideUp(0);
		$('.support-open').slideUp(0);
		$('.additional-open').slideUp(0);
    });
</script>

</body>
