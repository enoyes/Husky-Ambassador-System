<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
	<link rel="stylesheet" href="bootstrap/css/evan.css" media="screen"/>
    <style>
        ul#list-nav {
            list-style:none;
            margin:50px;
            padding:10px;
            width:150px;
        }

        ul#list-nav li {
            display:list-item;
        }

        ul#list-nav li a {
            text-decoration:none;
            padding:15px 0;
            width:150px;
            height:50px;
            background:-webkit-linear-gradient(#f2f2f2, #e8e8e8);
            color:#9E9E9E;
            float:left;
            font-weight:bold;
            text-align:center;
            font-family:"Verdana";
            border-radius: 10px;
            border:1px solid #9E9E9E;
        }

        ul#list-nav li a:hover {
            background:-webkit-linear-gradient(#E2E2E2, #C5C5C5);
            color:#eee
        }
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

        #tablearea
        {

            width: 1000px;
            margin: -100px 0px 0px 250px;
        }

        .dropdown
        {
            float: left;
            width: 30px;
            height: 30px;
            border: 1px solid #A0A0A0;
            border-radius: 100px;
            margin: 0 0 0 10px;
            text-align:center;
        }

        .tabletime
        {
            margin: 0 0 0 150px;
            display:inline-block;

        }

        #showall
        {
            text-align:right;
            cursor:pointer;
        }

        #intersignup
        {
            display:inline-block;
            float: right;
            margin: 0 20px 0 0;
            font-size: 14px;
            line-height: 1.428571429;
            color: #555555;
        }

        #intersignup select
        {
            display: inline-block;
            height: 38px;
            padding: 8px 12px;

            vertical-align: middle;
            background-color: #ffffff;
            background-image: none;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

    </style>
    <style>

        #tablearea
        {

            width: 1000px;
            margin: -100px 0px 0px 250px;
        }

        .dropdown
        {
            float: left;
            height: 30px;
            border: 1px solid #A0A0A0;
            text-align:center;
        }

        .tabletime
        {
            margin: 0 0 0 150px;
            display:inline-block;

        }

        #showall
        {
            text-align:right;
            cursor:pointer;
        }

        #intersignup
        {
            display:inline-block;
            float: right;
            margin: 0 20px 0 0;
            font-size: 14px;
            line-height: 1.428571429;
            color: #555555;
        }

        #intersignup select
        {
            display: inline-block;
            height: 38px;
            padding: 8px 12px;

            vertical-align: middle;
            background-color: #ffffff;
            background-image: none;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

    </style>
    <style>

        .header {border: 5 solid #000;}

        .dropdown{cursor:pointer;}
    </style>
    <style type="text/css"></style>


</head>
<body>
<?php include 'nav.php'; ?>

<div align="center">
    <h1>Finals Intersession Sign-up</h1>
    <h4>You MUST sign up for the same number of tours you give a week for Intersession!</h4>
    <br>
    <input id='minglertable' type='radio' name='type'>&nbsp;Minglers</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input id='tourguidetable' type='radio' name='type' checked>&nbsp;Tour Guide</input>
</div>
<br><br>
<nav align="center">
        <button type="button" class="btn btn-default" data-day="2014-04-16" id="416" name="416" value="416">Wednesday 4/16</button>
        <button type="button" class="btn btn-default" data-day="2014-04-17" id="417" value="417">Thursday 4/17</button>
        <button type="button" class="btn btn-default" data-day="2014-04-18" id="418" value="418">Friday 4/18</button>
        <button type="button" class="btn btn-default" data-day="2014-04-21" id="421" value="421">Monday 4/21</button>
        <button type="button" class="btn btn-default" data-day="2014-04-22" id="422" value="422">Tuesday 4/22</button>
        <button type="button" class="btn btn-default" data-day="2014-04-23" id="423" value="423">Wednesday 4/23</button>
        <button type="button" class="btn btn-default" data-day="2014-04-24" id="424" value="424">Thursday 4/24</button>
        <button type="button" class="btn btn-default" data-day="2014-04-25" id="425" value="425">Friday 4/25</button>
</nav>
<br><br><br><br><br>
<div id="tablearea" align="right">
    <p>Please choose a job and then pick a date from the list to the left!</p>
</div>
</body>
<script>

	$(".btn").click(function(){
		var day = $(this).data('day');
		var mingle = 0;
        if ($("#minglertable").prop('checked')){mingle = 1;}
        $("#tablearea").load('tabletest.php?date=' + day + '&mingle=' + mingle);
        $("#tablearea").data('loaded', day);
		}); 


    $("#minglertable").click(function(){
        var day = $("#tablearea").data('loaded');
        if (day >= 0){
            $("#tablearea").load('tabletest.php?day=' + day + '&mingle=' + '1')
        }
        $("#tourguidetable").prop('checked', false);

    });
    $("#tourguidetable").click(function(){
        var day = $("#tablearea").data('loaded');
        if (day >= 0){
            $("#tablearea").load('tabletest.php?day=' + day + '&mingle=' + '0')
        }
        $("#minglertable").prop('checked', false);
    });
</script>
</html>