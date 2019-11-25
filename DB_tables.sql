CREATE TABLE Payments (
				pid varchar(11),
				ptype varchar(40),
				check_num int,
				PRIMARY KEY(pid));

CREATE TABLE User (
  				uid varchar(45),
  				fName varchar(45),
  				lName varchar(45),
  				email varchar(50),
  				password varchar(25),
  				phone int(10),
  				pid varchar(10),
				PRIMARY KEY (uid),
				FOREIGN KEY(pid) REFERENCES Payments(pid));

 

CREATE TABLE Employees(
    			   eid varchar(11),
			   uid VARCHAR(45),	  
			   sid varchar(11),
			   salary INT(11),   
			   job_title VARCHAR(40),  
 			   PRIMARY KEY(eid),
			   FOREIGN KEY(sid) REFERENCES Stores(sid), 
			   FOREIGN KEY(uid) REFERENCES Users(uid)); 

CREATE TABLE Regions(
    			 rid varchar(11),
			 rname VARCHAR(45),
			 manager varchar(11), 
			 PRIMARY KEY(rid),
			 FOREIGN KEY(manager) REFERENCES Employees(eid)); 



CREATE TABLE Stores(
     			 sid varchar(11),
			 rid varchar(11),
			 sname VARCHAR(45),
			 manager varchar(11),  
			 PRIMARY KEY(sid),
			 FOREIGN KEY(rid) REFERENCES Regions(rid),
			 FOREIGN KEY(manager) REFERENCES Employees(eid)); 

CREATE TABLE Authors (
  			 	auid varchar(11),
  			 	name varchar(45),
  			 	PRIMARY KEY (auid)); 



CREATE TABLE Genres ( 
  			 	gid varchar(11),
  			 	gname varchar(45),
  			 	PRIMARY KEY (gid)); 



CREATE TABLE Publishers (
  				pubid varchar(11),
  				pname varchar(45),
				cid varchar(11),
				PRIMARY KEY (pubid),
				FOREIGN KEY(cid) REFERENCES Cities(cid));

CREATE TABLE Books_genres (
  				isbn VARCHAR(13),
  				gid varchar(11),
  				PRIMARY KEY (gid,isbn));

CREATE TABLE Orders(
                	 oid varchar(11),
			 aid varchar(11),   
			 eid varchar(11),  
			 uid VARCHAR(45),
			 order_date DATE,
			 shipped_date DATE,     
			 sid varchar(11),
			 PRIMARY KEY(oid),
			 FOREIGN KEY(aid) REFERENCES Addresses(aid),
			 FOREIGN KEY(eid) REFERENCES Employees(eid),
			 FOREIGN KEY (uid) REFERENCES Users(uid));


CREATE TABLE Orders_books(
   			      oid varchar(11),
			      isbn VARCHAR(13),
			      units INT(11),
			      price_at_sale INT,
			      PRIMARY KEY(oid, isbn),
			      FOREIGN KEY(oid) REFERENCES Orders(oid),
			      FOREIGN KEY(isbn) REFERENCES Books(isbn)); 




CREATE TABLE In_cart(
    				uid VARCHAR(45),
			 	isbn VARCHAR(13),
			 	PRIMARY KEY(uid, isbn),
			 	FOREIGN KEY(uid) REFERENCES Users(uid),
			 	FOREIGN KEY(isbn) REFERENCES Books(isbn));


CREATE TABLE Books (
  			 	isbn VARCHAR(13),
 			 	title varchar(45),
  			 	image blob,
  			 	pub_date date,
  			 	pubid INT(11),
  			 	price double(10,2),
  			 	quantity_avail INT,
  			 	PRIMARY KEY (isbn),
  			 	FOREIGN KEY(pubid) REFERENCES Publishers(pubid));




CREATE TABLE Favorites (
  				uid varchar(45),
  				isbn VARCHAR(13),
  				PRIMARY KEY (uid,isbn),
				FOREIGN KEY(uid) REFERENCES Users(uid),
				FOREIGN KEY(isbn) REFERENCES Books(isbn));

CREATE TABLE Wishlists (
  				uid varchar(45),
  				isbn VARCHAR(13),
  				PRIMARY KEY (uid,isbn),
				FOREIGN KEY(uid) REFERENCES Users(uid),
				FOREIGN KEY(isbn) REFERENCES Books(isbn));

CREATE TABLE Ratings (
  				uid varchar(45),
  				isbn VARCHAR(13),
				rating int,
				review text,
  				PRIMARY KEY (uid,isbn),
				FOREIGN KEY(uid) REFERENCES Users(uid),
				FOREIGN KEY(isbn) REFERENCES Books(isbn));


CREATE TABLE Cities (
  				cid varchar(11),
  				cname varchar(50),
  				state varchar(25),
  				PRIMARY KEY(cid));


CREATE TABLE Addresses (
  				aid varchar(11),
  				street varchar(50),
 				cid varchar(11),
  				zip varchar(15),
  				PRIMARY KEY (aid),
				FOREIGN KEY(cid) REFERENCES Cities(cid));

CREATE TABLE User_addresses (
  				uid varchar(45),
  				aid varchar(11), 
 				PRIMARY KEY (uid,aid),
  				FOREIGN KEY(uid) REFERENCES Users(uid), 
  				FOREIGN KEY(aid) REFERENCES Addresses(aid));
								   
CREATE TABLE Books_authors (
  				isbn VARCHAR(13),
				auid varchar(11),
 				PRIMARY KEY (isbn,auid),
  				FOREIGN KEY(isbn) REFERENCES Books(isbn), 
  				FOREIGN KEY(auid) REFERENCES Authors (auid));

 
