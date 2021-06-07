-- POSTGRE SQL --
-- ======================================================================================================= --
-- Basic Syntax --
/* ============================ Select data from a table:*/



/*Working with Conditions in Where and Having clause
- Comparison Operators
- Like Operators
- Null Values
- Boolean Operators (and, or, not)
- In and not in Operators vs Between and not between
*/



/* Exercise: In country table, select  countries having:
1)  Abbreviation starting with C
Select  * from public.country where cntcode like 'C%'; 

2)  Abbreviation starting with C or D
Select  * from public.country where cntcode like 'C%' or  cntcode like 'D%'; 

3)  Regional ID is  2 and IncomeGroup ID is 4
Select  * from public.country where regionid = 2 and igid = 4; 
*/


/* ============================ with Group by:
 - "Group by" is needed to have all original columns/ attributes presented in Select clause of the query 
 => Error log: column must appear in the GROUP BY clause or be used in an aggregate function
 - "Group by" is used with aggregate functions like "count", "sum", "min", "max" 
*/

select * from public.country;

-- Incorrect syntax -- 
select regionid,igid, count(cntname)
from public.country
group by regionid;

-- Correct syntax


-- order by with desc--



-- Having clause --
/* Where condition vs Having clause
- Both "Where condtion" and "Having clause" used to filtering rows in data
- "Having claused" can be used with aggregate functions and group by only.
- A "Where condition" is not required to have group by within the query
*/

-- using where condtion --

-- using having clause condition


/* Exercise: In Transaction table, select data by:
select * from public.trans;

1)  Find numbers country based on pptype:
Select  pptypeid, count(countryID) from public.trans group by pptypeid; 

2)  Based on year, find numbers of country have minium 50 for life expectancy  and gdp has data

Select yearID, pptypeid, count(countryID) 
from public.trans 
where lifeexpectancy >=50 and gdp is not null
group by pptypeid, yearID
having pptypeid = 1
order by yearID, pptypeid
; 

*/


/* ============================ Common function*/
-- Change type of data with Cast and convert--
SELECT CAST(25.65 AS int);


/* Exercise: In region table, test the differences between varchar and int type  :
# orginal int type for regionid
select * from public.region where regionid >= 3;

# convert regionid to varchar type
select *,CAST(regionid AS varchar) as text_regionid from public.region where  CAST(regionid AS varchar)  >= 3;
*/

/* Date/time function */
-- Identify current date and time --
Select CURRENT_DATE;


/* Add a certain date time interval:
- day: add new day(s) to original day
- month: add new month(s) to original month
- year: add new year(s) to original year
*/

Select * from public.year;

-- Add dates to a single daete element like current date 


-- Add more datetime  to existing datetime columns in a table

-- Differences between two datetime points by part of a string--


-- How to find number of different date between two point of time --


-- Convert from string to date format




/* ============================ Working with string functions:
- Concat strings
- Trim space
- substring(string [from <str_pos>] [for <ext_char>])
- POSITION(search_string in main_string) 

select * from public.region;
*/ 

;

/* ---- Working with Mathematical Expressions and Functions
- we can use mathematical expression directly in selection query
- built-in functions like count, min, max , etc. require Group by to run
select * from public.trans;

*/


/* ============================ Working with Mathematical Functions
 -Mathematically function requires Group By to make calculation
 */


/* Exercise: In Transaction table, return data with calculation as::

1)  Difference between max and min of GPD by year and filter only year having minium difference is 50000:
Select YearID,
max(gdp) as Max_GDP,
min(gdp) as Min_GDP,
max(gdp) - min(gdp) as GDP_Diff
from public.trans
group by YearID
having max(gdp) - min(gdp) >= 50000
order by YearId; 
*/


/*  =================== Case When
Case-when is a conditional function. It is used when we want create new labels for values
  
select * from public.incomegroup;
*/



/* =================== Union vs Join
- JOIN combines data from multiple different tables, whereas UNION combines data from multiple similar tables.
- JOIN appends the output horizontally, whereas UNION combines the result
*/

/* ============================ Select data from multiple tables with join
In Join function:
- a table can join not only others table but also itselft
- tables are joined by pairs and by multiple keys.
*/


/*Alias for attributes and tables
It is inefficiency when we re-write out table phrase again and again. Mistakes, errors can be happend and it is hard to read or revise the codes. 
A solution is that we can set abbreviation/ alias for  used table.
- easiness to select columns form different table
- Avoid select duplicated columns form different tables
- easiness to read code
*/


/* Exercise: In Transaction table, join all tables to create an information dataset :

select tbl5.yearname,
tbl2.cntname, 
tbl3_1.regname,
tbl3_2.igname, 
tbl4.pptypename,
tbl1.gdp,
tbl1.lifeexpectancy,
tbl1.ppnumber
--*-- 
from public.trans tbl1 left join public.country tbl2
on tbl1.CountryID =  tbl2.CountryID
left join public.pptype tbl4
on tbl1.pptypeid = tbl4.pptypeid
left join public.year tbl5
on tbl1.yearid = tbl5.yearid
left join public.region tbl3_1
on tbl2.regionid = tbl3_1.regionid
left join public.IncomeGroup tbl3_2
on tbl2.igid = tbl3_2.igid
;

*/


/* ============================ Combine data by using  Union 
- Union: combine same columns between databasets only
- Union All: combine all columns between datasets
*/


-- ############################ SWITH TO MSSQL SERVER ======================= --
-- MSSQL SERVER--
/*
In PostGreSQL Server, we can join tables within a schema of a database only while in MSSQL Server we can join  multiple tables from different schemas and databases
*/


-- ======================================================================================================= --
/*Access to single tabales in each Database and Schema*/
Use StockDB_Main;
select * from price_hist.host;

Use StockDB_Add;
select * from order_hist.buyorder;
select * from trans_frg.fbuy;

/*Access to different tables in different databases and schemas*/
select * from StockDB_Main.price_hist.host;
select * from StockDB_Add.order_hist.buyorder;
select * from StockDB_Add.trans_frg.fbuy;

/*Inter-databases queries*/

--select * from StockDB_Add.trans_frg.ftrans;--



-- ======================================================================================================= --
/*Hơmework*/
-- Theory --
/*What are different betwwen Cast() and Convert(), please provide some example*/

-- Working with MSSQL database--
Use StockDB_Main;
select * from StockDB_Main.price_hist.stock;
select * from StockDB_Main.price_hist.host;
select * from StockDB_Main.price_hist.reference;
select * from StockDB_Main.price_hist.match;
select * from StockDB_Main.price_hist.trans;

-- 1) For each host, what are stocks listed? How many stock listed within? --
--1.1 --
select distinct 
tbl1.scode,
tbl2.hostname
from StockDB_Main.price_hist.stock tbl1
left join StockDB_Main.price_hist.host tbl2
on tbl1.hostid = tbl2.HostID; 

--1.2 --
select
tbl2.hostname,
count(tbl1.scode)
from StockDB_Main.price_hist.stock tbl1
left join StockDB_Main.price_hist.host tbl2
on tbl1.hostid = tbl2.HostID
Group by tbl2.hostname;

-- 2) How many stock having number of characters are 3, 4, 5, etc.? --
select 
len(scode) as length_character,
count(len(scode) ) as count_length
from StockDB_Main.price_hist.stock
group by len(scode);

-- 3) What are stocks have started datadate within 6 months upto 31 December 2020? --
select 
tbl1.scode,
min(tbl2.dataDate) as First_datadate
from StockDB_Main.price_hist.stock tbl1 right join
StockDB_Main.price_hist.trans tbl2
on tbl1.StockID  = tbl2.StockID
group by tbl1.scode
having min(tbl2.dataDate)  >= '2020-06-01' ;
--!!! A more advance method: the period of 6 months can be calculated back --

-- 4) What are stocks having  number within their codename? --
select 
tbl1.scode
from StockDB_Main.price_hist.stock tbl1
where tbl1.scode like '%[0-9]%';

-- 5) What are RefID having Average Price less than Reference Price but Differences are 0
select 
refid,
avgprice,
cast(left(difference,5)as numeric) as Diffs,
refprice
from StockDB_Main.price_hist.reference
where AvgPrice < RefPrice and cast(left(difference,5)as decimal) = 0 
;

-- 6) Split "Difference" into single columns of number and percentage (keep percentage information in string format)
select *, 
SUBSTRING( Difference,1,CHARINDEX(' ', Difference)) as Numeric_diff, 
SUBSTRING( Difference,CHARINDEX(' ', Difference)+1,5) as percentage_diff
from StockDB_Main.price_hist.reference;

-- 7) Find min of difference when Average Price is equal to RefPrice
select Avgprice, refprice,
min(cast(left(difference,5)as decimal)) as min_diff
from StockDB_Main.price_hist.reference
where Avgprice = refprice
group by Avgprice, refprice;


-- 8) In stock table, create a new column which are combined of stock code and host name, for example: 'HOSE-AAA'
select 
cast(tbl2.HostName as varchar) + '-' + cast(tbl1.Scode as varchar) as host_and_stock 
from StockDB_Main.price_hist.stock tbl1 left join
StockDB_Main.price_hist.host tbl2
on tbl1.HostID = tbl2.HostID
; 

-- 9) Create a summary table to present full information of trading transations from all tables in StockDB_Main database
select tbl5.HostName,
tbl2.Scode, 
tbl3.AvgPrice,
tbl3.Difference, 
tbl3.RefPrice,
tbl4.MatchedValue, 
tbl4.MatchedVol
from StockDB_Main.price_hist.trans tbl1 left join StockDB_Main.price_hist.stock tbl2
on tbl1.stockid = tbl2.StockID
left join StockDB_Main.price_hist.reference tbl3
on tbl1.RefID = tbl3.RefID
left join StockDB_Main.price_hist.match tbl4
on tbl1.MatchedID = tbl4.MatchedID
left join StockDB_Main.price_hist.host tbl5
on tbl2.HostID = tbl5.HostID
;

-- 10) Find the minimum matched volumn of each stockcode
select tbl2.scode,
min(tbl3.Matchedvol) as min_matched_vol
from StockDB_Main.price_hist.trans tbl1 left join StockDB_Main.price_hist.stock tbl2
on tbl1.stockid = tbl2.StockID
left join StockDB_Main.price_hist.match tbl3
on tbl1.MatchedID = tbl3.MatchedID
group by tbl2.scode
;

-- 11) Find average of each Matched transaction. Then, round the result with 2 deceimal number, marking average into  different groups with range like 1) 0 - 100, 101 - 500, and more than 500 times
-- Option 1 --
select 
matchedID,
case
    when MatchedVol != 0 then cast(round(MatchedValue/MatchedVol,2) as numeric(36,2))
    else null end as Average_price,
case 
    when MatchedVol != 0 and cast(round(MatchedValue/MatchedVol,2) as numeric(36,2)) <= 101 then '0 - 100'
    when MatchedVol != 0 and (cast(round(MatchedValue/MatchedVol,2) as numeric(36,2)) > 101 and cast(round(MatchedValue/MatchedVol,2) as numeric(36,2)) <= 500 ) then '101 - 500'
    when MatchedVol != 0 and cast(round(MatchedValue/MatchedVol,2) as numeric(36,2)) > 500 then 'more than 500'
    else 'Not Classified' end as Classified_group
from StockDB_Main.price_hist.match;

-- Option 2  nested case--
select 
matchedID,
case
    when MatchedVol != 0 then cast(round(MatchedValue/MatchedVol,2) as numeric(36,2))
    else null end as Average_price,
case 
    when MatchedVol != 0 then
        case 
            when cast(round(MatchedValue/MatchedVol,2) as numeric(36,2)) <= 101 then '0 - 100'
            when  (cast(round(MatchedValue/MatchedVol,2) as numeric(36,2)) > 101 and cast(round(MatchedValue/MatchedVol,2) as numeric(36,2)) <= 500 ) then '101 - 500'
            else 'more than 500' end 
    else 'Not Classified' end as Classified_group
from StockDB_Main.price_hist.match;






 
