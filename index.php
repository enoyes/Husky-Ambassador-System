<?php
session_start();
if(isset($_SESSION['username'])){
    header("location:homepage.php");
}
?>

<head>
    <title>Tour Guide Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>


    <style type="text/css"></style>
</head>
<body>
<?php include 'nav.php'; ?>
<br> <br>

<div class="container"><br/>

    <div class="page-header" id="banner">
        <div class="row">
            <div class="col-lg-5">
                <h1>Husky Ambassador Management System</h1>

                <p class="lead">Your ultimate tour guide portal.</p></div>
            <div class="col-lg-5">
            </div>
        </div>
    </div>
    <div id="login" class="col-lg-6" align="center">
        <div class="well">
            <form method="POST" action="checklogin.php" class="bs-example form-horizontal">
                <fieldset>
                    <div class="form-group"><label for="inputUsername" class="col-lg-2 control-label">Username</label>

                        <div class="col-lg-10"><input type="text" class="form-control" name="username"
                                                      placeholder="Username"/></div>
                    </div>
                    <div class="form-group"><label for="inputPassword" class="col-lg-2 control-label">Password</label>

                        <div class="col-lg-10"><input type="password" class="form-control" name="password"
                                                      placeholder="Password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <br/><br/>
    <br/><br/>
    <br/><br/>
</body>
</html>