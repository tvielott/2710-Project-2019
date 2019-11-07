CREATE TABLE Payments (
				pid int(11) Not NULL,
				ptype varchar(40)Not NULL,
				check_num int Not NULL,
				PRIMARY KEY(pid));

CREATE TABLE User (
  				uid varchar(45)Not NULL,
  				fName varchar(45)Not NULL,
  				lName varchar(45)Not NULL,
  				email varchar(50)Not NULL,
  				password varchar(25)Not NULL,
  				phone varchar(10)Not NULL,
  				pid int(10)Not NULL,
				PRIMARY KEY (uid),
				FOREIGN KEY(pid) REFERENCES Payments(pid),
                		ON UPDATE CASCADE,
				ON DELETE SET DEFAULT 'no user');

 

CREATE TABLE Employees(
    			   eid INT(11)Not NULL,
			   uid VARCHAR(45)Not NULL,	  
			   sid INT(11)Not NULL,
			   fname VARCHAR(45)Not NULL,
			   lname VARCHAR(45)Not NULL,
			   salary INT(11)Not NULL,   
			   job_title VARCHAR(40)Not NULL,  
 			   PRIMARY KEY(eid),
			   FOREIGN KEY(sid) REFERENCES Stores(sid), 
			   FOREIGN KEY(uid) REFERENCES Users(uid),
               ON DELETE CASCADE; 

CREATE TABLE Regions(
    			 rid INT(11)Not NULL,
			 rname VARCHAR(45)Not NULL,
			 manager INT(11)Not NULL, 
			 PRIMARY KEY(rid),
			 FOREIGN KEY(manager) REFERENCES Employees(eid))
             ON DELETE CASCADE; 



CREATE TABLE Stores(
     			 sid INT(11)Not NULL,
			 rid INT(11)Not NULL,
			 sname VARCHAR(45)Not NULL,
			 manager INT(11)Not NULL,  
			 PRIMARY KEY(sid),
			 FOREIGN KEY(rid) REFERENCES Regions(rid),
			 FOREIGN KEY(manager) REFERENCES Employees(eid))
             ON DELETE CASCADE; 

CREATE TABLE Authors (
  			 	auid INT(11)Not NULL,
  			 	fname varchar(45)Not NULL,
  			 	lname varchar(45)Not NULL,
  			 	PRIMARY KEY (auid)); 



CREATE TABLE Genres ( 
  			 	gid INT(11)Not NULL,
  			 	gname varchar(45)Not NULL,
  			 	PRIMARY KEY (gid)); 



CREATE TABLE Publishers (
  				pubid INT(11)Not NULL,
  				pname varchar(45)Not NULL,
				cid INT(11)Not NULL,
				PRIMARY KEY (pubid),
				FOREIGN KEY(cid) REFERENCES Cities(cid))
                ON DELETE CASCADE;

CREATE TABLE Books_genres (
  				isbn INT(13)Not NULL,
  				gid INT(11)Not NULL,
  				PRIMARY KEY (gid,isbn));

CREATE TABLE Orders(
            oid INT(11)Not NULL,
			 aid INT(11)Not NULL,   
			 eid INT(11)Not NULL,   
			 order_date DATE,
			 shipped_date DATE,     
			 sid INT(11)Not NULL,
			 PRIMARY KEY(oid),
			 FOREIGN KEY(aid) REFERENCES Addresses(aid),
			 FOREIGN KEY(eid) REFERENCES Employees(eid))
             ON DELETE CASCADE;


CREATE TABLE Orders_books(
   			      oid INT(11)Not NULL,
			      isbn INT(13)Not NULL,
			      units INT(11)Not NULL,
			      price_at_sale INT,
			      PRIMARY KEY(oid, isbn),
			      FOREIGN KEY(oid) REFERENCES Orders(oid),
			      FOREIGN KEY(isbn) REFERENCES Books(isbn))
                  ON DELETE CASCADE; 

CREATE TABLE Users_orders(
				uid VARCHAR(45)Not NULL,
				oid INT(11)Not NULL,
				PRIMARY KEY(uid, oid),
				FOREIGN KEY (uid) REFERENCES Users(uid),
				FOREIGN KEY (oid) REFERENCES Orders(oid))
                ON DELETE CASCADE;




CREATE TABLE In_cart(
                uid VARCHAR(45)Not NULL,
			 	isbn INT(13)Not NULL,
			 	PRIMARY KEY(uid, isbn),
			 	FOREIGN KEY(uid) REFERENCES Users(uid),
			 	FOREIGN KEY(isbn) REFERENCES Books(isbn));
              


CREATE TABLE Books (
  			 	isbn INT(13)Not NULL,
 			 	title varchar(45)Not NULL,
  			 	image blob,
  			 	pub_date date,
  			 	pubid INT(11)Not NULL,
  			 	auid INT(11)Not NULL,
  			 	price double(10,4)Not NULL,
  			 	quantity_avail INT Not NULL,
  			 	PRIMARY KEY (isbn),
  			 	FOREIGN KEY(pubid) REFERENCES Publishers(pubid),
  			 	FOREIGN KEY(auid) REFERENCES Authors (auid))
                ON DELETE CASCADE;




CREATE TABLE Favorites (
  				uid varchar(45)Not NULL,
  				isbn INT(13)Not NULL,
  				PRIMARY KEY (uid,isbn),
				FOREIGN KEY(uid) REFERENCES Users(uid),
				FOREIGN KEY(isbn) REFERENCES Books(isbn));

CREATE TABLE Wishlists (
  				uid varchar(45)Not NULL,
  				isbn INT(13)Not NULL,
  				PRIMARY KEY (uid,isbn),
				FOREIGN KEY(uid) REFERENCES Users(uid),
				FOREIGN KEY(isbn) REFERENCES Books(isbn));

CREATE TABLE Ratings (
  				uid varchar(45)Not NULL,
  				isbn INT(13)Not NULL,
				rating int Not NULL,
				review text,
  				PRIMARY KEY (uid,isbn),
				FOREIGN KEY(uid) REFERENCES Users(uid),
				FOREIGN KEY(isbn) REFERENCES Books(isbn));


CREATE TABLE Cities (
  				cid INT(11)Not NULL,
  				cname varchar(50)Not NULL,
  				state varchar(25)Not NULL,
  				PRIMARY KEY(cid));


CREATE TABLE Addresses (
  				aid int(11)Not NULL,
  				street varchar(50)Not NULL,
 				cid INT(11)Not NULL,
  				zip varchar(15)Not NULL,
  				PRIMARY KEY (aid),
				FOREIGN KEY(cid) REFERENCES Cities(cid));

CREATE TABLE User_addresses (
  				uid varchar(45)Not NULL,
  				aid INT(11)Not NULL, 
 				PRIMARY KEY (uid,aid),
  				FOREIGN KEY(uid) REFERENCES Users(uid), 
  				FOREIGN KEY(aid) REFERENCES Addresses(aid));


 
