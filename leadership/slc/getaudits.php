<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] != "SLC") {
    header("location:http://matthewclamp.com/prototype/index.php");
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="../../css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" href="../../css/bootswatch.css" media="screen"/>
    <style>
        .navbar {
            background-image: -webkit-linear-gradient(rgb(255, 92, 92), rgb(187, 21, 21) 60%, rgb(255, 0, 0));
            border-bottom: 1px solid rgb(255, 0, 0);
        }

        .nav-tabs > li > a {
            color: rgb(255, 0, 0);
        }

        h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {

            color: rgb(185, 0, 0);
        }

        .navbar-brand {
            font-size: 25px;
        }
    </style>
    <style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>
<br> <br> <br> <br> <br>

<div id="myTabContent" class="tab-content" >
    <div class = "tab-pane fade active in" id = "checkIn" >
        <h2 class = "col-md-offset-1" > Evaluation Manager </h2 >
        <center>
            <table dir = "ltr" width = "1000" border = "1" summary = "purpose/structure for speech output">

<colgroup width="20%" />
<colgroup id="colgroup" class="colgroup" align="center" valign="middle" title="title" width="1*" span="0" style="background:#ddd;" / >
<thead>
<tr>
    <th scope="col"> Color </th>
    <th scope = "col" > Date </th>
    <th scope = "col" > Open Evaluation </th>
</tr>
</thead>
<tbody>

<?php

$uid = $_GET['uid'];

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("SELECT * FROM Evaluations WHERE `UID`=$uid ORDER BY `Date` Asc");

$res->data_seek(0);

while ($row = $res->fetch_assoc()) {
    if ($row["Covered"] == 0) {
        echo "<tr bgcolor=";
        if ($row['SLCColor'] == "Green") {
            echo "#00FF00";
        } else if ($row['SLCColor'] == "Yellow") {
            echo "#FFFF00";
        } else if ($row['SLCColor'] == "Red") {
            echo "#FF0000";
        } else {
            echo "";
        }

        echo ">
            <td>" . $row['SLCColor'] . "</td>
            <td>" . $row['Date'] . "</td>
            <td><a href='openaudit.php?uid=" . $row['UID'] . "&date=" . $row['Date'] ."'>Open Evaluation</a></td>
        </tr>";
    }
}

?>


</tbody>
            </table>
        </center

    </di >
    </form>
</body>
</html>