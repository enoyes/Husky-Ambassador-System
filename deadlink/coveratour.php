<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" href="css/bootswatch.css" media="screen"/>
    <style>
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
        }</style>
    <style type="text/css"></style>
    function AcceptShift(CID)
    {
    $.post("handleaccept.php", { cid : CID });
    }
    </script>
    </
    head >
        < body >
        <?php include 'nav.php'; ?>
        < br > < br >
    < div
    id = "myTabContent"
    class
    = "tab-content" >
        < div
    class
    = "tab-pane fade active in"
    id = "checkIn" >
        < h2
    class
    = "col-md-offset-1" > Coverage
    Manager <
    /
    h2 >
        < center >
    < table
    dir = "ltr"
    width = "1000"
    border = "1"
    summary = "purpose/structure for speech output" >
        < caption > Choose
    a
    tour
    to
    cover
    and
    hit
    accept
    at
    the
    end
    of
    its
    row
    !
    <
    /
    caption >
    < colgroup
    width = "20%" / >
        < colgroup
    id = "colgroup"
    class
    = "colgroup"
    align = "center"
    valign = "middle"
    title = "title"
    width = "1*"
    span = "0"
    style = "background:#ddd;" / >
        < thead >
        < tr >
        < th
    scope = "col" > Name <
    /
    th >
    < th
    scope = "col" > Day <
    /
    th >
    < th
    scope = "col" > Time <
    /
    th >
    < th
    scope = "col" > Tour
    Type <
    /
    th >
    < th
    scope = "col" > Date <
    /
    th >
    < th
    scope = "col" > Actions <
    /
    th >
    <
    /
    tr >
    <
    /
    thead >
        < tbody >
    <?php

    $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
    if ($mysqli->connect_errno) {
            echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    }

    $res = $mysqli->query("SELECT * FROM Coverages");

    $res->data_seek(0);

    while ($row = $res->fetch_assoc()) {
    if ($row["Covered"] == 0) {
        echo "<tr>
            <td>" . $row['Name'] . "</td>
            <td>" . $row['Day'] . "</td>
            <td>" . $row['Time'] . "</td>
            <td>" . $row['TourType'] . "</td>
            <td>" . $row['Date'] . "</td>
            <td><a href='acceptcoverage.php?cid=" . $row['CID'] . "'>Take Shift</a></td>
        </tr>";
    }
    }
    ?>

    <
    /
    tbody >
    <
    /
    table >
    <
    /
    center >

    <
    /
    div >
    <
    /
    form >
    <
    /
    body >
    <
    /
    html >