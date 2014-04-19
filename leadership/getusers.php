<?php
include "../sql_login.php";
$college = $_GET['college'];
$gradYear = $_GET['gradYear'];
$state = $_GET['state'];

echo '<div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Last Name
                                </td>
                                <td >
                                    First Name
                                </td>
                                <td>
                                    College
                                </td>
                                <td>
                                    Hometown, State, Country
                                </td>
                                <td>
                                    Open Profile
                                </td>
                            </tr>';



$query = "SELECT * FROM master_roster WHERE (last_name LIKE '%$_GET[q]%' OR first_name LIKE '%$_GET[q]%' OR hometown LIKE '%$_GET[q]%' OR country LIKE '%$_GET[q]%'  OR highschool LIKE '%$_GET[q]%' OR email LIKE '%$_GET[q]%' OR
phone LIKE '%$_GET[q]%' OR ethnicity LIKE '%$_GET[q]%' OR college LIKE '%$_GET[q]%')";

if ($state != '') {
    $query = $query . " AND state='$state'";
}

if ($gradYear != '') {
    $query = $query . " AND grad_year='$gradYear'";
}

if ($college != '') {
    $query = $query . " AND college='$college'";
}

$query = $query . " ORDER BY last_name ASC";

$res = $mysqli->query($query);

                            

                            while ($row = mysqli_fetch_array($res)) {

                                echo "<tr>
            <td>" . $row['last_name'] . "</td>
            <td>" . $row['first_name'] . "</td>
            <td>" . $row['college'] . "</td>
            <td>" . $row['hometown'] . ", " . $row['state'] . ", " . $row['country'] . "</td>
            <td><a href='openprofile.php?uid=" . $row['uid'] . "'>Open Profile</a></td>
            </td></tr>";
                            }


?>