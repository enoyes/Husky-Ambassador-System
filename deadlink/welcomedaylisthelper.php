<?php
$q = $_GET['q'];

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

if ($q == "Not signed up!") {
    $q = "";
} else {
    $q = htmlentities($q, null, 'utf-8');
}

$res = $mysqli->query("SELECT * FROM GuideList WHERE WelcomeDay='$q' ORDER BY Name ASC");

$res->data_seek(0);

while ($row = $res->fetch_assoc()) {

    echo $row['Name'] . "<br>";
}
?>