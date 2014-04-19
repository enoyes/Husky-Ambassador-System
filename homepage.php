<?php
session_start();
if(!isset($_SESSION['username'])){
    header("location:index.php");
}
?>


<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>


    <style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>
<br> <br> <br>

<center><img src="http://matthewclamp.com/prototype/logo.png"/></center>


<center>

<h3>All useful links are above; however, <br> you may not have access to some of them depending on where you are logging on from! <br> If you can't access a page,
you need to be using the iPad in the VC!</h3>

    </center>
</body>
</html>