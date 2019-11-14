<?php
/* Database connection settings */
$host = 'pittdb.czu5wcl6rjbg.us-east-2.rds.book.com';
$user = 'xix58';
$pass = 'dbfinal2710';
$db = 'final_project';
$mysqli = new mysqli($host,$user,$pass,$db) or die($mysqli->error);
