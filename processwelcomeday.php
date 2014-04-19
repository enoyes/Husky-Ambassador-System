<html>
<body>
<?php
include "sql_login.php";

$uid = $_POST["coverage"];
$day = $_POST["welcomeday"];

$name = htmlentities($name, null, 'utf-8');
$name = str_replace("&nbsp;", " ", $name);


$q = "SELECT * FROM requirements WHERE uid = $uid AND event like 'WD%'";
$result = mysqli_query($mysqli, $q);
if (mysqli_num_rows($result) !== 0){
	$q = "UPDATE requirements SET event = '$day' WHERE event like 'WD%'";
	mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
}
else{
	$q = "INSERT INTO requirements VALUES($uid, $day, 0)";
	mysqli_query($mysqli, $q) or die(mysqli_error($mysqli));
}


echo "Thanks for signing up for a welcome day!<br>";
echo "\n <img src=http://static.tumblr.com/5d57d5e2c4815897359c56bd4546b985/n9jaxcm/G17mrconq/tumblr_static_pigletcute.jpg height=400 width=600 />";

?>
</body>
</html>