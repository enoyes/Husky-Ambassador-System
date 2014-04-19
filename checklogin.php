<?php

$host="localhost"; // Host name 
$username="admin"; // Mysql username
$password="admin"; // Mysql password
$db_name="ha_main"; // Database name
$tbl_name="members"; // Table name 

// Connect to server and select databse.
mysql_connect("$host", "$username", "$password")or die("cannot connect");
mysql_select_db("$db_name")or die("cannot select DB");

// username and password sent from form 
$myusername=$_POST['username'];
$mypassword=$_POST['password'];

// To protect MySQL injection (more detail about MySQL injection)
$myusername = stripslashes($myusername);
$mypassword = stripslashes($mypassword);
$myusername = mysql_real_escape_string($myusername);
$mypassword = mysql_real_escape_string($mypassword);

$encrypted_mypassword=$mypassword;
$sql="SELECT * FROM $tbl_name WHERE username='$myusername' and password='$encrypted_mypassword'";
$result=mysql_query($sql);

// Mysql_num_row is counting table row
$count=mysql_num_rows($result);

$rows = mysql_fetch_array($result, MYSQL_NUM);

// If result matched $myusername and $mypassword, table row must be 1 row
if($count==1){
session_start();
// Register $myusername, $mypassword and redirect to file "login_success.php"
    $_SESSION["username"] = $myusername;
    $_SESSION["role"] = $rows[3];
    header("location:login_success.php");
}
else {
    echo "Wrong Username or Password";
}
?>