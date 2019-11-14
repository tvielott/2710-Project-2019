<?php
/* Displays user information and some useful messages */
session_start();

// Check if user is logged in using the session variable
if ( $_SESSION['logged_in'] != 1 ) {
  $_SESSION['message'] = "You must log in before viewing your profile page!";
  header("location: error.php");    
}
else {
    // Makes it easier to read
    $first_name = $_SESSION['first_name'];
    $last_name = $_SESSION['last_name'];
    $email = $_SESSION['email'];
	$_SESSION['email1']=$email;
	
   
}
?>
<!DOCTYPE html>
<html >
<head>
<!-- Stylesheets -->
		<link href="css/styles.css" rel="stylesheet" type="text/css" media="all">
  <meta charset="UTF-8">
  <title>Welcome <?= $first_name.' '.$last_name ?></title>
  <?php include 'css/css.html'; ?>
</head>

<body>
<?php
      include 'topheader.php';
    ?>
  <div class="form">

          <h1>Welcome</h1>
          
          <h2><?php echo $first_name.' '.$last_name; ?></h2>
          <p><?= $email ?></p>
          
		
          
          <?php
          if ($email=='admin@admin.com'){
          		echo '<a href="admin/viewProducts.php" class="button button-block">Admin Page</a>';
          }
         
          ?>
		  <div class="field-wrap">
          <form>
		  <input class="MyButton" onclick="window.location.href='history.php'" type="button" value="Order History "  />
		  </form>
		  </div>
		  <div class="field-wrap">
		  <form>
		  <input class="MyButton" onclick="window.location.href='personal.php'" type="button" value="Personal Information" name=/>
		  </form>
		  </div>
       
          <div>
          <a href="logout.php"><button class="button button-block" name="logout"/>Log Out</button></a>
		  </div>

    </div>
    
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/index.js"></script>

</body>
</html>
