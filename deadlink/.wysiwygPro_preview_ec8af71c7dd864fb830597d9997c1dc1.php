<?php
if ($_GET['randomId'] != "vq9zlmwTLXKMnf23D68qDWNcy4pcrnjQmRH2B4K5M1DBuh7kMBoovCiA46Sx7LWI") {
    echo "Access Denied";
    exit();
}

// display the HTML code:
echo stripslashes($_POST['wproPreviewHTML']);

?>  
