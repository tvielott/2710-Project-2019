<?php
$servername = "pittdb.czu5wcl6rjbg.us-east-2.rds.book.com";
$username = "tak129";
$password = "tak1292710";
$database = "final_project";
$conn = new mysqli($servername, $username, $password, $database);
		
// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
} 
?>