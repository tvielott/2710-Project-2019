CREATE TABLE Cities(
    cid VARCHAR(11),
    cname VARCHAR(50),
    state VARCHAR(25),
    PRIMARY KEY(cid)
); 

CREATE TABLE Payments(
    pid VARCHAR(11),
    ptype VARCHAR(40),
    check_num INT(30),
    PRIMARY KEY(pid)
); 

CREATE TABLE Users(
    uid VARCHAR(45),
    fName VARCHAR(45),
    lName VARCHAR(45),
    email VARCHAR(50),
    PASSWORD VARCHAR(25),
    phone INT(10),
    pid VARCHAR(10),
    PRIMARY KEY(uid),
    FOREIGN KEY(pid) REFERENCES Payments(pid)
); 

CREATE TABLE Addresses(
    aid VARCHAR(11),
    uid VARCHAR(11),
    street VARCHAR(50),
    cid VARCHAR(11),
    zip VARCHAR(15),
    PRIMARY KEY(aid),
    FOREIGN KEY(uid) REFERENCES Users(uid),
    FOREIGN KEY(cid) REFERENCES Cities(cid)
); 

CREATE TABLE Regions(
    rid VARCHAR(11),
    rname VARCHAR(45),
    PRIMARY KEY(rid)
); 

CREATE TABLE Stores(
    sid VARCHAR(11),
    rid VARCHAR(11),
    sname VARCHAR(45),
    PRIMARY KEY(sid),
    FOREIGN KEY(rid) REFERENCES Regions(rid)
); 

CREATE TABLE Employees(
    eid VARCHAR(11),
    uid VARCHAR(11),
    sid VARCHAR(11),
    salary INT(11),
    job_title VARCHAR(40),
    PRIMARY KEY(eid),
    FOREIGN KEY(sid) REFERENCES Stores(sid),
    FOREIGN KEY(uid) REFERENCES Users(uid)
); 

CREATE TABLE Store_manager(
    sid VARCHAR(11),
    eid VARCHAR(11),
    PRIMARY KEY(sid, eid),
    FOREIGN KEY(eid) REFERENCES Employees(eid),
    FOREIGN KEY(sid) REFERENCES Stores(sid)
); 

CREATE TABLE Region_manager(
    rid VARCHAR(11),
    eid VARCHAR(11),
    PRIMARY KEY(rid, eid),
    FOREIGN KEY(eid) REFERENCES Employees(eid),
    FOREIGN KEY(rid) REFERENCES Regions(rid)
); 

CREATE TABLE Publishers(
    pubid VARCHAR(11),
    pname VARCHAR(45),
    cid VARCHAR(11),
    PRIMARY KEY(pubid),
    FOREIGN KEY(cid) REFERENCES Cities(cid)
); 

CREATE TABLE Genres(
    gid VARCHAR(11),
    gname VARCHAR(45),
    PRIMARY KEY(gid)
); 

CREATE TABLE Authors(
    auid VARCHAR(11),
    name VARCHAR(45),
    PRIMARY KEY(auid)
); 

CREATE TABLE Books(
    isbn VARCHAR(13),
    title VARCHAR(45),
    image VARCHAR(250),
    pub_date DATE,
    pubid VARCHAR(11),
    price DOUBLE(10, 2),
    quantity_avail INT,
    PRIMARY KEY(isbn),
    FOREIGN KEY(pubid) REFERENCES Publishers(pubid)
); 

CREATE TABLE Books_genres(
    isbn VARCHAR(13),
    gid VARCHAR(11),
    PRIMARY KEY(gid, isbn),
    FOREIGN KEY(isbn) REFERENCES Books(isbn),
    FOREIGN KEY(gid) REFERENCES Genres(gid)
); 

CREATE TABLE Books_authors(
    isbn VARCHAR(13),
    auid VARCHAR(11),
    PRIMARY KEY(isbn, auid),
    FOREIGN KEY(isbn) REFERENCES Books(isbn),
    FOREIGN KEY(auid) REFERENCES Authors(auid)
); 

CREATE TABLE Ratings(
    uid VARCHAR(45),
    isbn VARCHAR(13),
    rating INT,
    review TEXT,
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid),
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
); 

CREATE TABLE Favorites(
    uid VARCHAR(45),
    isbn VARCHAR(13),
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid),
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
); 

CREATE TABLE Wishlists(
    uid VARCHAR(45),
    isbn VARCHAR(13),
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid),
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
); 

CREATE TABLE In_cart(
    uid VARCHAR(45),
    isbn VARCHAR(13),
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid),
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
); 

CREATE TABLE Orders(
    oid VARCHAR(11),
    aid VARCHAR(11),
    eid VARCHAR(11),
    uid VARCHAR(45),
    order_date DATE,
    shipped_date DATE,
    sid VARCHAR(11),
    PRIMARY KEY(oid),
    FOREIGN KEY(sid) REFERENCES Stores(sid),
    FOREIGN KEY(aid) REFERENCES Addresses(aid),
    FOREIGN KEY(eid) REFERENCES Employees(eid),
    FOREIGN KEY(uid) REFERENCES Users(uid)
); 

CREATE TABLE Orders_books(
    oid VARCHAR(11),
    isbn VARCHAR(13),
    units INT(11),
    price_at_sale INT,
    PRIMARY KEY(oid, isbn),
    FOREIGN KEY(oid) REFERENCES Orders(oid),
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
);
