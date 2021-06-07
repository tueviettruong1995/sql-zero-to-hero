-- PostgreSQL --
-- ======================================================================================================= --

/* Create a temporary table*/
-- Create temporary table for all columns --

/*Create temporary table and assign created table to other schema*/
Create table instructor.method1_temptb1 as Select * 

;


-- Create temporary table for selected columns --

Create table method1_temptb1_col (temp_id, temp_name) as

;

select * from method1_temptb1_col;

-- Create temporaty table from multiple table


/* ============================ Uses of temporarty table
As stated, temporary is used for quick access to data without the needs to re-write complicated query again. It also saves time and resources for querying data
*/
/*Excersice: Apply the use of temporary table to create a dataset having Country, Year, PPnumber, and PPtype (Global, Male, Female) in different columns
 
select * from public.trans;
drop table if EXISTS trans_temp1;
drop table if EXISTS trans_temp2;
drop table if EXISTS trans_temp3;

create table trans_temp1 AS
    select CountryID, yearID,PPnumber,PPtypeID
    from public.trans
    where PPtypeID = 1;

create table trans_temp2 AS
    select CountryID, yearID,PPnumber,PPtypeID
    from public.trans
    where PPtypeID = 2;

create table trans_temp3 AS
    select CountryID, yearID,PPnumber,PPtypeID
    from public.trans
    where PPtypeID = 3 ;

select tbl1.CountryID, 
tbl1.yearID,
tbl1.PPnumber as GLobal_PPnumber,
tbl2.PPnumber as Female_PPnumber,
tbl3.PPnumber as Male_PPnumber
from trans_temp1 tbl1 left join trans_temp2 TBL2
    on tbl1.CountryID = tbl2.CountryID and  tbl1.yearID = tbl2.yearID
left join trans_temp3 TBL3
    on tbl1.CountryID = tbl3.CountryID and  tbl1.yearID = tbl3.yearID
;
 */

/*Thinking about a simpler solution? we can use pivot function to complete this task 
Option 1: In PostgreSQL: crosstab function
CREATE EXTENSION IF NOT EXISTS tablefunc; 
select * 
from crosstab(select CountryID, yearID,PPnumber,PPtypeID from public.trans order by 1,2)
as pivot_table(CountryID int,yearID int, 1 int, 2 int, 3 int)
;
Otption 2: Using basic syntax with case when

select CountryID, yearID,
CASE when PPtypeID = 1 then PPnumber end as Global_PPnumber, 
CASE when PPtypeID = 2 then PPnumber end as Female_PPnumber, 
CASE when PPtypeID = 3 then PPnumber end as Male_PPnumber
from public.trans 
;
*/


/* ============================ Create views */
-- Create a single view --

drop view if EXISTS tempview1;
Create view  tempview1 as

;

select * from tempview1;

-- Create a multiple views --



/* ============================ Using subquery (a query within other query)
- Nested query within where statement of other queries
- It can be used as an alternative method for joining table

*/
select * from public.trans where countryid  in (
    select countryid from public.country 
        where  cntname like '%Euro%'
    ); -- Total execution time: 00:00:00.335--

select * 
from public.trans tbl1 left join  public.country tbl2 
ON tbl1.countryID = tbl2.countryID
where tbl2.cntname like '%Euro%'
; -- Total execution time: 00:00:00.392 -- 


/*Excercise: Using View and subquery functions to generate a dataset having all below condition:
- Include Country Name, RegionName, Popuplation Type, GPD, Life Expectationcy and 
- Selected countries having minimum average GDP is 50,000
*/


/*Common Table Expressions*/

-- MSSSQL SQL --
-- ======================================================================================================= --

select * from  Classroom.dbo.#method1_temptb1;

/* 
Temporary tables, Views and Sub-queries are also available in MSSQL Server. ALso most syntaxes are same except the syntax to create "Temporary table"
In MSSQL Server:
- Temporary table: Select [columns] into #temp_table from table ;
- Views: Create VIEW View_table  as Select [columns] from [table];
- Subquery: Select [columns] from [table] where [key-column] in (select key-column from [other table] );
*/

/* Create a temporary table */
-- Method 1 with  local temporary table --
-- Create temporary table from 1 single table --



/*!!!!!!!! Select data from a table in a schema and then asssign created tables in another schema !!!!!!!!!*/



-- get data --


-- Create temporary table from 2 tables --


-- Method 2 with global temporary table --
-- Create temporary table from 1 single table --

-- get data --
select * from #method2_temptb1;

-- Create temporary table from 2 tables --



/* Create a View */



/*Working with subquery*/

