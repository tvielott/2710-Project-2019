 <div class="top">
			
			<form action="query.php">
				<input type="search" id="mySearch" name="q"
				placeholder="What are you looking for?" size="50">
				<button>Search</button>
				
			</form>
			
			
			<?php
				session_start();
				if ( isset($_SESSION['email']) ){
					echo '<a href="profile.php"><h4>Account</h4></a>';
				} else {
					echo '<a href="account.php"><h4>Account</h4></a>';
				}
			?>
            <a href="cart.php"><h4>Cart</h4></a>
            <a href="wishlist.php"><h4>whish list</h4></a>
            <a href="home.php"><h4>home</h4></a>
			
           </div>

			

       <body>
           <img class="logo" src="images/logo.png"/>

</body>
       