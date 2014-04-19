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
<?php
$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$uid = $_GET["uid"];
$date = $_GET["date"];


$res = $mysqli->query("SELECT * FROM Evaluations WHERE `UID`=$uid AND `Date`='$date'");

$res->data_seek(0);
$row = $res->fetch_assoc();
$date = htmlentities($date, null, 'utf-8');
$date = str_replace(" ", "%20", $date);
$url = "updateslccolor.php?uid=" . $uid . "&date=" . $date;

$date = htmlentities($date, null, 'utf-8');
$date = str_replace("%20", " ", $date);
echo '
<div class="well col-lg-8 col-lg-offset-2">
    <label for="year" class="col-lg-8 control-label">SLC Color</label> ';
    if ($row["SLCColor"] == "Not Assigned") {
        echo '
    <form class="horizontal-form" action=' . $url; echo ' method="POST">
    <div class="form-group">
    <div class="col-lg-8">
        <select class="form-control" name="slccolor" id="slccolor">
            <option value="Not Assigned" selected="selected">Not Assigned</option>
            <option value="Green">Green</option>
            <option value="Yellow">Yellow</option>
            <option value="Red">Red</option>
        </select> <button type="submit">Update</button>';
    } else if ($row["SLCColor"] == "Green") {
        echo '
    <form class="horizontal-form" action=' . $url; echo ' method="POST">
    <div class="form-group">
        <div class="col-lg-8">
        <select class="form-control" name="slccolor" id="slccolor">
            <option value="Not Assigned">Not Assigned</option>
            <option value="Green" selected="selected">Green</option>
            <option value="Yellow">Yellow</option>
            <option value="Red">Red</option>
        </select> <button type="submit">Update</button>';
    } else if ($row["SLCColor"] == "Yellow") {
        echo '
    <form class="horizontal-form" action=' . $url; echo ' method="POST">
       <div class="form-group">
        <div class="col-lg-8">
        <select class="form-control" name="slccolor" id="slccolor">
            <option value="Not Assigned">Not Assigned</option>
            <option value="Green">Green</option>
            <option value="Yellow" selected="selected">Yellow</option>
            <option value="FRed">Red</option>
        </select> <button type="submit">Update</button>';
    } else {
        echo '
    <form class="horizontal-form" action=' . $url; echo ' method="POST">
        <div class="form-group">
        <div class="col-lg-8">
        <select class="form-control" name="slccolor" id="slccolor">
            <option value="Not Assigned">Not Assigned</option>
            <option value="Green">Green</option>
            <option value="Yellow">Yellow</option>
            <option value="Red" selected="selected">Red</option>
        </select> <button type="submit">Update</button>';
    }
     echo '
     </form>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="year" class="col-lg-8 control-label">Class Year</label>
<div class="col-lg-10">
        ' . $row["Year"] . '
    <br>
</div>
</div>
<br>
<div class="form-group">
    <label for="estimate" class="col-lg-8 control-label">Estimated Tour Size</label>

    <div class="col-lg-10">
        ' . $row["TourSize"] . '
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="arrival" class="col-lg-8 control-label">Did the tour guide arrive 10-15 minutes before the tour?</label>

    <div class="col-lg-10">
        ' . $row["PromptArrival"] . '
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="introduction" class="col-lg-8 control-label">Did the tour guide properly introduce themselves and the tour to the group?</label>

    <div class="col-lg-10">
        ' . $row["ProperIntroduction"] . '
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="safety" class="col-lg-8 control-label">Did the tour guide safely cross the streets with the walk signal?</label>

    <div class="col-lg-10">
        ' . $row["SafetyInCrosswalk"] . '
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="backwards" class="col-lg-8 control-label">Did the tour guide walk backwards at all during the tour?</label>

    <div class="col-lg-10">
        ' . $row["WalkBackwards"] . '

        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="facts" class="col-lg-8 control-label">Were the facts presented in the tour accurate to the best of your knowledge?</label>

    <div class="col-lg-10">
        ' . $row["AccurateFacts"] . '
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="sevencolleges" class="col-lg-8 control-label">Did the tour guide mention all seven colleges?</label>

    <div class="col-lg-10">
        ' . $row["SevenColleges"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="time" class="col-lg-8 control-label">Estimated Tour Time</label>

    <div class="col-lg-10">
        ' . $row["TourLength"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="circumstances" class="col-lg-8 control-label">Were there any extenuating circumstances on tour to be aware of?</label>

    <div class="col-lg-10">
        ' . $row["Circumstances"] . '
        <br>
    </div>
</div>

<div class="form-group">
    <label for="generalfeedback" class="col-lg-8 control-label">Comments regarding general feedback?</label>

    <div class="col-lg-10">
        ' . $row["GeneralFeedback"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="stories" class="col-lg-8 control-label">The tour guide implemented stories throughout the tour in an appropriate manner.</label>

    <div class="col-lg-10">
        ' . $row["Stories"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="storiescomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["StoriesComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="academics" class="col-lg-8 control-label">The tour guide thoroughly and accurately discussed academics throughout the tour.</label>

    <div class="col-lg-10">
        ' . $row["Academics"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="academicscomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["AcademicsComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="research" class="col-lg-8 control-label">The tour guide properly explained and provided examples of research.</label>

    <div class="col-lg-10">
        ' . $row["Research"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="researchcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["ResearchComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="servicelearning" class="col-lg-8 control-label">The tour guide properly explained and provided examples of service learning.</label>

    <div class="col-lg-10">
        ' . $row["ServiceLearning"] . '
    <br>
    </div>
</div>
<div class="form-group">
    <label for="servicelearningcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["ServiceLearningComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studyabroad" class="col-lg-8 control-label">The tour guide properly explained and provided examples of study abroad.</label>

    <div class="col-lg-10">
        ' . $row["StudyAbroad"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studyabroadcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["StudyAbroadComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="coop" class="col-lg-8 control-label">The tour guide properly explained and provided examples of co-op.</label>

    <div class="col-lg-10">
        ' . $row["Coop"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="coopcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["CoopComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studentlife" class="col-lg-8 control-label">The tour guide properly explained and provided examples of student life.</label>

    <div class="col-lg-10">
        ' . $row["StudentLife"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studentlifecomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["StudentLifeComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="presentation" class="col-lg-8 control-label">The tour guide presented him/herself and Northeastern in a positive and enthusiastic manner.</label>

    <div class="col-lg-10">
        ' . $row["Presentation"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="presentationcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["PresentationComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="questions" class="col-lg-8 control-label">The tour guide fielded questions appropriately.</label>

    <div class="col-lg-10">
        ' . $row["Questions"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="questionscomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        ' . $row["QuestionsComments"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="presentationskills" class="col-lg-8 control-label">Please describe the tour guides presentation skills and how they employed them throughout the tour.</label>

    <div class="col-lg-10">
        ' . $row["PresentationBlurb"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="strengths" class="col-lg-8 control-label">What are the strengths of this tour guide?</label>

    <div class="col-lg-10">
        ' . $row["TourStrengths"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="improve" class="col-lg-8 control-label">What are the areas this tour guide can improve upon?</label>

    <div class="col-lg-10">
        ' . $row["Improving"] .'
        <br>
    </div>
</div>
<div class="form-group">
    <label for="color" class="col-lg-8 control-label">How would you flag this tour guide?</label>

    <div class="col-lg-10">
        ' . $row["Color"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="colorcomments" class="col-lg-8 control-label">If Red or Green, in which key area is this tour guide flagged?</label>

    <div class="col-lg-10">
        ' . $row["FlaggedHuh"] . '
        <br>
    </div>
</div>
<div class="form-group">
    <label for="additional" class="col-lg-8 control-label">Additional Comments:</label>

    <div class="col-lg-10">
        ' . $row["AdditionalComments"] . '
                <br>
    </div>
</div>
<div class="form-group">
    <label for="addressed" class="col-lg-8 control-label">Have you seen anything come up in evaluation that you believe should be addressed at a future monthly meeting?</label>

    <div class="col-lg-10">
        ' . $row["BringUp"] . '
        <br>
    </div>
</div>'; ?>
</body>
</html>
