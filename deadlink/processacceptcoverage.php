<?php

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

if ($_POST["coverage"] == "Select...") {
    echo "No name selected, coverage not recorded.";
} else {
    $res2 = $mysqli->query("UPDATE Coverages SET `Covered`=1, `Coverer`='$_POST[coverage]' WHERE `CID`=$_GET[cid]");

    $res3 = $mysqli->query("SELECT * FROM Coverages WHERE `CID`=$_GET[cid]");
    $res3->data_seek(0);

    $email = "";
    $toemail = "";
    $to2 = "";
    $day = "";
    $time = "";
    $date = "";

    $to = "";
    while ($row = $res3->fetch_assoc()) {
        $to2 = $row["Name"];
        $day = $row["Day"];
        $time = $row["Time"];
        $type = $row["TourType"];
        $date = $row["Date"];

        //$to2 = htmlentities($to2, null, 'utf-8');
        //$to2 = str_replace("&nbsp;", " ", $to2);


        $name = $_POST['coverage'];
        $name = htmlentities($name, null, 'utf-8');
        $name = str_replace("&nbsp;", " ", $name);


        $firstnameto = substr($to2, 0, strpos($to2, " "));
        $lastnameto = substr($to2, strpos($to2, " ") + 1);

        $firstname = substr($name, 0, strpos($name, " "));
        $lastname = substr($name, strpos($name, " ") + 1);

        $res4 = $mysqli->query("SELECT * FROM Availability WHERE `FirstName`='$firstnameto' AND `LastName`='$lastnameto'");
        $res4->data_seek(0);
        $toemail = "";
        $row = $res4->fetch_assoc();
        $toemail = $row['Email'];


        $res5 = $mysqli->query("SELECT * FROM Availability WHERE `FirstName`='$firstname' AND `LastName`='$lastname'");
        $res5->data_seek(0);
        $email = "";
        $row = $res5->fetch_assoc();
        $email = $row['Email'];

        $date2 = substr($date, 5);
        $date2 = str_replace("-", "/", $date2);

        $time = str_replace("p", "P", $time);
        $time = str_replace("m", "M", $time);
        $time = str_replace("a", "A", $time);

        $res6 = $mysqli->query("UPDATE $day$time SET `$date2`=2 WHERE `Name`='$name'");
    }

    $to = "clamp.m@husky.neu.edu," . $email . "," . $toemail;
    $subject = "HUSKY AMBASSADORS: " . $_POST['coverage'] . " has agreed to cover " . $to2 . "'s $type tour on $day at $time - $date!";
    $message = "Please let Matt Clamp and Hannah Burnett (clamp.m@husky.neu.edu, h.burnett@neu.edu) know if this was a mistake!";
    $from = "clamp.m@husky.neu.edu";
    $headers = "From:" . $from;
    mail($to, $subject, $message, $headers);

    echo "Thank you for accepting this tour, an email has been sent to you and who you are covering. It is now your responsibility to complete this tour!";


}

?>