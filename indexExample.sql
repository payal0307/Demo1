
CREATE TABLE Users (
    userID INT PRIMARY KEY identity,
    userName VARCHAR(50) ,
    email VARCHAR(100) ,
    balance DECIMAL(18, 2) 
);
insert into Users values('jiya','jiya@gmail.com',5000)
insert into Users values('pragti','jiya@gmail.com',2000)
insert into Users values('siya','jiya@gmail.com',3000)
insert into Users values('neha','jiya@gmail.com',5000)

CREATE NONCLUSTERED INDEX index_username
ON Users(userName)
select * from Users where userName='neha'