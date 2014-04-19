<?php
session_start();
if(isset($_SESSION['username'])){
    header("location:homepage.php");
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" href="css/bootswatch.css" media="screen"/>
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
<br> <br>
<br><br><br>
<div class="col-lg-offset-4 col-lg-4">
    <form action="monthlycheckinprocess.php" method="post" id="checkin">
    <fieldset>
<select name="shadow" class="form-control" id="checkin" form="checkin">
                                        <option>Select...</option>
                                        <?php
                                        $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                        if ($mysqli->connect_errno) {
                                            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                        }

                                        echo $mysqli->host_info . "\n";

                                        $res = $mysqli->query("SELECT Name FROM GuideList WHERE `Feb25Attendance`=0 ORDER BY Name ASC");

                                        $res->data_seek(0);

                                        while ($row = $res->fetch_assoc()) {
                                            echo "<option>" . $row['Name'] . "</option> \n";
                                        }
                                            ?>
   </select>

<form action="monthlycheckinprocess.php" method="post" id="checkin">
<br><br><br>
    <button type="submit" class="col-md-offset-8 btn btn-primary">Check In</button>
    </form>
    </fieldset>
</body>
</html>