<html>
<body>

<?php
$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$guidename = $_POST["name"];
$coverage = $_POST["coverage"];
$shadow = $_POST["shadow"];
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

$file = fopen("changelist.txt", "a+");

$hour = "";

if (strtotime("08:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("10:29")) {
    $hour = "10am";
} elseif (strtotime("10:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("11:29")) {
    $hour = "11am";
} elseif (strtotime("11:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("12:29")) {
    $hour = "12pm";
} elseif (strtotime("12:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("14:29")) {
    $hour = "2pm";
} elseif (strtotime("14:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("15:29")) {
    $hour = "3pm";
} elseif (strtotime("15:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("16:29")) {
    $hour = "4pm";
}


if (strpos($guidename, '(C)') !== false) {
    $guidename = substr($guidename, 0, strlen($guidename) - 4);
    echo "Thanks for covering the tour, $guidename!";
    $ans = $mysqli->query("UPDATE Coverages SET `Covered`=2 WHERE `Coverer`='$guidename' AND `Day`='$realday' AND `Time`='$hour'");
    $ans2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$guidename'");
} else {

    $res = "";
    if ($coverage != "Select..." && $guidename == "Select...") {
        $answer = fwrite($file, $date . " " . $newtime . ": " . $coverage . " gave an additional tour!\n");
        $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$coverage'");
        echo "Thanks for giving an additional tour, " . $coverage . "!";
    } elseif ($shadow != "Select...") {
        $answer = fwrite($file, $date . " " . $newtime . ": " . $shadow . " shadowed a tour!\n");
        $res2 = $mysqli->query("UPDATE GuideList SET Shadowed=Shadowed + 1 WHERE Name='$shadow'");
        echo "Thanks for shadowing a tour, " . $shadow . "!";
    } elseif ($guidename == "Select..." && $coverage == "Select...") {
        echo "You did not choose a tour guide to check in.";
    } else {
        if ($coverage == "Select...") {
            if (strtotime("08:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("10:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "10AM SET " . $date . "=1 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$guidename'");
                echo $guidename . " checked in successfully!";
            } elseif (strtotime("10:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("11:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "11AM SET " . $date . "=1 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$guidename'");
                echo $guidename . " checked in successfully!";
            } elseif (strtotime("11:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("12:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "12PM SET " . $date . "=1 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$guidename'");
                echo $guidename . " checked in successfully!";
            } elseif (strtotime("12:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("14:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "2PM SET " . $date . "=1 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$guidename'");
                echo $guidename . " checked in successfully!";
            } elseif (strtotime("14:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("15:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "3PM SET " . $date . "=1 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$guidename'");
                echo $guidename . " checked in successfully!";
            } elseif (strtotime("15:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("16:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "4PM SET " . $date . "=1 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$guidename'");
                echo $guidename . " checked in successfully!";
            } else {
                echo "This time does not exist on the schedule";
            }
        } else {
            $answer = fwrite($file, $date . " " . $newtime . ": " . $coverage . " covered " . $guidename . "'s tour!\n");
            if (strtotime("08:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("10:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "10AM SET " . $date . "=2 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$coverage'");
                echo $coverage . " checked in for" . $guidename . " successfully!";
            } elseif (strtotime("10:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("11:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "11AM SET " . $date . "=2 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$coverage'");
                echo $coverage . " checked in for" . $guidename . " successfully!";
            } elseif (strtotime("11:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("12:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "12PM SET " . $date . "=2 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$coverage'");
                echo $coverage . " checked in for" . $guidename . " successfully!";
            } elseif (strtotime("12:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("14:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "2PM SET " . $date . "=2 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$coverage'");
                echo $coverage . " checked in for" . $guidename . " successfully!";
            } elseif (strtotime("14:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("15:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "3PM SET " . $date . "=2 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$coverage'");
                echo $coverage . " checked in for" . $guidename . " successfully!";
            } elseif (strtotime("15:30") <= strtotime($newtime) && strtotime($newtime) <= strtotime("16:29")) {
                $res = $mysqli->query("UPDATE " . $realday . "4PM SET " . $date . "=2 WHERE Name='$guidename'");
                $res2 = $mysqli->query("UPDATE GuideList SET completed=completed + 1 WHERE Name='$coverage'");
                echo $coverage . " checked in for" . $guidename . " successfully!";
            } else {
                echo "This time does not exist on the schedule";
            }
        }
    }
}
?>

<FORM METHOD="LINK" ACTION="dashboard.php">
    <INPUT TYPE="submit" VALUE="Go Back">
</FORM>

</html>
</body>