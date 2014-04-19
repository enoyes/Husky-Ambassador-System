<html>
<head>
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" href="../../bootstrap/css/bootswatch.css" media="screen"/>
</head>
<body>
<div class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="../../homepage.php">Husky Ambassadors Management System</a>
    </div>
    <div class="navbar-collapse collapse navbar-responsive-collapse">
        <ul class="nav navbar-nav">
            <li><a href="../../vc/dashboard.php">Checkin</a></li>
            <li><a href="../../leaderboard.php">Leaderboard</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Welcome Day<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="../../welcomeday.php">Welcome Day Signup</a></li>

                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Coverage<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="../../coverage.php">Request Coverage</a></li>
                    <li><a href="../../coveratour.php">Cover a Tour</a></li>
                </ul>
            </li>

            <?php

            if ($_SESSION["role"] == "SLC") {
                echo '
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">SLC<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="../tourguide.php">Roster</a></li>
                    <li><a href="../schedule_ui.php">Schedule</a></li>
                    <li><a href="../welcomedaylist.php">Welcome Day List</a></li>
                    <li><a href="budget.php">Budget</a></li>
                    <li><a href="emaillist.php">Email</a></li>
                </ul>
            </li>
                    ';
            }
            ?>

        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="../help.php">Help</a></li>
            <li><a href="../logout.php">Logout</a></li>
        </ul>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../bootstrap/js/bootswatch.js"></script>
</body>
</html>