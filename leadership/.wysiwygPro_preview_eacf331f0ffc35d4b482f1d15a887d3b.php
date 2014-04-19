<?php
if ($_GET['randomId'] != "LJmn3MxSkUW0X69ovoI8Zmvn3nO1ogaUwHUUvlDL7WThFFQjvuGRN_bp9wyrxqAu") {
    echo "Access Denied";
    exit();
}

// display the HTML code:
echo stripslashes($_POST['wproPreviewHTML']);

?>  
