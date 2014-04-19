<?php
session_start();
if(!isset($_SESSION["username"])){
    header("location:index.php");
} else {
    header("location:homepage.php");
}
?>

<html>
<body>
Login Successful
</body>
</html>