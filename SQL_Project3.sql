create database Library;
use Library;

create table Books(
book_id int primary key auto_increment,
title varchar(200),
author varchar(100),
genre varchar(50),
publication_year year,
available_copies int
);
alter table Books
modify genre varchar(50) check(genre in ('Fantasy', 'Science Fiction', 'Mystery', 'Thriller')),
auto_increment=101;


create table Members(
member_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
emali varchar(50),
phone varchar(10) check(length(phone)=10)
);
alter table Members auto_increment=1001;

create table Borrows(
borrow_id int primary key auto_increment,
member_id int,
book_id int,
borrow_date date,
due_date date,
returned bool,
foreign key (member_id) references Members(member_id) on delete cascade,
foreign key (book_id) references Books(book_id) on delete cascade
);

INSERT INTO Books (title, author, genre, publication_year, available_copies) VALUES
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 5),
('Dune', 'Frank Herbert', 'Science Fiction', 1965, 3),
('The Da Vinci Code', 'Dan Brown', 'Mystery', 2003, 4),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Thriller', 2005, 2),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 1997, 6),
('Foundation', 'Isaac Asimov', 'Science Fiction', 1951, 3),
('Gone Girl', 'Gillian Flynn', 'Thriller', 2012, 4);

INSERT INTO Members (first_name, last_name, emali, phone) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '9876543210'),
('Bob', 'Smith', 'bob.smith@example.com', '9123456789'),
('Charlie', 'Brown', 'charlie.brown@example.com', '9988776655'),
('Diana', 'Evans', 'diana.evans@example.com', '9090909090'),
('Edward', 'Miller', 'edward.miller@example.com', '9812345678');

INSERT INTO Borrows (member_id, book_id, borrow_date, due_date, returned) VALUES
(1001, 101, '2025-09-01', '2025-09-15', TRUE),
(1002, 102, '2025-09-02', '2025-09-16', TRUE),
(1003, 103, '2025-09-03', '2025-09-17', FALSE),
(1004, 104, '2025-09-04', '2025-09-18', TRUE),
(1005, 105, '2025-09-05', '2025-09-19', FALSE),
(1001, 106, '2025-09-06', '2025-09-20', TRUE),
(1002, 107, '2025-09-07', '2025-09-21', FALSE),
(1003, 101, '2025-09-08', '2025-09-22', TRUE),
(1004, 102, '2025-09-09', '2025-09-23', TRUE),
(1005, 103, '2025-09-10', '2025-09-24', FALSE),
(1001, 104, '2025-09-11', '2025-09-25', TRUE),
(1002, 105, '2025-09-12', '2025-09-26', FALSE),
(1003, 106, '2025-09-13', '2025-09-27', TRUE),
(1004, 107, '2025-09-14', '2025-09-28', FALSE),
(1005, 101, '2025-09-15', '2025-09-29', TRUE),
(1001, 102, '2025-09-16', '2025-09-30', TRUE),
(1002, 103, '2025-09-17', '2025-10-01', FALSE),
(1003, 104, '2025-09-18', '2025-10-02', TRUE),
(1004, 105, '2025-09-19', '2025-10-03', FALSE),
(1005, 106, '2025-09-20', '2025-10-04', TRUE);

/* Analysis Topics */

/* 1. All books in 'Mystery' Genre */
select concat_ws("-",title,author) as Book_and_Author from Books
where genre = 'Mystery';

/* 2. Members with Overdue */
select concat(m.first_name," ",m.last_name) as Member_Name,
b.title as Book,
datediff(curdate(),r.due_date) as Due_by_Days from Members m
inner join Borrows r on m.member_id = r.member_id
inner join Books b on r.book_id = b.book_id
where returned=FALSE and due_date<curdate();

/* 3. Total books borrowed by each members */
select concat(m.first_name," ",m.last_name) as Member_Name,count(r.book_id) as Borrowed_Books_Count from Members m
inner join Borrows r on m.member_id = r.member_id
group by Member_Name;

/* 4. Update borrow status*/
delimiter //
create procedure Update_status(in m_id int,in id int,in status_to bool)
begin
	update Borrows
    set returned = status_to
    where member_id = m_id and book_id = id;
end //
delimiter ;

call Update_status(1005,106,False);

/* 5. Low Availability Books */
select book_id as ID,title as Book_Name,available_copies as Available_Copies from Books
where available_copies<5;

/* 6. Author Specific Members */
select concat(m.first_name," ",m.last_name) as Member_Name from Members m
inner join Borrows b on m.member_id = b.member_id
inner join Books k on b.book_id = k.book_id
where k.author = 'J.R.R. Tolkien';

/* 7. Most Borrowed Books */
select b.title as Book_Name,
count(r.book_id) as Book_Count 
from Borrows r
inner join Books b on r.book_id = b.book_id
group by b.title
order by count(r.book_id)
limit 1;

/* 8. Member with highest number of overdue books */
select concat(m.first_name," ",m.last_name) as Member_Name,
count(r.returned) as Borrowed_Books_Count from Borrows r
inner join Members m on r.member_id = m.member_id
where r.returned = FALSE
group by Member_Name
order by Borrowed_Books_Count
limit 1;

/* 9. Total active borrows */
select distinct concat(m.first_name," ",m.last_name) as Active_Member from Members m
inner join Borrows r on m.member_id = r.member_id 
where r.returned = FALSE;

/* 10. Average loan Duration */
select
round(avg(datediff(due_date,borrow_date)),2) as Average_Borrow_Duration
from Borrows
where returned = TRUE;