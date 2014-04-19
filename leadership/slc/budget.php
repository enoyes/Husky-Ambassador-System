<?php
session_start();
if(!isset($_SESSION['username']) || $_SESSION["role"] != "SLC") {
    header("location:http://matthewclamp.com/prototype/index.php");
}
?>
<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <style>
        .CSSTableGenerator {
            margin:0px;padding:0px;
            width:100%;
            box-shadow: 10px 10px 5px #888888;
            border:1px solid #000000;

            -moz-border-radius-bottomleft:0px;
            -webkit-border-bottom-left-radius:0px;
            border-bottom-left-radius:0px;

            -moz-border-radius-bottomright:0px;
            -webkit-border-bottom-right-radius:0px;
            border-bottom-right-radius:0px;

            -moz-border-radius-topright:0px;
            -webkit-border-top-right-radius:0px;
            border-top-right-radius:0px;

            -moz-border-radius-topleft:0px;
            -webkit-border-top-left-radius:0px;
            border-top-left-radius:0px;
        }.CSSTableGenerator table{
             border-collapse: collapse;
             border-spacing: 0;
             width:100%;
             height:100%;
             margin:0px;padding:0px;
         }.CSSTableGenerator tr:last-child td:last-child {
              -moz-border-radius-bottomright:0px;
              -webkit-border-bottom-right-radius:0px;
              border-bottom-right-radius:0px;
          }
        .CSSTableGenerator table tr:first-child td:first-child {
            -moz-border-radius-topleft:0px;
            -webkit-border-top-left-radius:0px;
            border-top-left-radius:0px;
        }
        .CSSTableGenerator table tr:first-child td:last-child {
            -moz-border-radius-topright:0px;
            -webkit-border-top-right-radius:0px;
            border-top-right-radius:0px;
        }.CSSTableGenerator tr:last-child td:first-child{
             -moz-border-radius-bottomleft:0px;
             -webkit-border-bottom-left-radius:0px;
             border-bottom-left-radius:0px;
         }.CSSTableGenerator tr:hover td{

          }
        .CSSTableGenerator tr:nth-child(odd){ background-color:#b5a6a9; }
        .CSSTableGenerator tr:nth-child(even)    { background-color:#ffffff; }.CSSTableGenerator td{
                                                                                  vertical-align:middle;


                                                                                  border:1px solid #000000;
                                                                                  border-width:0px 1px 1px 0px;
                                                                                  text-align:left;
                                                                                  padding:7px;
                                                                                  font-size:10px;
                                                                                  font-family:Arial;
                                                                                  font-weight:normal;
                                                                                  color:#000000;
                                                                              }.CSSTableGenerator tr:last-child td{
                                                                                   border-width:0px 1px 0px 0px;
                                                                               }.CSSTableGenerator tr td:last-child{
                                                                                    border-width:0px 0px 1px 0px;
                                                                                }.CSSTableGenerator tr:last-child td:last-child{
                                                                                     border-width:0px 0px 0px 0px;
                                                                                 }
        .CSSTableGenerator tr:first-child td{
            background:-o-linear-gradient(bottom, #ff0c00 5%, #140c05 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff0c00), color-stop(1, #140c05) );
            background:-moz-linear-gradient( center top, #ff0c00 5%, #140c05 100% );
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff0c00", endColorstr="#140c05");	background: -o-linear-gradient(top,#ff0c00,140c05);

            background-color:#ff0c00;
            border:0px solid #000000;
            text-align:center;
            border-width:0px 0px 1px 1px;
            font-size:14px;
            font-family:Arial;
            font-weight:bold;
            color:#ffffff;
        }
        .CSSTableGenerator tr:first-child:hover td{
            background:-o-linear-gradient(bottom, #ff0c00 5%, #140c05 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff0c00), color-stop(1, #140c05) );
            background:-moz-linear-gradient( center top, #ff0c00 5%, #140c05 100% );
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff0c00", endColorstr="#140c05");	background: -o-linear-gradient(top,#ff0c00,140c05);

            background-color:#ff0c00;
        }
        .CSSTableGenerator tr:first-child td:first-child{
            border-width:0px 0px 1px 0px;
        }
        .CSSTableGenerator tr:first-child td:last-child{
            border-width:0px 0px 1px 1px;
        }
       
        .nav-tabs > li > a{
            color:rgb(255, 0, 0);
        }
        h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {

            color:rgb(185, 0, 0);
        }
        .navbar-brand{
            font-size:25px;
        }</style>
    <style type="text/css"></style>
</head>
<body>
<?php include "nav.php"; ?>
<div class="container"><br />
    <br /><br />
    <div class="row">
        <div class="col-xs-12">
                <ul class="nav nav-tabs" style="margin-bottom: 15px">
                    <li class="active"><a href="#overall" data-toggle="tab">Overall</a></li>
                    <li><a href="#slcchair" data-toggle="tab">SLC Chair</a></li>
                    <li><a href="#rra" data-toggle="tab">RRA</a></li>
                    <li><a href="#programming" data-toggle="tab">Programming</a></li>
                <li><a href="#communications" data-toggle="tab">Communications</a></li>
                <li><a href="#operations" data-toggle="tab">Operations</a></li>
                <li><a href="#training" data-toggle="tab">Training & Development</a></li>
                <li><a href="#slush" data-toggle="tab">Jamie's Slush Fund</a></li></ul>
                <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="overall">

                    <h1 align="center">SLC Budget</h1>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <h4>SLC Chair</h4>
                                </td>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='Chair' AND `Category`='Total' ORDER BY `id` ASC");

                                $res->data_seek(0);

                                while ($row = $res->fetch_assoc()) {

                                    echo "
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>";
                                }

                                ?>
                            </tr>
                            <tr>
                                <td >
                                    <h4>R, R & A</h4>
                                </td>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='RRA' AND `Category`='Total' ORDER BY `id` ASC");

                                $res->data_seek(0);

                                while ($row = $res->fetch_assoc()) {

                                    echo "
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>";
                                }

                                ?>
                            </tr>
                            <tr>
                                <td >
                                    <h4>Programming</h4>
                                </td>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='PR' AND `Category`='Total' ORDER BY `id` ASC");

                                $res->data_seek(0);

                                while ($row = $res->fetch_assoc()) {

                                    echo "
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>";
                                }

                                ?>
                            </tr>

                            <tr>
                                <td >
                                    <h4>Operations</h4>
                                </td>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='OP' AND `Category`='Total' ORDER BY `id` ASC");

                                $res->data_seek(0);

                                while ($row = $res->fetch_assoc()) {

                                    echo "
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>";
                                }

                                ?>
                            </tr>
                            <tr>
                                <td >
                                    <h4>Training & Development</h4>
                                </td>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='TD' AND `Category`='Total' ORDER BY `id` ASC");

                                $res->data_seek(0);

                                while ($row = $res->fetch_assoc()) {

                                    echo "
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>";
                                }

                                ?>
                            </tr>
                            <tr>
                                <td >
                                    <h4>Jamie Slush Fund</h4>
                                </td>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='SF' AND `Category`='Total' ORDER BY `id` ASC");

                                $res->data_seek(0);

                                while ($row = $res->fetch_assoc()) {

                                    echo "
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>";
                                }

                                ?>
                            </tr>
                            <tr>
                                <td >
                                    Total
                                </td>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT * FROM `Category` WHERE `Category`='Total' ORDER BY `id` ASC");

                                $res->data_seek(0);
                                $actual = 0.00;
                                $budget = 0.00;
                                while ($row = $res->fetch_assoc()) {
                                    $actual = $actual + $row['Actual'];
                                    $budget = $budget + $row['Budget'];
                                }

                                    echo "
            <td>" . $budget . "</td>
            <td>" . $actual . "</td>
            <td>" . ($budget - $actual) . "</td>";

                                ?>
                            </tr>
                        </table>

                    </div>

                </div>
                <div class="tab-pane fade" id="slcchair">

                    <h1 align="center">SLC Chair</h1>
                    <div class="CSSTableGenerator">
                        <table>
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td >
                                    Description
                                </td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='Chair' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Category'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>

                    <br><br>
                    <h2 align="center">Transactions</h2>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Transactions` WHERE `Chair`='Chair' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Date'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Category'] . "</td>
            <td>" . $row['Amount'] . "</td>
            <td><a href='deletetrans.php?tid=" . $row['id'] . "'>Delete</a></td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
<br><br>
                    <div> <h3 align="center">Add Trasaction</h3>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <tr>
                        <FORM METHOD="POST" ACTION="processnewtrans.php?chair=Chair">
                           <td><input type="text" class="control-label col-lg-8" id="date" name="date" placeholder="Date"></td>
                            <td><input type="text" class="control-label col-lg-8" id="desc" name="desc" placeholder="Description"></td>
                            <td><select name="category" id="category">
                                <option>Select...</option>
                                <?php
                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                if ($mysqli->connect_errno) {
                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                }

                                $res = $mysqli->query("SELECT Category FROM `Category` WHERE `Chair`='Chair' ORDER BY `id` ASC");

                                $res->data_seek(0);

                                while ($row = $res->fetch_assoc()) {
                                    if ($row['Category'] != 'Total') {
                                    echo "<option>" . $row['Category'] . "</option>";
                                }
                                }
                                ?>
                            </select></td>
                            <td><input type="text" class="control-label col-lg-8" id="amt" name="amt" placeholder="Amount"></td>
                            <td><INPUT TYPE="submit" VALUE="Add"></td>
                        </FORM>
                            </tr>
                            </table>
                        </div>
                </div>
                    </div>
                <div class="tab-pane fade" id="rra">
                    <h1 align="center">R, R & A</h1>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td >
                                    Description
                                </td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='RRA' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Category'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <h2 align="center">Transactions</h2>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Transactions` WHERE `Chair`='RRA' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Date'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Category'] . "</td>
            <td>" . $row['Amount'] . "</td>
            <td><a href='deletetrans.php?tid=" . $row['id'] . "'>Delete</a></td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <br><br>
                    <div> <h3 align="center">Add Trasaction</h3>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td >
                                        Description
                                    </td>
                                    <td>
                                        Category
                                    </td>
                                    <td>
                                        Amount
                                    </td>
                                    <td>
                                        Actions
                                    </td>
                                </tr>
                                <tr>
                                    <FORM METHOD="POST" ACTION="processnewtrans.php?chair=RRA">
                                        <td><input type="text" class="control-label col-lg-8" id="date" name="date" placeholder="Date"></td>
                                        <td><input type="text" class="control-label col-lg-8" id="desc" name="desc" placeholder="Description"></td>
                                        <td><select name="category" id="category">
                                                <option>Select...</option>
                                                <?php
                                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                                if ($mysqli->connect_errno) {
                                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                                }

                                                $res = $mysqli->query("SELECT Category FROM `Category` WHERE `Chair`='RRA' ORDER BY `id` ASC");

                                                $res->data_seek(0);

                                                while ($row = $res->fetch_assoc()) {
                                                    if ($row['Category'] != 'Total') {
                                                        echo "<option>" . $row['Category'] . "</option>";
                                                    }
                                                }
                                                ?>
                                            </select></td>
                                        <td><input type="text" class="control-label col-lg-8" id="amt" name="amt" placeholder="Amount"></td>
                                        <td><INPUT TYPE="submit" VALUE="Add"></td>
                                    </FORM>
                                </tr>
                            </table>
                        </div>
                    </div>
                    </div>
                <div class="tab-pane fade" id="programming">
                    <h1 align="center">Programming</h1>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td>Description</td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='PR' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Category'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>
            </td></tr>";
                            }

                            ?>
                        </table>
                                                </div>
                    <h2 align="center">Transactions</h2>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Transactions` WHERE `Chair`='PR' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Date'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Category'] . "</td>
            <td>" . $row['Amount'] . "</td>
            <td><a href='deletetrans.php?tid=" . $row['id'] . "'>Delete</a></td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <br><br>
                    <div> <h3 align="center">Add Trasaction</h3>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td >
                                        Description
                                    </td>
                                    <td>
                                        Category
                                    </td>
                                    <td>
                                        Amount
                                    </td>
                                    <td>
                                        Actions
                                    </td>
                                </tr>
                                <tr>
                                    <FORM METHOD="POST" ACTION="processnewtrans.php?chair=PR">
                                        <td><input type="text" class="control-label col-lg-8" id="date" name="date" placeholder="Date"></td>
                                        <td><input type="text" class="control-label col-lg-8" id="desc" name="desc" placeholder="Description"></td>
                                        <td><select name="category" id="category">
                                                <option>Select...</option>
                                                <?php
                                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                                if ($mysqli->connect_errno) {
                                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                                }

                                                $res = $mysqli->query("SELECT Category FROM `Category` WHERE `Chair`='PR' ORDER BY `id` ASC");

                                                $res->data_seek(0);

                                                while ($row = $res->fetch_assoc()) {
                                                    if ($row['Category'] != 'Total') {
                                                        echo "<option>" . $row['Category'] . "</option>";
                                                    }
                                                }
                                                ?>
                                            </select></td>
                                        <td><input type="text" class="control-label col-lg-8" id="amt" name="amt" placeholder="Amount"></td>
                                        <td><INPUT TYPE="submit" VALUE="Add"></td>
                                    </FORM>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="communications">
                    <h1 align="center">Communications</h1>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td>Description</td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='COM' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Category'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <h2 align="center">Transactions</h2>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Transactions` WHERE `Chair`='COM' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Date'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Category'] . "</td>
            <td>" . $row['Amount'] . "</td>
            <td><a href='deletetrans.php?tid=" . $row['id'] . "'>Delete</a></td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <br><br>
                    <div> <h3 align="center">Add Trasaction</h3>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td >
                                        Description
                                    </td>
                                    <td>
                                        Category
                                    </td>
                                    <td>
                                        Amount
                                    </td>
                                    <td>
                                        Actions
                                    </td>
                                </tr>
                                <tr>
                                    <FORM METHOD="POST" ACTION="processnewtrans.php?chair=COM">
                                        <td><input type="text" class="control-label col-lg-8" id="date" name="date" placeholder="Date"></td>
                                        <td><input type="text" class="control-label col-lg-8" id="desc" name="desc" placeholder="Description"></td>
                                        <td><select name="category" id="category">
                                                <option>Select...</option>
                                                <?php
                                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                                if ($mysqli->connect_errno) {
                                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                                }

                                                $res = $mysqli->query("SELECT Category FROM `Category` WHERE `Chair`='COM' ORDER BY `id` ASC");

                                                $res->data_seek(0);

                                                while ($row = $res->fetch_assoc()) {
                                                    if ($row['Category'] != 'Total') {
                                                        echo "<option>" . $row['Category'] . "</option>";
                                                    }
                                                }
                                                ?>
                                            </select></td>
                                        <td><input type="text" class="control-label col-lg-8" id="amt" name="amt" placeholder="Amount"></td>
                                        <td><INPUT TYPE="submit" VALUE="Add"></td>
                                    </FORM>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="operations">
                    <h1 align="center">Operations</h1>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td>Description</td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='OP' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Category'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>
            </td></tr>";
                            }

                            ?>

                        </table>
                    </div>
                    <h2 align="center">Transactions</h2>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Transactions` WHERE `Chair`='OP' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Date'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Category'] . "</td>
            <td>" . $row['Amount'] . "</td>
            <td><a href='deletetrans.php?tid=" . $row['id'] . "'>Delete</a></td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <br><br>
                    <div> <h3 align="center">Add Trasaction</h3>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td >
                                        Description
                                    </td>
                                    <td>
                                        Category
                                    </td>
                                    <td>
                                        Amount
                                    </td>
                                    <td>
                                        Actions
                                    </td>
                                </tr>
                                <tr>
                                    <FORM METHOD="POST" ACTION="processnewtrans.php?chair=OP">
                                        <td><input type="text" class="control-label col-lg-8" id="date" name="date" placeholder="Date"></td>
                                        <td><input type="text" class="control-label col-lg-8" id="desc" name="desc" placeholder="Description"></td>
                                        <td><select name="category" id="category">
                                                <option>Select...</option>
                                                <?php
                                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                                if ($mysqli->connect_errno) {
                                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                                }

                                                $res = $mysqli->query("SELECT Category FROM `Category` WHERE `Chair`='OP' ORDER BY `id` ASC");

                                                $res->data_seek(0);

                                                while ($row = $res->fetch_assoc()) {
                                                    if ($row['Category'] != 'Total') {
                                                        echo "<option>" . $row['Category'] . "</option>";
                                                    }
                                                }
                                                ?>
                                            </select></td>
                                        <td><input type="text" class="control-label col-lg-8" id="amt" name="amt" placeholder="Amount"></td>
                                        <td><INPUT TYPE="submit" VALUE="Add"></td>
                                    </FORM>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="training">
                    <h1 align="center">Training & Development</h1>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td>Description</td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='TD' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Category'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>
            </td></tr>";
                            }

                            ?>

                        </table>
                    </div>

                    <h2 align="center">Transactions</h2>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Transactions` WHERE `Chair`='TD' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Date'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Category'] . "</td>
            <td>" . $row['Amount'] . "</td>
            <td><a href='deletetrans.php?tid=" . $row['id'] . "'>Delete</a></td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <br><br>
                    <div> <h3 align="center">Add Trasaction</h3>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td >
                                        Description
                                    </td>
                                    <td>
                                        Category
                                    </td>
                                    <td>
                                        Amount
                                    </td>
                                    <td>
                                        Actions
                                    </td>
                                </tr>
                                <tr>
                                    <FORM METHOD="POST" ACTION="processnewtrans.php?chair=TD">
                                        <td><input type="text" class="control-label col-lg-8" id="date" name="date" placeholder="Date"></td>
                                        <td><input type="text" class="control-label col-lg-8" id="desc" name="desc" placeholder="Description"></td>
                                        <td><select name="category" id="category">
                                                <option>Select...</option>
                                                <?php
                                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                                if ($mysqli->connect_errno) {
                                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                                }

                                                $res = $mysqli->query("SELECT Category FROM `Category` WHERE `Chair`='TD' ORDER BY `id` ASC");

                                                $res->data_seek(0);

                                                while ($row = $res->fetch_assoc()) {
                                                    if ($row['Category'] != 'Total') {
                                                        echo "<option>" . $row['Category'] . "</option>";
                                                    }
                                                }
                                                ?>
                                            </select></td>
                                        <td><input type="text" class="control-label col-lg-8" id="amt" name="amt" placeholder="Amount"></td>
                                        <td><INPUT TYPE="submit" VALUE="Add"></td>
                                    </FORM>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="slush">
                    <h1 align="center">Jamie's Slush Fund</h1>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Category
                                </td>
                                <td>Description</td>
                                <td >
                                    Budget
                                </td>
                                <td>
                                    Actual
                                </td>
                                <td>
                                    Difference
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Category` WHERE `Chair`='SF' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Category'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Budget'] . "</td>
            <td>" . $row['Actual'] . "</td>
            <td>" . ($row['Budget'] - $row['Actual']) . "</td>
            </td></tr>";
                            }

                            ?>

                        </table>
                    </div>
                    <h2 align="center">Transactions</h2>
                    <div class="CSSTableGenerator" >
                        <table >
                            <tr>
                                <td>
                                    Date
                                </td>
                                <td >
                                    Description
                                </td>
                                <td>
                                    Category
                                </td>
                                <td>
                                    Amount
                                </td>
                                <td>
                                    Actions
                                </td>
                            </tr>
                            <?php
                            $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                            if ($mysqli->connect_errno) {
                                echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                            }

                            $res = $mysqli->query("SELECT * FROM `Transactions` WHERE `Chair`='SF' ORDER BY `id` ASC");

                            $res->data_seek(0);

                            while ($row = $res->fetch_assoc()) {

                                echo "<tr>
            <td><h4>" . $row['Date'] . "</h4></td>
            <td>" . $row['Description'] . "</td>
            <td>" . $row['Category'] . "</td>
            <td>" . $row['Amount'] . "</td>
            <td><a href='deletetrans.php?tid=" . $row['id'] . "'>Delete</a></td>
            </td></tr>";
                            }

                            ?>
                        </table>
                    </div>
                    <br><br>
                    <div> <h3 align="center">Add Trasaction</h3>
                        <div class="CSSTableGenerator" >
                            <table >
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td >
                                        Description
                                    </td>
                                    <td>
                                        Category
                                    </td>
                                    <td>
                                        Amount
                                    </td>
                                    <td>
                                        Actions
                                    </td>
                                </tr>
                                <tr>
                                    <FORM METHOD="POST" ACTION="processnewtrans.php?chair=SF">
                                        <td><input type="text" class="control-label col-lg-8" id="date" name="date" placeholder="Date"></td>
                                        <td><input type="text" class="control-label col-lg-8" id="desc" name="desc" placeholder="Description"></td>
                                        <td><select name="category" id="category">
                                                <option>Select...</option>
                                                <?php
                                                $mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
                                                if ($mysqli->connect_errno) {
                                                    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
                                                }

                                                $res = $mysqli->query("SELECT Category FROM `Category` WHERE `Chair`='SF' ORDER BY `id` ASC");

                                                $res->data_seek(0);

                                                while ($row = $res->fetch_assoc()) {
                                                    if ($row['Category'] != 'Total') {
                                                        echo "<option>" . $row['Category'] . "</option>";
                                                    }
                                                }
                                                ?>
                                            </select></td>
                                        <td><input type="text" class="control-label col-lg-8" id="amt" name="amt" placeholder="Amount"></td>
                                        <td><INPUT TYPE="submit" VALUE="Add"></td>
                                    </FORM>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>



                </div></div></div></div><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-unstyled">
                    <li class="pull-right"><a href="#top">Back to top</a></li></ul></div></div></footer></div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script>
    $('.coverage-open').slideUp(0);
    function updateClock() {
        var currentTime = new Date();
        var currentHoursAP = currentTime.getHours();
        var currentHours = currentTime.getHours();
        var currentMinutes = currentTime.getMinutes();
        var currentSeconds = currentTime.getSeconds();

        // Pad the minutes and seconds with leading zeros, if required
        currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
        currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;

        // Choose either "AM" or "PM" as appropriate
        var timeOfDay = (currentHours < 12) ? "AM" : "PM";

        // Convert the hours component to 12-hour format if needed
        currentHoursAP = (currentHours > 12) ? currentHours - 12 : currentHours;

        // Convert an hours component of "0" to "12"
        currentHoursAP = (currentHoursAP == 0) ? 12 : currentHoursAP;

        // Compose the string for display
        var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds;

        $("#clock").html(currentTimeString);
    }

    $(document).ready(function () {
        setInterval(updateClock, 1000);
    });
</script>
</body>
</html>