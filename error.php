<?php
/* Displays all error messages */
session_start();
?>
<!DOCTYPE html>
<html>
<head>
  <title>Error</title>
  <?php include 'css/css.html'; ?>
  <!-- Stylesheets -->
		<link href="css/styles.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
<?php
      include 'topheader.php';
    ?>
<div class="form">
    <h1>Error</h1>
    <p>
    <?php 
    if( isset($_SESSION['message']) AND !empty($_SESSION['message']) ): 
        echo $_SESSION['message'];    
	
    else:
        header( "location: account.php" );
    endif;
    ?>
    </p>     
    <a href="account.php"><button class="button button-block"/>Home</button></a>
</div>
</body>
</html>
