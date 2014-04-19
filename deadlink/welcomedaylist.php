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
        }</style>
    <style type="text/css"></style>
    <script>
        function showUser(str) {
            if (str == "") {
                document.getElementById("txtHint").innerHTML = "";
                return;
            }
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", "welcomedaylisthelper.php?q=" + str, true);
            xmlhttp.send();
        }
    </script>
</head>
<body>
<?php include 'nav.php'; ?>
<br><br>

<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade active in" id="checkIn">
        <h2 class="col-md-offset-1">Tour Guide Manager</h2>

        <div class="well col-md-3 col-md-offset-1">
            <fieldset>
                <div class="form-group"><label for="inputEmail" class="col-lg-2 control-label">
                        <h4>Date</h4></label>

                    <div class="col-lg-10">
                        <form>
                            <select name="name" class="form-control" id="tourGuide" form="checkin"
                                    onchange="showUser(this.value)">
                                <option>Select...</option>
                                <option>February 8</option>
                                <option>February 9</option>
                                <option>April 5</option>
                                <option>April 6</option>
                                <option>Not signed up!</option>
                            </select>

                            <br> <br>
                    </div>
                </div>
        </div>
        <div class="well col-lg-6 col-lg-offset-3">
            <div id="txtHint"><b>Tour Guides will be listed here.</b></div>
        </div>
        </form>
</body>
</html>