<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] == "leadership" || $_SESSION["role"] == "parttimer" || $_SESSION["role"] == "member") {
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
</head>
<body>
<?php include 'nav.php'; ?>
<br><br><br>

<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade active in" id="checkIn">
        <h2 class="col-md-offset-1">Tour Guide Manager</h2>

        <div class="well col-md-10 col-md-offset-1">
            <fieldset>

                    <label for="college" class="col-sm-1 control-label">Day:</label>
                    <div class="col-lg-3">
                            <select name="day" class="form-control" id="day" onchange="">
                                <option value="" selected="selected">Select a Day</option>
                                <option value="1">Monday</option>
                                <option value="2">Tuesday</option>
                                <option value="3">Wednesday</option>
                                <option value="4">Thursday</option>
                                <option value="5">Friday</option>
                                <option value="6">Saturday</option>
                              
                                </select>
                    </div>

                <label for="state" class="col-sm-1 control-label">Time:</label>
                <div class="col-lg-3">
                    <select name="time" class="form-control" id="time" onchange="">
                        <option value="" selected="selected">Select a Time</option>
                        <option value="10">10am</option>
                        <option value="11">11am</option>
                        <option value="12">12pm</option>
                        <option value="14">2pm</option>
                        <option value="15">3pm</option>
                        <option value="16">4pm</option>
          		<option value="All">All Day</optio>
                    </select>
                </div>
                
                <div id="button" name="button">
                <button name="button" id="button">Generate</button>
               </div>
                </div>
        </div>

            </div>
        </form>
        
        <div class="well col-md-10 col-lg-offset-1">
            <div id="txtHint">

        </div>
        <script>
        $("#button").click(getemail);
        function getemail(){
		var time = $("#time").val();
		var day = $("#day").val();
		
		if (day == "" || time == ""){alert("Please select a day and time");return -1;}
		
		$.ajax({
			type: "POST",
			url: "getemails.php",
			data: {day : day, time : time}
		})
		.done(function(msg){
			document.getElementById("txtHint").innerHTML = '<center><a href="' + msg + '">Email</a></center>';
		});
	}
        </script>
</body>
</html>