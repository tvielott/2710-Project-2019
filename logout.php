<?php
/* Log out process, unsets and destroys session variables */
session_start();
session_unset();
session_destroy(); 
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
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
          <h1>Thanks for stopping by</h1>
              
          <p><?= 'You have been logged out!'; ?></p>
          
          <a href="account.php"><button class="button button-block"/>Home</button></a>

    </div>
</body>
</html>
