/*Banking System*/
/*Creating A New Database*/
create database banking_system;
use banking_system;

/*Creating all the required Tables*/
/*Table 1 : Customers*/
create table Customers(
c_id int primary key auto_increment,
c_name varchar(20),
c_contact varchar(10) check(length(c_contact) = 10),
c_gender char(1) check(c_gender in ("M","F")),
c_age int check(c_age>=18));

/*Table 2 : Accounts*/
create table Accounts(
a_id int primary key auto_increment,
c_id int,
balance bigint,
open_date date,
foreign key Accounts(c_id) references Customers(c_id));
alter table Accounts auto_increment=101;
alter table Accounts modify column balance bigint default '5000';

/*Table 3 : Transactions*/
create table Transactions(
t_id int primary key auto_increment,
a_id int,
t_type varchar(10) check(t_type in("Deposite","Withdrawl","Payment Credit","Payment Debit")),
amount bigint check(amount>0),
t_date date,
foreign key Transactions(a_id) references Accounts(a_id));
alter table Transactions auto_increment=501;
alter table Transactions modify column t_type varchar(30) check(t_type in("Deposite","Withdrawl","Payment Credit","Payment Debit"));

/*Table 4 : Loans*/
create table Loans(
l_id int primary key auto_increment,
c_id int,
l_type varchar(20) check (l_type in ("Home","Personal","Education","Car")),
l_amount bigint,
l_roi decimal(4,3) check(l_roi>0.000),
l_start_date date,
l_end_date date,
l_closed_on date,
foreign key Loans(c_id) references Customers(c_id));
alter table Loans auto_increment=1001;
alter table Loans modify column l_roi decimal(5,3);

/*Adding Entries in the created Tables*/
/*Inserting into Customers*/
insert into Customers(c_name,c_contact,c_gender,c_age) values
("Customer1",1111111111,"M",35),
("Customer2",2222222222,"F",30),
("Customer3",3333333333,"F",55),
("Customer4",4444444444,"F",43),
("Customer5",5555555555,"M",68),
("Customer6",6666666666,"F",28),
("Customer7",7777777777,"M",25),
("Customer8",8888888888,"M",47),
("Customer9",9999999999,"M",19),
("Customer10",1234567890,"M",38);
select * from Customers;

/* Inserting into Accounts*/
INSERT INTO Accounts (c_id, balance, open_date) VALUES
(1, 15000, '2022-01-15'),
(2, 32000, '2022-03-20'),
(3, 54000, '2022-05-10'),
(4, 27500, '2022-06-18'),
(5, 89000, '2022-07-22'),
(6, 43000, '2022-09-05'),
(7, 12000, '2022-11-11'),
(8, 67000, '2023-01-25'),
(9, 51000, '2023-04-02'),
(10, 76000, '2023-07-14');

/*Insering into Transactions*/
INSERT INTO Transactions (a_id, t_type, amount, t_date) VALUES
(101, 'Deposite', 15000, '2024-01-05'),
(103, 'Withdrawl', 5000, '2024-01-10'),
(107, 'Payment Debit', 2200, '2024-01-12'),
(110, 'Deposite', 30000, '2024-01-15'),
(102, 'Payment Credit', 4500, '2024-01-18'),
(104, 'Withdrawl', 8000, '2024-01-22'),
(108, 'Deposite', 12000, '2024-01-25'),
(109, 'Payment Debit', 2000, '2024-02-01'),
(106, 'Withdrawl', 9000, '2024-02-03'),
(105, 'Deposite', 18000, '2024-02-08'),
(103, 'Payment Credit', 3500, '2024-02-10'),
(107, 'Deposite', 25000, '2024-02-14'),
(101, 'Withdrawl', 4000, '2024-02-17'),
(110, 'Payment Debit', 2700, '2024-02-19'),
(102, 'Deposite', 22000, '2024-02-22'),
(108, 'Withdrawl', 6500, '2024-02-25'),
(106, 'Payment Credit', 5000, '2024-03-01'),
(104, 'Deposite', 14000, '2024-03-04'),
(109, 'Withdrawl', 7000, '2024-03-06'),
(105, 'Payment Debit', 3300, '2024-03-09'),
(107, 'Withdrawl', 7200, '2024-03-12'),
(101, 'Payment Credit', 2500, '2024-03-15'),
(103, 'Deposite', 27000, '2024-03-18'),
(102, 'Withdrawl', 4600, '2024-03-20'),
(110, 'Deposite', 32000, '2024-03-23'),
(106, 'Withdrawl', 8000, '2024-03-25'),
(109, 'Deposite', 16000, '2024-03-28'),
(108, 'Payment Debit', 2100, '2024-04-01'),
(104, 'Withdrawl', 5600, '2024-04-04'),
(105, 'Deposite', 19000, '2024-04-06'),
(103, 'Payment Debit', 2800, '2024-04-09'),
(107, 'Deposite', 26000, '2024-04-12'),
(101, 'Withdrawl', 3500, '2024-04-15'),
(110, 'Payment Credit', 4700, '2024-04-18'),
(102, 'Deposite', 21000, '2024-04-21'),
(104, 'Withdrawl', 6000, '2024-04-23'),
(108, 'Deposite', 17000, '2024-04-26'),
(109, 'Payment Debit', 2400, '2024-04-29'),
(106, 'Withdrawl', 8800, '2024-05-02'),
(105, 'Payment Credit', 4200, '2024-05-05'),
(103, 'Withdrawl', 5000, '2024-05-07'),
(101, 'Deposite', 23000, '2024-05-10'),
(107, 'Payment Debit', 3100, '2024-05-13'),
(110, 'Withdrawl', 9200, '2024-05-15'),
(102, 'Payment Credit', 3900, '2024-05-18'),
(104, 'Deposite', 15500, '2024-05-21'),
(108, 'Withdrawl', 7400, '2024-05-23'),
(109, 'Deposite', 18500, '2024-05-26'),
(105, 'Withdrawl', 6700, '2024-05-28'),
(106, 'Payment Debit', 2600, '2024-05-30');

/*Inserting into Loans*/
INSERT INTO Loans (c_id, l_type, l_amount, l_roi, l_start_date, l_end_date, l_closed_on) VALUES
(7, 'Car', 420000, 9.250, '2020-02-15', '2022-02-15', '2022-08-15'),
(3, 'Home', 2800000, 8.750, '2019-05-20', '2024-05-20', '2024-09-20'),
(9, 'Personal', 160000, 12.500, '2021-06-10', '2022-06-10', '2022-12-10'),
(1, 'Car', 510000, 10.200, '2022-07-12', '2023-07-12', '2024-01-12'),
(5, 'Home', 3500000, 9.150, '2020-08-01', '2025-08-01', '2025-11-01'),
(8, 'Personal', 120000, 18.750, '2021-09-18', '2023-09-18', '2024-03-18'),
(2, 'Car', 600000, 11.800, '2019-10-25', '2021-10-25', '2022-05-25'),
(10, 'Home', 1900000, 7.950, '2020-11-11', '2022-11-11', '2023-06-11'),
(4, 'Personal', 140000, 15.200, '2022-01-05', '2023-01-05', '2023-08-05'),
(6, 'Car', 450000, 13.400, '2021-02-14', '2024-02-14', '2024-09-14'),
(7, 'Home', 3000000, 8.650, '2018-05-01', '2023-05-01', '2023-10-01'),
(1, 'Car', 375000, 9.750, '2020-06-22', '2022-06-22', '2022-12-22'),
(8, 'Personal', 100000, 11.300, '2021-07-30', '2022-07-30', '2022-12-30'),
(9, 'Home', 3100000, 9.850, '2019-09-15', '2024-09-15', '2025-03-15'),
(2, 'Car', 550000, 12.200, '2021-10-10', '2023-10-10', '2024-06-10'),
(3, 'Personal', 180000, 21.500, '2020-12-01', '2022-12-01', '2023-05-01'),
(10, 'Home', 2700000, 7.650, '2021-01-12', '2026-01-12', '2026-07-12'),
(6, 'Car', 480000, 10.800, '2022-03-03', '2025-03-03', '2025-09-03'),
(5, 'Personal', 220000, 14.750, '2020-04-07', '2021-04-07', '2021-11-07'),
(4, 'Home', 2600000, 8.200, '2019-05-14', '2024-05-14', '2024-09-14'),
(9, 'Car', 390000, 14.500, '2020-06-09', '2023-06-09', '2023-11-09'),
(7, 'Personal', 140000, 19.400, '2021-07-21', '2022-07-21', '2023-02-21'),
(1, 'Home', 3300000, 9.550, '2018-08-30', '2023-08-30', '2024-03-30'),
(8, 'Car', 420000, 8.250, '2020-09-11', '2022-09-11', '2023-06-11'),
(3, 'Personal', 160000, 12.950, '2022-10-18', '2024-10-18', '2025-03-18'),
(2, 'Home', 3100000, 7.850, '2019-11-25', '2024-11-25', '2025-07-25'),
(5, 'Car', 510000, 9.300, '2021-12-02', '2022-12-02', '2023-06-02'),
(6, 'Personal', 130000, 16.200, '2020-01-09', '2021-01-09', '2021-08-09'),
(10, 'Home', 2950000, 8.950, '2019-02-14', '2025-02-14', '2025-10-14'),
(4, 'Car', 460000, 12.750, '2022-03-20', '2025-03-20', '2025-09-20');

/*Analysis 1 : Customer Demograph*/
delimiter //
create procedure cust_demo()
begin 
	select c_gender, count(c_id) 
    from Customers
    group by c_gender;
end//

delimiter ;
call cust_demo();

/*Analysis 2 : Top Customers*/

delimiter //
create procedure top_cust()
begin
	select c.c_name,a.balance from Customers c
    inner join Accounts a
	on c.c_id = a.c_id
    where a.balance > 50000;
end //
delimiter ;

call top_cust();

/*Analysis 3 : Transaction Pattern*/

delimiter //
create procedure tr_pattern(in id int)
begin
	select t.t_type as Transaction_Type,
    sum(t.amount) as Amount from Transactions t
    inner join Accounts a on t.a_id = a.a_id
    inner join Customers c on a.c_id = c.c_id
    where c.c_id = id
    group by t_type;
end //
delimiter ;

call tr_pattern(10);

/*Analysis 4 : Loan Analysis*/

delimiter //
create procedure loan_analyzer(in id int)
begin
	select c_id,
    l_type as Loan_Type,
    sum(l_amount) as Loan_Principal,
    round(avg(l_roi),3) as Rate_of_Interest,
    round(avg((datediff(l_end_date,l_start_date)/365)),1) as Loan_Tenure
    from Loans 
    where c_id = id
    group by c_id,l_type;
end //
delimiter ;

call loan_analyzer(1);

/*Analysis 5 : Credit Score Generater*/

delimiter //
create procedure cscore_generator(in id int)
begin
	select c_id as Customer_ID,
    round(avg(1000 - round((period_diff(date_format(l_closed_on,'%Y%m'),date_format(l_end_date,'%Y%m'))/13)*1000)),2) as Credit_Score
    from Loans
    where c_id = id
    group by c_id;
end //
delimiter ;

call cscore_generator(1);

/*Customer Financial Health Analysis*/

delimiter //
create procedure finance_analysis(in id int)
begin
	select c.c_id as Customer_ID, 
    sum(a.balance) as total_balance,
    sum(case when t.t_type = "Deposite" then t.amount when t.t_type = "Withdrawl" then -t.amount else 0 end) as net_transaction,
    sum(l_amount) as total_loan
    from Customers c
    inner join Accounts a on c.c_id = a.c_id
    inner join Transactions t on a.a_id = t.a_id
    inner join Loans l on c.c_id = l.c_id
    where id = c.c_id
    group by c.c_id;
end //
delimiter ;

call finance_analysis(6);

/*Simple Interest calculator*/

delimiter //
create function SI (amount bigint, roi double, start_date date, end_date date)
returns float
deterministic	
begin 
	declare tenure double; 
    declare si double;
    set tenure = round((datediff(end_date, start_date)/365),1);
    set si = round(((amount*roi*tenure)/100),2);
	return si;
end //
delimiter ;

select c_id, SI(l_amount,l_roi,l_start_date,l_end_date) as Simple_Interest from Loans;

/*Auto Balance Update*/

delimiter //
create trigger Auto_Balance
After insert
on Transactions
for each row
begin 
	if new.t_type in ("Deposite","Payment Credit") then 
    update Accounts
    set balance = balance + new.amount
    where a_id = new.a_id;
    else
    update Accounts
    set balance = balance - new.amount
    where a_id = new.a_id;
    end if;
end //
delimiter ;

select * from Accounts;

INSERT INTO Transactions (a_id, t_type, amount, t_date) VALUES
(101, 'Deposite', 1000, '2024-06-01');
/*END*/


        



