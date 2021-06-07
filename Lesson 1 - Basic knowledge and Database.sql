
-- POSTGRE SQL --
-- Lesson 1 - Database Development
-- ======================================================================================================= --
/* ================== Create single table without primary key =====================*/ --
-- Regional table --
CREATE TABLE  IF NOT EXISTS public.region (

);

-- Income Group --
CREATE TABLE  IF NOT EXISTS public.IncomeGroup (

);

-- YearID --
CREATE TABLE  IF NOT EXISTS public.year (

);

-- PPType -- 
CREATE TABLE  IF NOT EXISTS public.PPType (

);

-- Country --
CREATE TABLE  IF NOT EXISTS public.country (

);

-- Transaction-- 
CREATE TABLE  IF NOT EXISTS public.Trans ( 

);


/* ================== Create single table with primary key=================*/
-- Option 1: Alter table by adding Parimary Key --



-- Option 2: Drop table and re-create table with Primary key --


-- Regional table --
CREATE TABLE  IF NOT EXISTS public.region (



-- Income Group --
CREATE TABLE  IF NOT EXISTS public.IncomeGroup (

-- YearID --
CREATE TABLE  IF NOT EXISTS public.year (

-- PPType -- 
CREATE TABLE  IF NOT EXISTS public.PPType (

-- Country --
CREATE TABLE  IF NOT EXISTS public.country (

-- Transaction-- 
CREATE TABLE  IF NOT EXISTS public.Trans ( 


/* ================== Modify table by adding and subtracting columns =================*/
-- Add new columns --


-- Change datatype --


-- Drop existing columns --



/* ================== Linked between tables by Primary and Foregin keys =================*/
Alter table public.Country ADD FOREIGN KEY (RegionID) REFERENCES dbo.Region (RegionID);

/*==================== Insert records to each table ====================*/
insert into public.Region (regname) values ('Latin America & Caribbean');


/*====================  Test table ====================*/
SELECT *  FROM public.Region ;



/*====================  Delete  records in a table ====================*/
Truncate table  public.Region ;

/*====================  Delete table having relationship ====================*/
Drop table if exists public.Trans; -- => Return error -- 

-- Drop constaint first --
ALTER TABLE public.Region DROP CONSTRAINT PK_RegionID;


-- then drop table --
Drop table if exists public.region;

