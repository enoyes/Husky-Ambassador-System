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

<div class="well col-lg-8 col-lg-offset-2">
<form class="horizontal-form" action=<?php echo "processcreateaudit.php?uid=" . $_GET['uid'] ?> method="POST">
<div class="form-group">
    <label for="year" class="col-lg-8 control-label">Class Year</label>

    <div class="col-lg-10">
        <select class="form-control" name="year" id="year">
            <option value="" selected="selected">Select...</option>
            <option value="Second Year">Second Year</option>
            <option value="Third Year">Third Year</option>
            <option value="Fourth Year">Fourth Year</option>
            <option value="Fifth Year">Fifth Year</option>
        </select>
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="estimate" class="col-lg-8 control-label">Estimated Tour Size</label>

    <div class="col-lg-10">
        <input type="text" class="form-control" id="estimate" name="estimate" placeholder="Estimated Tour Size">
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="arrival" class="col-lg-8 control-label">Did the tour guide arrive 10-15 minutes before the tour?</label>

    <div class="col-lg-10">
        <select class="form-control" name="arrival" id="arrival">
            <option value="" selected="selected">Select...</option>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="introduction" class="col-lg-8 control-label">Did the tour guide properly introduce themselves and the tour to the group?</label>

    <div class="col-lg-10">
        <select class="form-control" name="introduction" id="introduction">
            <option value="" selected="selected">Select...</option>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="safety" class="col-lg-8 control-label">Did the tour guide safely cross the streets with the walk signal?</label>

    <div class="col-lg-10">
        <select class="form-control" name="safety" id="safety">
            <option value="" selected="selected">Select...</option>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="backwards" class="col-lg-8 control-label">Did the tour guide walk backwards at all during the tour?</label>

    <div class="col-lg-10">
        <select class="form-control" name="backwards" id="backwards">
            <option value="" selected="selected">Select...</option>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="facts" class="col-lg-8 control-label">Were the facts presented in the tour accurate to the best of your knowledge?</label>

    <div class="col-lg-10">
        <select class="form-control" name="facts" id="facts">
            <option value="" selected="selected">Select...</option>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
        <br>
    </div>
</div>
<br>
<div class="form-group">
    <label for="sevencolleges" class="col-lg-8 control-label">Did the tour guide mention all seven colleges?</label>

    <div class="col-lg-10">
        <select class="form-control" name="sevencolleges" id="sevencolleges">
            <option value="" selected="selected">Select...</option>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="time" class="col-lg-8 control-label">Estimated Tour Time</label>

    <div class="col-lg-10">
        <input type="text" class="form-control" id="time" name="time" placeholder="Estimated Tour Time">
        <br>
    </div>
</div>
<div class="form-group">
    <label for="circumstances" class="col-lg-8 control-label">Were there any extenuating circumstances on tour to be aware of?</label>

    <div class="col-lg-10">
        <textarea name="circumstances" rows=5 class="col-lg-12 control-label" placeholder="Extenuating Circumstances"></textarea>
        <br>
    </div>
</div>

    <div class="form-group">
        <label for="generalfeedback" class="col-lg-8 control-label">Comments regarding general feedback?</label>

        <div class="col-lg-10">
            <textarea name="generalfeedback" rows=5 class="col-lg-12 control-label" placeholder="General Feedback"></textarea>
            <br>
        </div>
    </div>
    <div class="form-group">
        <label for="stories" class="col-lg-8 control-label">The tour guide implemented stories throughout the tour in an appropriate manner.</label>

        <div class="col-lg-10">
            <select class="form-control" name="stories" id="stories">
                <option value="" selected="selected">Select...</option>
                <option value="Strongly Disagree">Strongly Disagree</option>
                <option value="Disagree">Disagree</option>
                <option value="Agree">Agree</option>
                <option value="Strongly Agree">Strongly Agree</option>
            </select>
            <br>
        </div>
    </div>
    <div class="form-group">
    <label for="storiescomments" class="col-lg-8 control-label">Comments:</label>

        <div class="col-lg-10">
            <textarea name="storiescomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
            <br>
        </div>
    </div>
    <div class="form-group">
        <label for="academics" class="col-lg-8 control-label">The tour guide thoroughly and accurately discussed academics throughout the tour.</label>

        <div class="col-lg-10">
            <select class="form-control" name="academics" id="academics">
                <option value="" selected="selected">Select...</option>
                <option value="Strongly Disagree">Strongly Disagree</option>
                <option value="Disagree">Disagree</option>
                <option value="Agree">Agree</option>
                <option value="Strongly Agree">Strongly Agree</option>
            </select>
            <br>
        </div>
    </div>
    <div class="form-group">
        <label for="academicscomments" class="col-lg-8 control-label">Comments:</label>

        <div class="col-lg-10">
            <textarea name="academicscomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
            <br>
        </div>
    </div>
    <div class="form-group">
        <label for="research" class="col-lg-8 control-label">The tour guide properly explained and provided examples of research.</label>

        <div class="col-lg-10">
            <select class="form-control" name="research" id="research">
                <option value="" selected="selected">Select...</option>
                <option value="Strongly Disagree">Strongly Disagree</option>
                <option value="Disagree">Disagree</option>
                <option value="Agree">Agree</option>
                <option value="Strongly Agree">Strongly Agree</option>
            </select>
            <br>
        </div>
    </div>
    <div class="form-group">
        <label for="researchcomments" class="col-lg-8 control-label">Comments:</label>

        <div class="col-lg-10">
            <textarea name="researchcomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
            <br>
        </div>
    </div>
<div class="form-group">
    <label for="servicelearning" class="col-lg-8 control-label">The tour guide properly explained and provided examples of service learning.</label>

    <div class="col-lg-10">
        <select class="form-control" name="servicelearning" id="servicelearning">
            <option value="" selected="selected">Select...</option>
            <option value="Strongly Disagree">Strongly Disagree</option>
            <option value="Disagree">Disagree</option>
            <option value="Agree">Agree</option>
            <option value="Strongly Agree">Strongly Agree</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="servicelearningcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        <textarea name="servicelearningcomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studyabroad" class="col-lg-8 control-label">The tour guide properly explained and provided examples of study abroad.</label>

    <div class="col-lg-10">
        <select class="form-control" name="studyabroad" id="studyabroad">
            <option value="" selected="selected">Select...</option>
            <option value="Strongly Disagree">Strongly Disagree</option>
            <option value="Disagree">Disagree</option>
            <option value="Agree">Agree</option>
            <option value="Strongly Agree">Strongly Agree</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studyabroadcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        <textarea name="studyabroadcomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="coop" class="col-lg-8 control-label">The tour guide properly explained and provided examples of co-op.</label>

    <div class="col-lg-10">
        <select class="form-control" name="coop" id="coop">
            <option value="" selected="selected">Select...</option>
            <option value="Strongly Disagree">Strongly Disagree</option>
            <option value="Disagree">Disagree</option>
            <option value="Agree">Agree</option>
            <option value="Strongly Agree">Strongly Agree</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="coopcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        <textarea name="coopcomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studentlife" class="col-lg-8 control-label">The tour guide properly explained and provided examples of student life.</label>

    <div class="col-lg-10">
        <select class="form-control" name="studentlife" id="studentlife">
            <option value="" selected="selected">Select...</option>
            <option value="Strongly Disagree">Strongly Disagree</option>
            <option value="Disagree">Disagree</option>
            <option value="Agree">Agree</option>
            <option value="Strongly Agree">Strongly Agree</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="studentlifecomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        <textarea name="studentlifecomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="presentation" class="col-lg-8 control-label">The tour guide presented him/herself and Northeastern in a positive and enthusiastic manner.</label>

    <div class="col-lg-10">
        <select class="form-control" name="presentation" id="presentation">
            <option value="" selected="selected">Select...</option>
            <option value="Strongly Disagree">Strongly Disagree</option>
            <option value="Disagree">Disagree</option>
            <option value="Agree">Agree</option>
            <option value="Strongly Agree">Strongly Agree</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="presentationcomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        <textarea name="presentationcomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="questions" class="col-lg-8 control-label">The tour guide fielded questions appropriately.</label>

    <div class="col-lg-10">
        <select class="form-control" name="questions" id="questions">
            <option value="" selected="selected">Select...</option>
            <option value="Strongly Disagree">Strongly Disagree</option>
            <option value="Disagree">Disagree</option>
            <option value="Agree">Agree</option>
            <option value="Strongly Agree">Strongly Agree</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="questionscomments" class="col-lg-8 control-label">Comments:</label>

    <div class="col-lg-10">
        <textarea name="questionscomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="presentationskills" class="col-lg-8 control-label">Please describe the tour guides presentation skills and how they employed them throughout the tour.</label>

    <div class="col-lg-10">
        <textarea name="presentationskills" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="strengths" class="col-lg-8 control-label">What are the strengths of this tour guide?</label>

    <div class="col-lg-10">
        <textarea name="strengths" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="improve" class="col-lg-8 control-label">What are the areas this tour guide can improve upon?</label>

    <div class="col-lg-10">
        <textarea name="improve" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="color" class="col-lg-8 control-label">How would you flag this tour guide?</label>

    <div class="col-lg-10">
        <select class="form-control" name="color" id="color">
            <option value="" selected="selected">Select...</option>
            <option value="Red">Red</option>
            <option value="Yellow">Yellow</option>
            <option value="Green">Green</option>
        </select>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="colorcomments" class="col-lg-8 control-label">If Red or Green, in which key area is this tour guide flagged?</label>

    <div class="col-lg-10">
        <textarea name="colorcomments" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="additional" class="col-lg-8 control-label">Additional Comments:</label>

    <div class="col-lg-10">
        <textarea name="additional" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>
<div class="form-group">
    <label for="addressed" class="col-lg-8 control-label">Have you seen anything come up in evaluation that you believe should be addressed at a future monthly meeting?</label>

    <div class="col-lg-10">
        <textarea name="addressed" rows=5 class="col-lg-12 control-label" placeholder="Comments"></textarea>
        <br>
    </div>
</div>

<button type="submit" style="margin-right:15px;margin-top:20px;" class=" pull-right btn btn-lg btn-primary">
    Submit
</button>
</form>
</body>
</html>


