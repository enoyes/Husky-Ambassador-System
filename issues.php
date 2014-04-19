<?php
session_start();
if(!isset($_SESSION['username'])){
    header("location:index.php");
}
?>
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>

</body>