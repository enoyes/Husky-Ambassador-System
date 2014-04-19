<?php
session_start();
if(!isset($_SESSION['username'])){
    header("location:index.php");
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

<center><h4> Hi all, I am trying to update the HA Master Roster with everyone's information, so I thought it easier to
        start fresh.
        <br> Please fill out ALL of the information below and click submit. Thanks! - Matt </h4></center>
<br> <br>

<div class="well col-lg-6 col-lg-offset-3">
    <form class="horizontal-form" action="process.php" method="POST">
        <div class="form-group">
            <label for="firstName" class="col-lg-4 control-label">First Name</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="First name">
            </div>
        </div>
        <div class="form-group">
            <label for="lastName" class="col-lg-4 control-label">Last Name</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name">
            </div>
        </div>
        <div class="form-group">
            <label for="gender" class="col-lg-4 control-label">Gender</label>

            <div class="col-lg-8">
                <select class="form-control" name="gender" id="gender">
                    <option value="" selected="selected">Select a Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="homeTown" class="col-lg-4 control-label">Home Town</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="homeTown" name="homeTown" placeholder="Home Town">
            </div>
        </div>
        <div class="form-group">
            <label for="state" class="col-lg-4 control-label">State or Country</label>

            <div class="col-lg-8">
                <select class="form-control" name="state" id="state">
                    <option value="" selected="selected">Select a State</option>
                    <option value="AL">Alabama</option>
                    <option value="AK">Alaska</option>
                    <option value="AZ">Arizona</option>
                    <option value="AR">Arkansas</option>
                    <option value="CA">California</option>
                    <option value="CO">Colorado</option>
                    <option value="CT">Connecticut</option>
                    <option value="DE">Delaware</option>
                    <option value="DC">District Of Columbia</option>
                    <option value="FL">Florida</option>
                    <option value="GA">Georgia</option>
                    <option value="HI">Hawaii</option>
                    <option value="ID">Idaho</option>
                    <option value="IL">Illinois</option>
                    <option value="IN">Indiana</option>
                    <option value="IA">Iowa</option>
                    <option value="KS">Kansas</option>
                    <option value="KY">Kentucky</option>
                    <option value="LA">Louisiana</option>
                    <option value="ME">Maine</option>
                    <option value="MD">Maryland</option>
                    <option value="MA">Massachusetts</option>
                    <option value="MI">Michigan</option>
                    <option value="MN">Minnesota</option>
                    <option value="MS">Mississippi</option>
                    <option value="MO">Missouri</option>
                    <option value="MT">Montana</option>
                    <option value="NE">Nebraska</option>
                    <option value="NV">Nevada</option>
                    <option value="NH">New Hampshire</option>
                    <option value="NJ">New Jersey</option>
                    <option value="NM">New Mexico</option>
                    <option value="NY">New York</option>
                    <option value="NC">North Carolina</option>
                    <option value="ND">North Dakota</option>
                    <option value="OH">Ohio</option>
                    <option value="OK">Oklahoma</option>
                    <option value="OR">Oregon</option>
                    <option value="PA">Pennsylvania</option>
                    <option value="RI">Rhode Island</option>
                    <option value="SC">South Carolina</option>
                    <option value="SD">South Dakota</option>
                    <option value="TN">Tennessee</option>
                    <option value="TX">Texas</option>
                    <option value="UT">Utah</option>
                    <option value="VT">Vermont</option>
                    <option value="VA">Virginia</option>
                    <option value="WA">Washington</option>
                    <option value="WV">West Virginia</option>
                    <option value="WI">Wisconsin</option>
                    <option value="WY">Wyoming</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="country" class="col-lg-4 control-label">Country</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="country" name="country" placeholder="Country">
            </div>
        </div>
        <div class="form-group">
            <label for="highSchool" class="col-lg-4 control-label">High School</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="highSchool" name="highSchool" placeholder="High School">
            </div>
        </div>
        <div class="form-group">
            <label for="major" class="col-lg-4 control-label">Major</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="major" name="major" placeholder="Major">
            </div>
        </div>
        <div class="form-group">
            <label for="college" class="col-lg-4 control-label">College</label>

            <div class="col-lg-8">
                <select class="form-control" name="college" id="college">
                    <option value="" selected="selected">Select a College</option>
                    <option>Bouve</option>
                    <option>CAMD</option>
                    <option>CCIS</option>
                    <option>COE</option>
                    <option>COS</option>
                    <option>CSSH</option>
                    <option>COE</option>
                    <option>DMSB</option>
                    <option>Undeclared</option>
                    <option>CCIS/DMSB</option>
                    <option>CCIS/COS</option>
                    <option>CCIS/CAMD</option>
                    <option>COE/COS</option>
                    <option>CSSH/DMSB</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="graduationYear" class="col-lg-4 control-label">Graduation Year</label>

            <div class="col-lg-8">
                <select class="form-control" name="graduationYear" id="graduationYear">
                    <option value="" selected="selected">Select a Graduate Semester/Year</option>
                    <option value="Spring2014">Spring 2014</option>
                    <option value="Fall2014">Fall 2014</option>
                    <option value="Spring2015">Spring 2015</option>
                    <option value="Fall2015">Fall 2015</option>
                    <option value="Spring2016">Spring 2016</option>
                    <option value="Fall2016">Fall 2016</option>
                    <option value="Spring2017">Spring 2017</option>
                    <option value="Fall2017">Fall 2017</option>
                    <option value="Spring2018">Spring 2018</option>
                    <option value="Fall2018">Fall 2018</option>
                    <option value="Spring2019">Spring 2019</option>
                    <option value="Fall2019">Fall 2019</option>
                    <option value="Spring2020">Spring 2020</option>
                    <option value="Fall2020">Fall 2020</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-lg-4 control-label">Email</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="email" name="email" placeholder="Email">
            </div>
        </div>
        <div class="form-group">
            <label for="phoneNumber" class="col-lg-4 control-label">Phone Number</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Phone Number">
            </div>
        </div>
        <div class="form-group">
            <label for="semesterStarted" class="col-lg-4 control-label">Semester Started with HA</label>

            <div class="col-lg-8">
                <input type="text" class="form-control" id="semesterStarted" name="semesterStarted"
                       placeholder="Semester Started">
            </div>
        </div>
        <div class="form-group">
            <label for="ethnicity" class="col-lg-4 control-label">Ethnicity</label>

            <div class="col-lg-8">
                <select class="form-control" name="ethnicity" id="ethnicity">
                    <option value="" selected="selected">Select a Ethnicity</option>
                    <option>American Indian or Alaska Native (including all Original Peoples of the Americas)</option>
                    <option>Asian (including Indian subcontinent and Philippines)</option>
                    <option>Black or African American (including Africa and Caribbean)</option>
                    <option>Hispanic/Latino (including Spain)</option>
                    <option>Native Hawaiian or Other Pacific Islander (Original Peoples)</option>
                    <option>White (including Middle Eastern)</option>
                </select>
            </div>
        </div>
        <!-- <div class="form-group">
            <label for="trainedOnIv" class="col-lg-4 control-label">Trained on IV</label>
            This is if you are getting trained on IV today!!!
            <div class="col-lg-8">
                <select class="form-control" name="trainedOnIv" id="trainedOnIv">
                    <option value="" selected="selected">Select...</option>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
            </div>
        </div> -->

        <div class="form-group">
            <label for="trainedOnAthletics" class="col-lg-4 control-label">Trained on Athletics</label>

            <div class="col-lg-8">
                <select class="form-control" name="trainedOnAthletics" id="trainedOnAthletics">
                    <option value="" selected="selected">Select...</option>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
            </div>
        </div>

        <button type="submit" style="margin-right:15px;margin-top:20px;" class=" pull-right btn btn-lg btn-primary">
            Submit
        </button>
    </form>
</div>
<!--
<form>
First name: <input type="text" name="firstname">
&nbsp;&nbsp;&nbsp;&nbsp; Last name: <input type="text" name="lastname"> 
&nbsp;&nbsp;&nbsp;&nbsp; Gender: <select name="gender"><option value="">Select...</option><option>Male</option><option>Female</option></select><br> <br>
High School: <input type="text" name="highschool">
&nbsp;&nbsp;&nbsp;&nbsp; Hometown: <input type="text" name="hometown"> 
&nbsp;&nbsp;&nbsp;&nbsp; State/Country: <input type="text" name="statecountry">  <br> <br>
Major: <input type="text" name="major">
&nbsp;&nbsp;&nbsp;&nbsp; College: <select 

</form>
-->

</body>
</html>