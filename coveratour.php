<?php
session_start();
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
    <style type="text/css"></style>
    <script>
    function AcceptShift(CID)
    {
    $.post("handleaccept.php", { cid : CID });
    }
    </script>
    </head>
        <body>
        <?php include 'nav.php'; ?>
        <br> <br>
    <div id="myTabContent" class="tab-content" >
        <div class = "tab-pane fade active in" id = "checkIn" >
        <h2 class = "col-md-offset-1" > Coverage Manager </h2 >
        <center>
    <table dir = "ltr" width = "1000" border = "1" summary = "purpose/structure for speech output">
        <caption> Choose
    a
    tour
    to
    cover
    and
    hit
    accept
    at
    the
    end
    of
    its
    row!
    </caption>
    <colgroup width="20%" />
        <colgroup id="colgroup" class="colgroup" align="center" valign="middle" title="title" width="1*" span="0" style="background:#ddd;" / >
        <thead>
        <tr>
    <th scope="col"> Name </th>
    <th scope = "col" > Day </th>
    <th scope = "col" > Time </th>
    <th scope = "col" > Tour Type </th>
    <th scope = "col" > Date </th>
    <th scope = "col" > Actions </th>
    </tr>
    </thead>
        <tbody>
    <?php include "sql_login.php";

    

	$mtimecon = array(9=>'8:45 AM - 9:15 AM', 10=>'9:45 AM - 10:15 AM', 11=>'10:45 AM - 11:15 AM', 12=>'11:45 AM - 12:15 PM', 
					 13=>'12:45 PM - 1:15 PM', 14=>'1:45 PM - 2:15 PM', 15=>'2:45 PM - 3:15 PM', 16=>'3:45 PM - 4:15 PM');
	$ttimecon = array(10=>'10 AM', 11=>'11 AM', 12=>'12 PM', 13=>'1 PM', 14=>'2 PM', 15=>'3 PM', 16=>'4 PM');
	$daycon = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
	$typecon = array("Explore NU", "Athletic", "IV", "Mingler");
	
	$curdate = date('Y-m-d');
	
	$res = mysqli_query($mysqli, "SELECT * FROM coverage c INNER JOIN master_roster mr ON mr.uid = c.uid ORDER BY c.date") or die(mysqli_error($mysqli));
    while ($row = mysqli_fetch_array($res)) {
		if ($row["covered"] == 0 && $row["date"] >= $curdate) {
	
			if ($row['type'] == 3){$time = $mtimecon[$row['time']];}
			else {$time = $ttimecon[$row['time']];}
			
			echo "<tr>
					<td>" . $row['first_name'] . " " . $row['last_name'] . "</td>
					<td>" . $daycon[$row['day']] . "</td>
					<td>$time</td>
					<td>" . $typecon[$row['type']] . "</td>
					<td>" . $row['date'] . "</td>
					<td><a href='acceptcoverage.php?uid=".$row['uid']."&day=".$row['day']."&time=".$row['time']."&week=".$row['week']."'>Take Shift</a></td>
				</tr>";
		}
    }
    ?>

    </tbody >
    </table >
    </center >

    </div >
    </form >
    </body >
    </html >