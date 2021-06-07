# Lesson 3 - Temporary tables, Views, Sub-Query 

In SQL, we can store  retreived data in temporary table or view to access quickly accesswithout requiring. In this lesson, you will understand applications of temporary tables and views. Also, you will known about Sub-query which is an approach to nest multiple queries together.Temporary table, views, or sub-query can be consider different methods to get a same output, their differences are mostly intern of speed to get data.

#### Table of content<br>
[Temporay table](#temp-table)<br>
[View](#View)<br>
[Subqueries](#Subqueries)<br>

- SQL lectures and homework:

|Item|MSSQL|PostgreSQL|MySQL|
|-----|-----|-----|-----|
|Temporarty Table|Insert into|Create temp table| Create temp table|
|View|Create View|Create View [table] As Select|Create View [table] As Select|
|SubQuery|Where(Select)|Where(Select)|Where(Select)|


### <a name="temp-table"/> Temporay table
What it is: to store a temporary result set, which you can reuse several times in a single session.
How it works: Temporary table will create  physical store in database
When to use:
- Combine outputs from multiple queries
- Quick access to values without the needs to re-query
- Simplize complicated queries

Limitation:
- Temporary table will be deleted after session end (user logout) 
- Temporary table cannot be updated (insert and delete records). It need to drop and query again 
- Cannot access to temporary table from function

#### Types of temporary tables
|Local table|Global table|
|-------|-------|
|Create table #[table]| Create table ##[table]|
|visible only in the current session|are visible to all sessions (connections)|
|Table dropped when session ended|Table dropped when created session ended|

```SQL
Select * into #temporary_table
from orginal table;
```
### <a name="View"/>View
What it is: a virtual table acting as a filter.
How it works: A view create a virtual table but it will not store data until it is indexed (save to database). 
When to use:
- Improve the performation/ speeds of a query
- Want to  combine conditions from different servers, databases, and other views
- Share combined data to users without the users permission to directly asccess the underlying based tables of the view
Limitation:

#### Types of  views
|User-defined View|Indexed View| Partitioned Views| System Views|
|---------|---------|---------|---------|
|to show a subset of objects and their properties from the table|the resulting data stored just like a table|joins horizontally partitioned data from a set of member tables across one or more servers| to return information about the instance of SQL Server or the objects defined in the instance.|
|||||
|||||

```SQL
Create View table_view as 
select * from orginal-table;
```

### <a name="Subqueries"/> Subqueries
what it is: A subquery is a query that is nested inside a SELECT, INSERT, UPDATE, or DELETE statement, or inside another subquery.
reference <br>
 - https://docs.microsoft.com/en-us/sql/relational-databases/performance/subqueries?view=sql-server-ver15
 
When to use:
- Need to have quick solution to filter data based on condtions of different tables
- An alternative to temporary tables and views when users cannot create temporary table or view

Limitation:
- Cannot select more than 1 columns in subquery
- Cannot use subqueries in  order by, group by, etc.
- Donot have significant improvement in query's performance

```SQL
Select * from original_table1
where iterm in (select item from original_table2)
;
```  
