CREATE TABLE Cities(
    cid VARCHAR(11),
    cname VARCHAR(50),
    state VARCHAR(25),
    PRIMARY KEY(cid)
); 

CREATE TABLE Payments(
    pid VARCHAR(11),
    ptype VARCHAR(40),
    check_num VARCHAR(30),
    PRIMARY KEY(pid)
); 

CREATE TABLE Users(
    uid VARCHAR(45),
    fName VARCHAR(45),
    lName VARCHAR(45),
    email VARCHAR(50),
    PASSWORD VARCHAR(25),
    phone VARCHAR(12),
    pid VARCHAR(11),
    PRIMARY KEY(uid),
    FOREIGN KEY(pid) REFERENCES Payments(pid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Addresses(
    aid VARCHAR(11),
    uid VARCHAR(11),
    street VARCHAR(50),
    cid VARCHAR(11),
    zip VARCHAR(15),
    PRIMARY KEY(aid),
    FOREIGN KEY(uid) REFERENCES Users(uid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(cid) REFERENCES Cities(cid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
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
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Employees(
    eid VARCHAR(11),
    uid VARCHAR(11),
    sid VARCHAR(11),
    salary VARCHAR(11),
    job_title VARCHAR(40),
    PRIMARY KEY(eid),
    FOREIGN KEY(sid) REFERENCES Stores(sid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(uid) REFERENCES Users(uid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Store_manager(
    sid VARCHAR(11),
    eid VARCHAR(11),
    PRIMARY KEY(sid, eid),
    FOREIGN KEY(eid) REFERENCES Employees(eid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(sid) REFERENCES Stores(sid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Region_manager(
    rid VARCHAR(11),
    eid VARCHAR(11),
    PRIMARY KEY(rid, eid),
    FOREIGN KEY(eid) REFERENCES Employees(eid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(rid) REFERENCES Regions(rid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Publishers(
    pubid VARCHAR(11),
    pname VARCHAR(45) UNIQUE,
    cid VARCHAR(11),
    PRIMARY KEY(pubid),
    FOREIGN KEY(cid) REFERENCES Cities(cid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
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
    isbn VARCHAR(30),
    title VARCHAR(500),
    image VARCHAR(250),
    pubid VARCHAR(11),
    price DOUBLE(10, 2),
    quantity_avail INT,
    PRIMARY KEY(isbn),
    FOREIGN KEY(pubid) REFERENCES Publishers(pubid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Books_genres(
    isbn VARCHAR(30),
    gid VARCHAR(11),
    PRIMARY KEY(gid, isbn),
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(gid) REFERENCES Genres(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Books_authors(
    isbn VARCHAR(30),
    auid VARCHAR(11),
    PRIMARY KEY(isbn, auid),
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(auid) REFERENCES Authors(auid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Ratings(
    uid VARCHAR(45),
    isbn VARCHAR(30),
    rating INT,
    review TEXT,
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Favorites(
    uid VARCHAR(45),
    isbn VARCHAR(30),
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Wishlists(
    uid VARCHAR(45),
    isbn VARCHAR(30),
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE In_cart(
    uid VARCHAR(45),
    isbn VARCHAR(30),
    PRIMARY KEY(uid, isbn),
    FOREIGN KEY(uid) REFERENCES Users(uid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Orders(
    oid VARCHAR(11),
    aid VARCHAR(11),
    eid VARCHAR(11),
    uid VARCHAR(45),
    order_date DATE,
    shipped_date DATE,
    sid VARCHAR(11),
    completed TINYINT(1),
    PRIMARY KEY(oid),
    FOREIGN KEY(sid) REFERENCES Stores(sid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(aid) REFERENCES Addresses(aid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(eid) REFERENCES Employees(eid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(uid) REFERENCES Users(uid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 

CREATE TABLE Orders_books(
    oid VARCHAR(11),
    isbn VARCHAR(30),
    units INT(11),
    price_at_sale INT,
    PRIMARY KEY(oid, isbn),
    FOREIGN KEY(oid) REFERENCES Orders(oid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(isbn) REFERENCES Books(isbn)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
