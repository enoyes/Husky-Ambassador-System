<?php

$date = new DateTime();
$date->modify('+1 day');
$querydate = $date->format('Y-m-d');

$mtimecon = array(9=>'8:45 AM - 9:15 AM', 10=>'9:45 AM - 10:15 AM', 11=>'10:45 AM - 11:15 AM', 12=>'11:45 AM - 12:15 PM',
    13=>'12:45 PM - 1:15 PM', 14=>'1:45 PM - 2:15 PM', 15=>'2:45 PM - 3:15 PM', 16=>'3:45 PM - 4:15 PM');
$mtimeconi = array(9=>'845am', 10=>'945am', 11=>'1045am', 12=>'1145am',
    13=>'1245pm', 14=>'145pm', 15=>'245pm', 16=>'345pm');
$ttimecon = array(10=>'10 AM', 11=>'11 AM', 12=>'12 PM', 13=>'1 PM', 14=>'2 PM', 15=>'3 PM', 16=>'4 PM');
$ttimeconi = array(10=>'10AM', 11=>'11AM', 12=>'12PM', 13=>'1PM', 14=>'2PM', 15=>'3PM', 16=>'4PM');
$daycon = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
$typecon = array("Explore NU", "Athletic", "IV", "Mingler");

$emails = "clamp.m@husky.neu.edu";
$content = ' <html><body><h4 align="center">These are the tours that need covering tomorrow ' .  $querydate . '. Please try to cover one!</h4>
    <table dir = "ltr" width = "1000" border = "1" summary = "purpose/structure for speech output" align = "center">
        <caption>
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
    </tr>
    </thead>';
$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("SELECT * FROM coverage c INNER JOIN master_roster mr ON mr.uid = c.uid WHERE `date`='$querydate' AND c.covered == 0");
$res->data_seek(0);

while ($row = $res->fetch_assoc()) {
    if ($row["type"] != 3) {
        $res2 = $mysqli->query("SELECT `Email` FROM `Availability` WHERE `" . $daycon[$row["day"]] . $ttimeconi[$row["time"]] . "`=1");
        $res2->data_seek(0);

        $content = $content . "<tr>
					<td>" . $row['first_name'] . " " . $row['last_name'] . "</td>
					<td>" . $daycon[$row['day']] . "</td>
					<td>" . $ttimecon[$row['time']] . "</td>
					<td>" . $typecon[$row['type']] . "</td>
					<td>" . $row['date'] . "</td>
				</tr>";

        while ($row2 = $res2->fetch_assoc()) {
            $emails = $row2["Email"] . ", " . $emails;
        }
    } else {
        $res2 = $mysqli->query("SELECT `Email` FROM `MinglerAvailability` WHERE `" . $daycon[$row["day"]] . $mtimeconi[$row["time"]] . "`=1");
        $res2->data_seek(0);

        $content = $content . "<tr>
					<td>" . $row['first_name'] . " " . $row['last_name'] . "</td>
					<td>" . $daycon[$row['day']] . "</td>
					<td>" . $mtimecon[$row['time']] . "</td>
					<td>" . $typecon[$row['type']] . "</td>
					<td>" . $row['date'] . "</td>
				</tr>";

        while ($row2 = $res2->fetch_assoc()) {
            $emails = $row2["Email"] . ", " . $emails;
        }
    }
}

$content = $content . "</body></html>";

$htmlcontent = <<<HTMLMAIL

$content

HTMLMAIL;

echo $emails . "\n";
echo $content;

$to = "operations@matthewclamp.com";
$subject = "HUSKY AMBASSADORS: You Might Be Available to Cover One of These Tours Tomorrow!";
$message = $htmlcontent . "\n \n \n Remember to go to www.matthewclamp.com/prototype/coveratour.php and find this shift if you'd like to cover it!";
$from = "operations@matthewclamp.com";
$headers = "";
$headers  .= 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
$headers .= "From:" . $from . "\r\n";
$headers .= "Bcc:" . $emails . "\r\n";

mail($to, $subject, $message, $headers);
?>