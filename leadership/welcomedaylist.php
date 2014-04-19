<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
    header("location:http://matthewclamp.com/prototype/index.php");
}
?>

<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>

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
                                <option value='WD-02-08'>February 8</option>
                                <option value='WD-02-09'>February 9</option>
                                <option value='WD-04-05'>April 5</option>
                                <option value='WD-04-06'>April 6</option>
                                <option value='0'>Not signed up!</option>
                            </select>

                            <br> <br>
                    </div>
                </div>
        </div>
        <div class="well col-lg-6 col-lg-offset-3">
            <div id="txtHint"><b>Tour Guides will be listed here.</b></div>
        </div>
        </form>
	</div>
</div>
</body>
