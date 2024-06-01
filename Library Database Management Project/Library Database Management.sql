create database library_demo;

show databases;

use library_demo;

CREATE TABLE readers
(
	reader_id VARCHAR(6),
    fname VARCHAR(30),
    mname VARCHAR(30),
    ltname VARCHAR(30),
    city VARCHAR(15),
    mobileno VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE,
    CONSTRAINT readers_pk PRIMARY KEY(reader_id)
);

INSERT INTO readers VALUES('C00001', 'Ramesh', 'Chandra', 'Sharma', 'Delhi', '9543198345','Service', '1976-12-06');
INSERT INTO readers VALUES('C00002', 'Avinash', 'Sunder', 'Minha', 'Delhi', '9876532109','Service', '1974-10-16');
INSERT INTO readers VALUES('C00003', 'Rahul', NULL, 'Rastogi', 'Delhi', '9765178901','Student', '1981-09-26');
INSERT INTO readers VALUES('C00004', 'Parul', NULL, 'Gandhi', 'Delhi', '9876532109','Housewife', '1976-11-03');
INSERT INTO readers VALUES('C00005', 'Naveen', 'Chandra', 'Aedekar', 'Mumbai', '8976523190','Service', '1976-09-19');
INSERT INTO readers VALUES('C00006', 'Chitresh', NULL, 'Barwe', 'Mumbai', '7651298321','Student', '1992-11-06');
INSERT INTO readers VALUES('C00007', 'Amit', 'Kumar', 'Borkar', 'Mumbai', '9875189761','Student', '1981-09-06');
INSERT INTO readers VALUES('C00008', 'Nisha', NULL, 'Damle', 'Mumbai', '7954198761','Service', '1975-12-03');
INSERT INTO readers VALUES('C00009', 'Abhishek', NULL, 'Dutta', 'Kolkata', '9856198761','Service', '1973-05-22');
INSERT INTO readers VALUES('C000010', 'Shankar', NULL, 'Nair', 'Chennai', '8765489076','Service', '1976-07-12');

select * from readers;

drop table book;

CREATE TABLE Book
(
	bid VARCHAR(6),
    bname VARCHAR(40),
    bdomain VARCHAR(30),
    CONSTRAINT book_bid_pk PRIMARY KEY(bid)
);


INSERT INTO book VALUES('B00001','The cat in the hat','Story');
INSERT INTO book VALUES('B00002','Charlie and the chocolate factory','Story');
INSERT INTO book VALUES('B00003','The very hungry caterpillar','Story');

CREATE TABLE active_readers
(
	account_id VARCHAR(6),
    reader_id VARCHAR(6),
    bid VARCHAR(6),
    atype VARCHAR(10),
    astatus VARCHAR(10),
    CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
    CONSTRAINT account_readerid_fk foreign key(reader_id)REFERENCES readers(reader_id),
    CONSTRAINT account_bid_fk FOREIGN KEY(bid)REFERENCES book(bid)
);

select * from active_readers;

INSERT INTO active_readers VALUES('A00001','C00001','B00001','Premium','Active');
INSERT INTO active_readers VALUES('A00002','C00002','B00002','Regular','Active');
INSERT INTO active_readers VALUES('A00003','C00003','B00002','Premium','Active');
INSERT INTO active_readers VALUES('A00004','C00002','B00003','Premium','Active');
INSERT INTO active_readers VALUES('A00005','C00006','B00002','Regular','Active');
INSERT INTO active_readers VALUES('A00006','C00007','B00001','Premium','Suspended');
INSERT INTO active_readers VALUES('A00007','C00007','B00001','Premium','Active');
INSERT INTO active_readers VALUES('A00008','C00001','B00003','Regular','Terminated');
INSERT INTO active_readers VALUES('A00009','C00003','B00002','Premium','Terminated');
INSERT INTO active_readers VALUES('A000010','C00004','B00002','Regular','Active');

select * from active_readers;

CREATE TABLE bookissue_details
(
	issuenumber VARCHAR(6),
    account_id VARCHAR(6),
    bid VARCHAR(20),
    bookname VARCHAR(50),
    numbers_of_book_issued INT(7),
    CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
    CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(bookissue_details),
);

SHOW tables;
drop table bookissue_details;

INSERT INTO bookissue_details VALUES('T00001','A00001','B00001','The cat in the hat','3');
INSERT INTO bookissue_details VALUES('T00002','A00001','B00002','Charlie and the chocolate factory','4');
INSERT INTO bookissue_details VALUES('T00003','A00002','B00001','The cat in the hat','2');
INSERT INTO bookissue_details VALUES('T00004','A00002','B00003','The very hungry caterpillar','1');

select * from active_readers;

select * from active_readers where astatus='Terminated';

select * from active_readers where astatus='Active';

select count(account_id) from active_readers where atype="Premium";
