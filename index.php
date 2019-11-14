<html lang="en">

	
	<head>
		<meta charset="utf-8">
		<title>book Leaf Home</title>

		<!-- Stylesheets -->
		<link href="css/styles.css" rel="stylesheet" type="text/css" media="all">

	</head>

	<body>
<?php
      include 'topheader.php';
    ?>
		
		<!----- end top navigation bars ----->
		<div class="main">

			<?php
			require_once('mysqli_connect.php');
			session_start();
			$email=$_SESSION['email'];
			

			$sql = "select book_id ...>4";// need sql q
			
			$result = $conn->query($sql);

		/*	if ($result){
				echo '<h2>Top Rated</h2>';
				echo '<section class="products">';
				while ($row = $result->fetch_assoc()){	
					echo '<div class="product-card">';
					echo '<a href="product.php?id=' . $row['product_id'] . '"><div class="product-image"><img src="' . $row['image'] .'" height="150px"></div></a>';
					echo '<div class="product-info">';
					if (strlen($row['name'])<22){
						echo '<h4>' . $row['name'] . '</h4>';
					} else {
						echo '<h4>' . substr($row['name'], 0,19) . '...</h4>';
					}
					if ($row['discount']>0){
						$new_price = $row['price'] - (($row['discount']/100)* $row['price']);
						echo '<h5>$' . $row['price'] . '<span style="color:red"> %'. $row['discount'] . ' off</h5>';
					}else{
						echo '<h5> $' . $row['price'] . '</h5>';
					}		
					echo '</div></div>';
				}
				echo '</section>';
			} else {
				echo "Couldn't issue db query";
				echo mysqli_error($conn);
			}
			*/
			// Close connection
			mysqli_close($conn);
			?>

			
		</div>
	</body>
</html>