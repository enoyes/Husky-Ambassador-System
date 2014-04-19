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
    <style>
        .CSSTableGenerator {
            margin:0px;padding:0px;
            width:100%;
            box-shadow: 10px 10px 5px #888888;
            border:1px solid #000000;

            -moz-border-radius-bottomleft:0px;
            -webkit-border-bottom-left-radius:0px;
            border-bottom-left-radius:0px;

            -moz-border-radius-bottomright:0px;
            -webkit-border-bottom-right-radius:0px;
            border-bottom-right-radius:0px;

            -moz-border-radius-topright:0px;
            -webkit-border-top-right-radius:0px;
            border-top-right-radius:0px;

            -moz-border-radius-topleft:0px;
            -webkit-border-top-left-radius:0px;
            border-top-left-radius:0px;
        }.CSSTableGenerator table{
             border-collapse: collapse;
             border-spacing: 0;
             width:100%;
             height:100%;
             margin:0px;padding:0px;
         }.CSSTableGenerator tr:last-child td:last-child {
              -moz-border-radius-bottomright:0px;
              -webkit-border-bottom-right-radius:0px;
              border-bottom-right-radius:0px;
          }
        .CSSTableGenerator table tr:first-child td:first-child {
            -moz-border-radius-topleft:0px;
            -webkit-border-top-left-radius:0px;
            border-top-left-radius:0px;
        }
        .CSSTableGenerator table tr:first-child td:last-child {
            -moz-border-radius-topright:0px;
            -webkit-border-top-right-radius:0px;
            border-top-right-radius:0px;
        }.CSSTableGenerator tr:last-child td:first-child{
             -moz-border-radius-bottomleft:0px;
             -webkit-border-bottom-left-radius:0px;
             border-bottom-left-radius:0px;
         }.CSSTableGenerator tr:hover td{

          }
        .CSSTableGenerator tr:nth-child(odd){ background-color:#b5a6a9; }
        .CSSTableGenerator tr:nth-child(even)    { background-color:#ffffff; }.CSSTableGenerator td{
                                                                                  vertical-align:middle;


                                                                                  border:1px solid #000000;
                                                                                  border-width:0px 1px 1px 0px;
                                                                                  text-align:left;
                                                                                  padding:7px;
                                                                                  font-size:10px;
                                                                                  font-family:Arial;
                                                                                  font-weight:normal;
                                                                                  color:#000000;
                                                                              }.CSSTableGenerator tr:last-child td{
                                                                                   border-width:0px 1px 0px 0px;
                                                                               }.CSSTableGenerator tr td:last-child{
                                                                                    border-width:0px 0px 1px 0px;
                                                                                }.CSSTableGenerator tr:last-child td:last-child{
                                                                                     border-width:0px 0px 0px 0px;
                                                                                 }
        .CSSTableGenerator tr:first-child td{
            background:-o-linear-gradient(bottom, #ff0c00 5%, #140c05 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff0c00), color-stop(1, #140c05) );
            background:-moz-linear-gradient( center top, #ff0c00 5%, #140c05 100% );
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff0c00", endColorstr="#140c05");	background: -o-linear-gradient(top,#ff0c00,140c05);

            background-color:#ff0c00;
            border:0px solid #000000;
            text-align:center;
            border-width:0px 0px 1px 1px;
            font-size:14px;
            font-family:Arial;
            font-weight:bold;
            color:#ffffff;
        }
        .CSSTableGenerator tr:first-child:hover td{
            background:-o-linear-gradient(bottom, #ff0c00 5%, #140c05 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff0c00), color-stop(1, #140c05) );
            background:-moz-linear-gradient( center top, #ff0c00 5%, #140c05 100% );
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff0c00", endColorstr="#140c05");	background: -o-linear-gradient(top,#ff0c00,140c05);

            background-color:#ff0c00;
        }
        .CSSTableGenerator tr:first-child td:first-child{
            border-width:0px 0px 1px 0px;
        }
        .CSSTableGenerator tr:first-child td:last-child{
            border-width:0px 0px 1px 1px;
}</style>
    <style type="text/css"></style>
    <script>
        function showUser() {
            var stro = document.getElementById('query');
            var str = stro.value;

            var collegeV = document.getElementById('college');
            var college = collegeV.value;

            var stateV = document.getElementById('state');
            var state = stateV.value;

            var gradYearv = document.getElementById('gradYear');
            var gradYear = gradYearv.value;

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
            xmlhttp.open("GET", "getusers.php?q=" + str + "&college=" + college + "&state=" + state
                + "&gradYear=" + gradYear, true);
            xmlhttp.send();
        }
    </script>
</head>
<body>
<?php include 'nav.php'; ?>
<br><br><br>

<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade active in" id="checkIn">
        <h2 class="col-md-offset-1">Tour Guide Manager</h2>

        <div class="well col-md-10 col-md-offset-1">
            <fieldset><div class="form-group col-md-offset-5" >
                       <label for="query" class="col-sm-1 control-label">Search:</label>
                   <div class="col-lg-3">
                                <input type="search" name="query" class="form-control" id="query" form="checkin"
                                       onchange="showUser()">

                    </div>
                    <br><br>
                </div>

                    <label for="college" class="col-sm-1 control-label">College:</label>
                    <div class="col-lg-3">
                            <select name="college" class="form-control" id="college" onchange="showUser()">
                                <option value="" selected="selected">Select a College</option>
                                <option>Bouve</option>
                                <option>CAMD</option>
                                <option>CCIS</option>
                                <option>COE</option>
                                <option>COS</option>
                                <option>CSSH</option>
                                <option>COE</option>
                                <option>DMSB</option>
                                <option>CCIS/DMSB</option>
                                <option>CCIS/COS</option>
                                <option>CCIS/CAMD</option>
                                <option>COE/COS</option>
                                <option>CSSH/DMSB</option>
                                </select>
                    </div>

                <label for="state" class="col-sm-1 control-label">State:</label>
                <div class="col-lg-3">
                    <select name="state" class="form-control" id="state" onchange="showUser()">
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
                <label for="gradYear" class="col-sm-1 control-label">Graduation Year:</label>
                <div class="col-lg-3">
                    <select name="gradYear" class="form-control" id="gradYear" onchange="showUser()">
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
        </div>

        <div class="well col-md-10 col-lg-offset-1">
            <div id="txtHint">

        </div>
            </div>
        </form>
</body>
</html>