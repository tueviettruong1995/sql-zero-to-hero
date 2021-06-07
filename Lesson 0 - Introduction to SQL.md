# Lesson 0 - Prepration for the course

## Table of contents:
[Setup software and connection to database](#Basic)
[Individual Project](#Project)
[Suggestion for you](#Note)

## <a name="Basic"/> Required Software and connection to database
- __Microsft SQL Server Server Management Studio__ for quering data
- __Azure Data Studio__ for quering data
- __Visual Studio (Community  version)__ for SSIS process on window only
- __Skyvia.com__ (https://skyvia.com) for SSIS process in Window and Mac (optional)
- __Apachee Nifi__ (https://nifi.apache.org) for SSIS process in Window and Mac (optional)
- __Robo 3T__ for quering data in mongodb server

#### Access to dataserver

+ Ip: 45.32.102.87 <br>
+ User and Password: send to email, no need to change password <br> 

##### Setup connection
###### Azure Data Studio
+ Install PostgreSQL extension <br>
![image](https://user-images.githubusercontent.com/19366516/115130443-0d707600-a01a-11eb-906d-b78957c21012.png)
+ Install SQL Server Import extension <br>
![image](https://user-images.githubusercontent.com/19366516/115130915-d7cd8c00-a01d-11eb-8976-9c6c452b7cb6.png)
+ Create Connection to PostgreSQL server:<br>
![image](https://user-images.githubusercontent.com/19366516/115130954-2844e980-a01e-11eb-9b72-99a3bd7a1e1e.png)
+ Create Connection to MSSQL server:<br>
![image](https://user-images.githubusercontent.com/19366516/115130995-8671cc80-a01e-11eb-86b4-54621a4c3742.png)
  
###### Microsft SQL Server Server Management Studio
+ Create Connection to MSSQL server: <br>
![image](https://user-images.githubusercontent.com/19366516/115131040-ef594480-a01e-11eb-9ff0-fad4aaf18d0b.png)
  
###### Robo 3T
+ Create connection to data server <br>
![image](https://user-images.githubusercontent.com/19366516/115141412-3e769800-a066-11eb-87b5-549cf026daa3.png)
+ Input your id and password <br>
![image](https://user-images.githubusercontent.com/19366516/115141447-6ebe3680-a066-11eb-9e63-1618fa2981cb.png)
  
#### Your accessible database:
After finish your connection, you will have following access to database:<br>
- for MSSQL server: <br>
    - StockDB_Main: select data only
    - StockDB_Add: select data only
    
```roomsql
-- Testing query:
select * from StockDB_Main.price_hist.host
select * from StockDB_Add.order_hist.buyorder

-- Error: No permission --
create table StockDB_Add.order_hist.testtbl (
	idvar int,
	namevar nvarchar (255)
);

```
    - Classroom: full permission on your owned schema (e.g. "Student1" will have full right (read, create table, etc.) within schema name "Student1")
```roomsql
-- Testing query:
create table if not exists Classroom.student1.testtable (
	idvar int,
	namevar nvarchar (255)
);
```    
- for PostgreSQL server:<br>
    - Country_info/PGS_country: Select data only main schema and full with on your schema
```roomsql
-- Testing query:
select * from public.country;
create table if not exists student1.test (
	idvar int,
	namevar nvarchar (255)
);
```    

- for MongoDB server:<br>
    - Classroom: full permission on your owned schema (e.g. "Student1" will have full right (read, create table, etc.) within schema name "Student1")



## <a name="Project"/>  Individual Project

In the last lecture of this course, you are expected to present your own project to demostrate ability to work with SQL datbase. You don't need to show complecated works, just simple one but your project should present your views and understanding. Basic requirement for your project is:
- Build a simple database in your selected platform (MSSQL,MySQL, PostgreSQL)
    - Think about what you want to do, examine. They may be data about your clothers, friends, current work
    - The database should have at least 5 tables and at least 500 rows of records
- Register your project before starting lesson 4
- Make a collection of metrics which can have you create useful reports from our data
- Present your works in the last lesson

## <a name="Note"/>  Lecture and recommendation
##### __Lesson 1 - Basic knowledge and Database__ <br>
- Your first understanding about database, pay attention to understand how tables are connected in a database<br>
##### __Lesson 2 - Basic Syntax__ <br>
- Select query is simple, you can google it anytime but is it more important to understand logic of syntax<br>
##### __Lesson 3 - Temporary tables, Views, Sub-Query__ <br>
- Still the basic, you will learn  about different ways to select and store data for later uses<br>
##### __Lesson 4 - ETL Processs__ <br>
- There is not any code here, you just need to click and press run, so easy right.<br>
##### __Lesson 5 - User-defined function, Procedures, Control of flow__ <br>
- It is the basic of some complicated things, you should not be panic. You can learn step by step as a complex thing is always made from simple ones.<br>
##### __Lesson 6 - General issues and Additional concept__ <br>
- !!! What you do you understand so far from the lesson? It is really good if you can share your  questions and concerns about knowledege. Also, I have something new for you.<br>
##### __Lesson 7 - Working with NoSQL database__ <br>
- Just another deep introduction about another type of database, nothing is complicated here<br>
##### __Lesson 8 - Project presentation__<br>
- Show up yourself, your understanding, and your best <br>
