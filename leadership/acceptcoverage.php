<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
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
<br> <br> <br> <br> <br>

<center><h4> Please choose your name (you are the person covering the tour) and click submit! </h4></center>
<br> <br>

<div class="well col-lg-6 col-lg-offset-3">
    <form name="wd" class="horizontal-form"
          action=<?php echo "processacceptcoverage.php?cid=" . $_GET["cid"]; ?> method="POST">
        <h3>Name: </h3>

        <div class="form-group">
            <select name="coverage" class="form-control" id="coverage">
                <option>Select...</option>
                <?php
                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                if ($mysqli->connect_errno) {
                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                }

                echo $mysqli->host_info . "\n";

                $res = $mysqli->query("SELECT Name FROM GuideList ORDER BY Name ASC");

                $res->data_seek(0);

                while ($row = $res->fetch_assoc()) {
                    echo "<option>" . $row['Name'] . "</option>";
                }
                ?>
                $val</select></div>

        <button type="submit" style="margin-right:15px;margin-top:20px;" class=" pull-right btn btn-lg btn-primary">
            Submit
        </button>
    </form>
</div>

</body>
</html>