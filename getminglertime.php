<?php

if ($_GET["name"] == 3) {
    echo "
    <select class='form-control' name='time' class='form-control' id='time'>
    <option value='0'>Select...</option>
    <option value='9'>8:45am</option>
    <option value='10'>9:45am</option>
    <option value='11'>10:45am</option>
    <option value='13'>12:45pm</option>
    <option value='14'>1:45pm</option>
    <option value='15'>2:45pm</option>
    ";
} else {
    echo "
    <select class='form-control' name='time' class='form-control' id='time'>
    <option value='0'>Select...</option>
    <option value=10>10am</option>
    <option value=11>11am</option>
    <option value=12>12pm</option>
    <option value=14>2pm</option>
    <option value=15>3pm</option>
    <option value=16>4pm</option>
    ";
}
?>