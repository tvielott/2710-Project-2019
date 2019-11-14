<?php
/* Registration process, inserts user info into the database 
   and sends account confirmation email message
 */

// Set session variables to be used on profile.php page
$_SESSION['email'] = $_POST['email'];
$_SESSION['first_name'] = $_POST['firstname'];
$_SESSION['last_name'] = $_POST['lastname'];

// Escape all $_POST variables to protect against SQL injections
$first_name = $mysqli->escape_string($_POST['firstname']);
$last_name = $mysqli->escape_string($_POST['lastname']);
$email = $mysqli->escape_string($_POST['email']);
$password = $mysqli->escape_string(password_hash($_POST['password'], PASSWORD_BCRYPT));
$hash = $mysqli->escape_string( md5( rand(0,1000) ) );
      
// Check if user with that email already exists
$result = $mysqli->query("SELECT * FROM Customer WHERE email='$email'") or die($mysqli->error());

// We know user email exists if the rows returned are more than 0
if ( $result->num_rows > 0 ) {
    
    $_SESSION['message'] = 'User with this email already exists!';
    header("location: error.php");
    
}
else { // Email doesn't already exist in a database, proceed...

    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
		
		$sql1 = 'INSERT INTO Cart (number_books, total_price) VALUES (0, 0)';

if (mysqli_query($mysqli, $sql1)) {
    $last_id = mysqli_insert_id($mysqli);
     // insert into Customer table here
} else {
    echo "Error: " . $sql1 . "<br>" . mysqli_error($conn);
}

		
		$sql2 = "INSERT INTO Customer(first_name, last_name, email, password, hash, cart_id) " 
            . "VALUES ('$first_name','$last_name','$email','$password', '$hash', '$last_id')";
		
	
			
			
			if ( $mysqli->query($sql2) ){

       
            $_SESSION['logged_in'] = true; // So we know the user has logged in
       
            header("location: profile.php"); 
			
			}else {
				$_SESSION['message'] = 'Registration failed!';
				header("location: error.php");
			}
	}else {
		
		echo "Email address '$email' is considered invalid.\n";
	}
}