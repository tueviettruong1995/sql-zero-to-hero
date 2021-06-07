# Lesson 2 - Basic Syntax in SQL

Hi you all, <br>

In this lesson, we will learn about basics of SQL's syntax to get data from database. You already know, SQL systax can be different by different type of SQL database. They share same logical flows and structures of query but details and some functions arre different among them. For more details about syntax, you can refer to the websites:<br>

__w3schools.com__: https://www.w3schools.com/sql/<br>

Table of content<br>
[Structures of queries](#structure_query)<br>
[Common Functions](#common-function)<br>
[Identify information related to the table](#table-information)<br>



### <a name="table-information"/>  Identify information related to the table
What will you do when you are new to a database? You need data but you donot what you have? So, you will need a dictionary for data or a document which can list all fields, tables, schemas, etc. in a database. The document will be useful for you.

```roomsql
-- Identify information related to the table in PostgreSQL--

select table_schema,
       table_name,
       ordinal_position as position,
       column_name,
       data_type,
       case when character_maximum_length is not null
            then character_maximum_length
            else numeric_precision end as max_length,
       is_nullable,
       column_default as default_value
from information_schema.columns
where table_schema not in ('information_schema', 'pg_catalog')
order by table_schema, 
         table_name,
         ordinal_position;
```

### <a name="structure_query"/> Structures of queries
#### Based structures
The __SELECT statement__ is used to query data from tables or views <br>


|Element|Description|
|-------|-----------|
|SELECT| Lists the columns (and expressions) to be returned from the query, use: <br> - __select *__ from all columns, or<br> -  __select column1, column2__ for specific columns|
|FROM|Identifies the table(s) or view(s) from which data will be obtained|
|WHERE|	Specifies the conditions under which a row will be included in the result|
|GROUP BY|Indicates the categorization of results|
|HAVING| Indicates the conditions under which a category (group) will be included (must be used with GROUP BY)|
|ORDER BY|Sorts the result according to specified criteria|


For a single table in PostGreSQL <br>
```roomsql 
SELECT [ALL/DISTINCT] column_list
FROM table_list
[WHERE conditional_expression]
[GROUP BY group_by_column_list]
[HAVING group_by_conditional_expression]
[ORDER BY order_by_column_list]

```

For multple tables in PostGreSQL <br>
```roomsql 
Select [*|column1|column2]
from table_name1 [left|rigth|outer|inner| join] table_name2
  on table_name1.ID = table_name2.ID
Where condition1
  [and | or] condition2
Group by
  column1
Having
  agrregate function
Order by 
  column1 [asc/desc]
```
##### WildCard in SQL
In SQL, we can apply some built-in operations in WHere-condition and Having clouse to filter rows by characters (e.g. letter, digit, etc.). Such operatior are called __wildcard__.<br>

|LIKE Operator|	Description|
|-------------|-------------|
|WHERE <column_name>  LIKE 'a%'|	Finds any values that starts with "a"|
|WHERE <column_name>  LIKE '%a'|	Finds any values that ends with "a"|
|WHERE <column_name>  LIKE '%or%'|	Finds any values that have "or" in any position|
|WHERE <column_name>  LIKE '_r%'|	Finds any values that have "r" in the second position|
|WHERE <column_name>  LIKE 'a__%'|	Finds any values that starts with "a" and are at least 3 characters in length|
|WHERE <column_name>  LIKE 'a%o'|	Finds any values that starts with "a" and ends with "o"|

Reference:<br>
- https://www.w3schools.com/sql/sql_wildcards.asp

#### Alias for attributes and tables
An unique name/ keyword represents a column, or a table in a query.  We use alias instead of re-write full name of a table/ a column. An alise has effect within its' query only.<br>
- An alise is set next to the right-hand side of  it's orginial name by "column_name alias" or "column_name as alias"
- A table's alias can be put to the left-hand side of a column_name before set the alias in original table's name like "tbl1.column_name alias"

``` roomsql
Select column1 alias1, column2 alias2
from table_name1 tbl_alias 1
```
``` roomsql
Select tbl_alias1.column1 alias1, tbl_alias2.column2 alias2
from table_name1 tbl_alias1 left join table_name2 tbl_alias2
  on tbl_alias1.id = tbl_alias2.id
```
###  <a name="common-function"/> Common functions
#### Date functions 
Definition: used to find totals using date values
```SQL
Select [date_function];
```
|MSSQL|PGSQL|MySQL|Description|
|-------|-------|-------|-------|
|GETDATE()|	CURRENT_DATE()|CURDATE()	|Shows the current date|
|CURRENT_TIMESTAMP()|	CURRENT_DATE()|CURTIME()	|Shows the current time|
|DATEADD(interval, number, date)| INTERVAL()|DATE_ADD()	|Adds a certain interval to a specified date|
|DATEDIFF(interval, date1, date2)| DATEDIFF()|DATEDIFF()	|Subtracts two dates and returns the difference in days|
|CONVERT(data_type(length), expression, style)|TO_DATE(text,format)|	STR_TO_DATE()|Converts a date string to a date format|

 Reference: <br>
 - https://docs.microsoft.com/en-us/sql/t-sql/functions/current-timestamp-transact-sql?view=sql-server-ver15
 - https://www.w3schools.com/sql/func_sqlserver_dateadd.asp
 - https://www.w3schools.com/sql/func_sqlserver_convert.asp
 - http://www.sqlines.com/postgresql/how-to/datediff
- https://www.postgresqltutorial.com/postgresql-to_date/


#### String function
```roomsql
Select [string_function]
```
|MSSQL|PGSQL|MySQL|Description|
|-------|-------|-------|-------|
|CONCAT()|CONCAT()|CONCAT()|	Returns a single string that combines multiple strings|
|CHARINDEX(substring, string, start)|POSITION|INSTR()|	Finds a specific character in a string|
|LEFT()|LEFT()|LEFT()|	Returns the leftmost/rightmost number of characters specified|
|LOWER()|LOWER()|LOWER()|	Returns a string with all lower case letters|
|TRIM()|TRIM()|TRIM()|	Removes leading and trailing spaces from a string (LTRIM and RTRIM)|
|SUBSTRING(string, start, length)|SUBSTRING()|SUBSTR()|	Returns a string that matches specified character positions|
|UPPER()|UPPER()|UPPER()|	Returns a string with all UPPER case letters|

Reference: <br>
- https://www.w3schools.com/sql/func_sqlserver_concat.asp
- https://w3resource.com/PostgreSQL/substring-function.php

#### Mathematical Expressions and Functions
##### Mathematical Expressions

|Expressions|Explaination|Descrtiption|
|-------|-------|-------|
|+|	Addition |returns the original column value plus a specified value|
|-|  Subtraction|returns the original column value minus a specified value|
|* |Multiplication| returns the original column value times a specified value|
|/|	Division|returns the original column value divided by a specified value|
|%|	Modulo|returns the remainder that  results from dividing two integers|
 
##### Mathematical Functions

|Functions|Description|
|-------|-------|
|Min|		Returns the minimum value in a column|
|Max|		Returns the maximum value in a column|
|Count|		Counts the total number of records retrieved by the selection criteria|
|Sum|		Sums the records for a given column that meet the selection criteria|
|AVG|		Averages the records for a given column that meet the selection criteria|
|Round|		Rounds the records to a specific number of decimal places|


#### Query other operations:
  -  Unique/ Distinct
  - Comparison Operators
  - Like Operators
  - Null Values
  - Boolean Operators (and, or, not)
  - In and not in Operators vs Between and not between
  - Grouping, Ordering, and Top/ Limit
 
####  Union results and Joining different tables
![image](https://user-images.githubusercontent.com/19366516/113887023-53903300-97eb-11eb-836e-342b740903b5.png) <br>

reference:<br>
- https://www.javatpoint.com/mysql-union-vs-union-all
##### Join tables to find outputs
![image](https://user-images.githubusercontent.com/19366516/113883038-01014780-97e8-11eb-94aa-1c807a4943c8.png)<br>

Retrieve data from two or more tables based on logical relationships between the tables. Joins indicate how SQL should use data from one table to select the rows in another table.<br>
Joining some tables is not limited to tables placaced in same schema or database. Some SQL server (e.g. MSSQL Server) allow users to join tables from different schema or database within one  query while some other server like PostgreSQL does not allow cross-database query. <br> 
```roomsql
-- Join tables with single key --
Select *
from tbl1 left| right| outer| inner join tbl2
on tbl1.key1 = tbl2.key1

-- join tables with multiple key --
Select *
from tbl1 left| right| outer| inner join tbl2
on tbl1.key1 = tbl2.key1 and tbl1.key2 = tbl2.key2

```
Note: <br>
- Self-join is a special case when a table join with itselt. This kind of join is useful when we want to lookup-up different information within a table.
```SQL
Select *
from  table_name tbl1 inner join table_name tbl2
on tbl1.key1 = tbl2.key1
```

#### Union outputs
UNION combines the results of two or more queries into a single result set that includes all the rows that belong to all queries in the union.<br>

#### Case- when function
__Case- when__ statement present returned outputs of conditions in a selection query. It is used mostly when we what to classify outputs into sepecfic values. Note, Case-when is uused within a query while if-else statment is used to work with a number of query.<br>

```roomsql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result as Something
END;
```
