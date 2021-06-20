# Lesson 5 -  User-defined varaibles and functions, Procedures,and Control of flow with  Looping and If-else

In this section, we will examine the usage of variables and functions which are craeted by users, procedures and looping functions in SQL.

Table of content<br>
[User-defined variable](#UDV)<br>
[User-defined function](#UDF)<br>
[Procedures](#Procedures)<br>
[Control of Flow](#COF)<br>  

### <a name="UDV"/>User-defined variable
User-defined variables (UDV) are used when we want to process with pre-determined targets with out re-type all codes.User-defined variables are variables which can be created by the user and exist in the session. This means that no one can access user-defined variables that have been set by another user, and when the session is closed these variables expire. However, these variables can be shared between several queries and stored programs. <br>

User-defined variables names must be preceded by a single at character (@)<br>

```roomsql
DECLARE @input1 int;
set @input1 = 10
Select  *  from  StockDB_Main.price_hist.stock where  stockID  = @input1;
```

Reference: <br>
- https://mariadb.com/kb/en/user-defined-variables/
- https://www.sqlshack.com/the-table-variable-in-sql-server/

### <a name="UDF"/>User-defined function
Like functions in programming languages, SQL Server user-defined functions are routines that accept parameters, perform an action, such as a complex calculation, and return the result of that action as a value. The return value can either be a single scalar value or a result set.<br>


#### Type of UDF
|Scalar Function|Table-Valued Functions|System Functions|
|---------------|---------------|---------------|
|Return a single data value of the type defined in the RETURNS clause. The return type can be any data type except text, ntext, image, cursor, and timestamp.|User-defined table-valued functions return a table data type. For an inline table-valued function, there is no function body; the table is the result set of a single SELECT statement.|SQL Server provides many system functions that you can use to perform a variety of operations. They cannot be modified. For more information|

```roomsql
CREATE FUNCTION [database_name.]function_name (parameters)
RETURNS data_type AS
BEGIN
    SQL statements
    RETURN value
END;
    
ALTER FUNCTION [database_name.]function_name (parameters)
RETURNS data_type AS
BEGIN
    SQL statements
    RETURN value
END;
    
DROP FUNCTION [database_name.]function_name;
```
__Note:__<br>
In a function, it is mandatory to ___use the RETURNS and RETURN arguments__, whereas in a stored procedure is not necessary.<br>

__Reference__<br>
https://docs.microsoft.com/en-us/sql/relational-databases/user-defined-functions/user-defined-functions?view=sql-server-ver15#:~:text=Like%20functions%20in%20programming%20languages,value%20or%20a%20result%20set.
### <a name="Procedures"/>Procedures
A stored procedure in SQL Server is a group of one or more Transact-SQL statements
#### Type of Stored Procedure
|User-defined|Temporary|System|
|---------------|---------------|---------------|
|A user-defined procedure can be created in a user-defined database or in all system databases except the Resource database. The procedure can be developed in either Transact-SQL or as a reference to a Microsoft .NET Framework common runtime language (CLR) method.|Temporary procedures are a form of user-defined procedures. The temporary procedures are like a permanent procedure, except temporary procedures are stored in tempdb. There are two types of temporary procedures: local and global. |System procedures are included with SQL Server. They are physically stored in the internal, hidden Resource database and logically appear in the sys schema of every system- and user-defined database. |
Reference:<br>
https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver15

### <a name="COF"/>Control of flow
- Operation with Begin - End in SQL:
Encloses a series of Transact-SQL statements so that a group of Transact-SQL statements can be executed. BEGIN and END are control-of-flow language keywords.<br>

```roomsql
BEGIN  
    { sql_statement | statement_block }   
END  
```
Reference:<br>
- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/begin-end-transact-sql?view=sql-server-ver15

#### While-Looping
Sets a condition for the repeated execution of an SQL statement or statement block. The statements are executed repeatedly as long as the specified condition is true. The execution of statements in the WHILE loop can be controlled from inside the loop with the BREAK and CONTINUE keywords. <br>

<img width="350" src="https://user-images.githubusercontent.com/19366516/115131392-0cdbdd80-a022-11eb-8a48-d75448dfb6f4.png">

```roomsql
WHILE condition
    BEGIN
       {...statements...}
    END

WHILE Boolean_expression   
     { sql_statement | statement_block | BREAK | CONTINUE }  

```

Reference:<br>
- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/while-transact-sql?view=sql-server-ver15



#### If-else statement
Imposes conditions on the execution of a Transact-SQL statement. The Transact-SQL statement that follows an IF keyword and its condition is executed if the condition is satisfied: the Boolean expression returns TRUE. The optional ELSE keyword introduces another Transact-SQL statement that is executed when the IF condition is not satisfied: the Boolean expression returns FALSE.<br>


```roomsql
IF Boolean_expression   
     { sql_statement | statement_block }   
[ ELSE   
     { sql_statement | statement_block } ] 
```

#### Try-cath Statment

```roomsql
BEGIN TRY  
     { sql_statement | statement_block }  
END TRY  
BEGIN CATCH  
     [ { sql_statement | statement_block } ]  
END CATCH  
[ ; ]  
```

Reference:<br>
- https://docs.microsoft.com/vi-vn/sql/t-sql/language-elements/if-else-transact-sql?view=sql-server-2017
