# Lesson 4:  Extract, Transform, and Load (ETL) process for MSSQL Server

You know how to get data from databases, great. Now, think about working data from different sources like excel file, txt file, etc.  Simply, we can import data to our data server  then we query them as normal. They are different methods to import data file to data servers, the most comprehensive and complicated method is Integration Service (e.g. SSIS in MSSQL Server). 

Note:<br>
- To build a SSIS process working with MSSQL Server, we need to install some additional components:
- Intergration Service Server
- Visual Studio (Community Version)

__Table of content__<br>
[Different tools for importing data file](#compare)<br>
[Generate proper type of files for Vietnamese](#filetype)<br>
[By Import Winzar](#bywinzar)<br>
[By Skyvia](#skypia)<br>
[By MSSQL Mangement studtio](#mssqlms)<br>
[By ETL of Interegration Service](#byETL)<br>

### <a name="compare"/> Different tools for importing data file
When working with a database, we may need to use external data files like excel, txt, etc. or backup files. Normally, client tools  like Azure Data Studio, MSSQL Management Studio, etc. allow user to directly import data file to databases.<br>

|Tool|Server/ Database Type|Note| pre-built table|Limitation|
|-------|-------|-------|-------|-------|
|SQL Import Winzar in ADS|MSSQL|- Simple<br> - Directly import file to database <br> | - Not required|- Work with .txt only <br> - Limit functions to modify data <br> - One file for each time|
|Skyvia|MSSQL, Postgresql, Mysql, etc.|- A simple online tool<br> - Directly import multiple files to databases or from a database to other databases <br> - Can be run by schedule<br>|- Required|- Work with CSV type only<br>|
|Task import in MSSQL|MSSQL only|- Built-in function and simple<br> | - Not required| - One file for each time|
|SSIS- Integration tool|MSSQL, excel file,v.v.|- Complex but full functions<br> - Easiness to interact with GUI <br> - Can be run by schedule| - Not required| -  Can be used in Window only<br> - Need to install additional tools|


### <a name="filetype"/> Generate proper type of files for Vietnamese
In file, data's font can be written / encoding in different types like unicode, utf-8, ascif, etc. A font type may be displayed normally in a database/  file but it may be shown as unknown symbols in other databases/ data files. For example, in data file: "đấy là một ví dụ", in other data file:  "dây l? m?t v? d?". Thís type of issue is common when data is recorded in Vietnamese because we have tone marked and diacritical markes. <br>

<img width="671" src="https://user-images.githubusercontent.com/19366516/121715967-acd95300-cb09-11eb-8c55-8cfe83fc1a96.png">


To solve incorrent font type, we can change data font by: <br>
- Bult-in function when importing data, or
- Save data file to unicode format like .txt, .csv

|File type|Windows|MacOS|
|-------|-------|-------|
|from __.xlsx__ to __.csv__|<img width="400" src="https://user-images.githubusercontent.com/19366516/121794592-c5458c80-cc33-11eb-80d6-bcc8dbeefc36.png"><br>csv UTF-8|<img width="400" src="https://user-images.githubusercontent.com/19366516/121714683-499af100-cb08-11eb-87ef-bc7e4a75d2ba.png"><br>csv UTF-8|
|from __.xlsx__ to __.txt__|<img width="400" src="https://user-images.githubusercontent.com/19366516/121794623-135a9000-cc34-11eb-817e-79294e25c345.png"><br>Unicode text|<img width="400" src="https://user-images.githubusercontent.com/19366516/121714948-8d8df600-cb08-11eb-8650-7e6b78806c29.png"><br>UTF-16 Unicode Text (.txt)|

### Import data from files to databases
<a name="bywinzar"/> __I)  By Import Winzar Using __Azure Data Studio__ <br>__
__Import winzar__ is an extension in Azure Data Studio to import CSV file to MSSQL server.

1) After login to a dataserver, right click to a database and chose  import winzard<br>

<img width="300" src="https://user-images.githubusercontent.com/19366516/121531192-63fd9d80-ca28-11eb-9519-1bf5b8f659cd.png">

2) Input required fields like database, location, table name, table schema <br>

<img width="300" src="https://user-images.githubusercontent.com/19366516/121531330-82fc2f80-ca28-11eb-87c5-58c6418d7f3b.png">

- Chose import files:
<img width="800" src="https://user-images.githubusercontent.com/19366516/121536160-03bd2a80-ca2d-11eb-9cee-d1540cae2b73.png">

- If not using __.txt__ file
<img width="800" src="https://user-images.githubusercontent.com/19366516/121531606-c8206180-ca28-11eb-882b-e15b21f65059.png">

- If using __.txt__file
<img width="800" src="https://user-images.githubusercontent.com/19366516/121536351-2ea77e80-ca2d-11eb-9c1b-9f29f7cfb838.png">

3) Modify basic properties of columns<br>

<img width="800" src="https://user-images.githubusercontent.com/19366516/121536400-38c97d00-ca2d-11eb-8602-724699ba996d.png">

4) Finish the importing process
<img width="800" src="https://user-images.githubusercontent.com/19366516/121536438-4121b800-ca2d-11eb-8497-afa3a14ea994.png">

<a name="skypia"/> __II)  Using  __Skyvia__ <br>__
Skyvia is the all-in-one cloud data platform for no coding data integration, cloud to cloud backup, management via SQL and data access via OData interface. <br>
1) Create  an empty table with same number of columns in data field
```roomsql
Create table  company (
Scode varchar(10),
Comany_name text.
Host text,
LstDate date,
industry text 
);
```

2) Login to Skyvia in https://skyvia.com/

3) Chose "NEW" > "INTEGRATION" > "Import"
<img width="700" src="https://user-images.githubusercontent.com/19366516/121794640-3dac4d80-cc34-11eb-891c-c432cdb0db4f.PNG">

4) Chose required files<br>
- Source type: CSV
- Target: your database to be imported data 
<img width="700" src="https://user-images.githubusercontent.com/19366516/121794667-7a784480-cc34-11eb-9daf-5ab211b1d3e2.PNG">
 
- Task: add new

  Source Destination: <br>   
    + Source CSV: local your file to import <br>
    + Change other properties like column types, etc. if it is needed <br>
<img width="700" src="https://user-images.githubusercontent.com/19366516/121794682-91b73200-cc34-11eb-86b4-6acb3569ae79.PNG">
  Target Destination: <br>
    + Target: chose created table from step 1
  <img width="700" src="https://user-images.githubusercontent.com/19366516/121794721-de027200-cc34-11eb-87cd-d96c0f002a38.PNG">

  Mapping Destination <br>
    + Mapping columns between imported file and created table's columns
    <img width="700" src="https://user-images.githubusercontent.com/19366516/121794723-e3f85300-cc34-11eb-96ec-cf9e7afc9c8d.PNG">
    
5) Create task <br>
   <img width="700" src="https://user-images.githubusercontent.com/19366516/121794727-e8247080-cc34-11eb-9d99-cefd4f0dd919.PNG">

6) Run created task
<img width="700" src="https://user-images.githubusercontent.com/19366516/121794729-eb1f6100-cc34-11eb-8451-12630d4ea00f.PNG">

<a name="mssqlms"/> __III) Using  __SQL Server Management Studio__ <br>__
1) In SQL Server Management Studio, connect to an instance of the SQL Server Database Engine.
2) Expand Databases.
3) Right-click a database.
4) Point to Tasks.
5) Click one of the following options.
- Import Data/ Import Flat flie
- Export Data

<img width="400" src="https://user-images.githubusercontent.com/19366516/113968679-c0441580-985d-11eb-809e-a2e6b22b270b.png">

6) Choose  a data Souce
- Flat file source
- Excel Source
7) Check whether column is readable or not (because of different in font type)

<img width="400" src="https://user-images.githubusercontent.com/19366516/113980542-d0192500-9870-11eb-9a72-69c7505b17a9.png">

8) Choose a Destination (connection to database)

<img width="400" src="https://user-images.githubusercontent.com/19366516/113980511-c2fc3600-9870-11eb-9689-588131701243.png">

9) Finish process by keeping next until the end

Reference:<br>
- https://docs.microsoft.com/en-us/sql/integration-services/import-export-data/start-the-sql-server-import-and-export-wizard?view=sql-server-ver15

<a name="byETL"/> __IV)  By ETL of Interegration Service__

When using SSIS to perform ETL task, we need to create related tables before doing ETC task. We can create table new table by tradional SQL syntax or within steps of doing SSIS. Working with SSIS is comprehensive and complicated like playing with lego. There is a number of functions in SSIS and you have many approaches to combine such functions to get expected results. <br>

Some basic operation of SSIS include:
- Import data from  Excel file and Flat file (txt)
- Make some basic transformation like de-duplicated row, splits columns to multiple columns
- Dealing with differnt font code (page code) in input and ouput operation
- Import a data to a table
- Import multiple data to a same table

__Note to working step:__<br>
Control flow<br>
![image](https://user-images.githubusercontent.com/19366516/114190699-ca593780-9975-11eb-85cb-e46b46dcafa9.png)

Data flow<br>
![image](https://user-images.githubusercontent.com/19366516/114190784-e4931580-9975-11eb-9b6e-b89ecfd59ebe.png)


![image](https://user-images.githubusercontent.com/19366516/114178008-52841080-9967-11eb-9f4c-07d6a5349374.png)
- Green arrow: direction of a successful operation
- Blue arrow: direction of completed operation
- Red arrow: direction of error operation

Common Error code:

The requested OLE DB provider Microsoft.ACE.OLEDB.12.0 is not registered. If the 64-bit driver is not installed, run the package in 32-bit mode. Error code: 0x00000000.
Solution<br>
- choose properties by right click to SSIS package name in Solution Explore pannel
- change Run64BitRuntime from True to __False__
![image](https://user-images.githubusercontent.com/19366516/114186694-5b79df80-9971-11eb-9c42-e0bad58dd171.png)


Input source<br>
![image](https://user-images.githubusercontent.com/19366516/114180065-ef47ad80-9969-11eb-9f54-fecfce2848e2.png)


Transform operation<br>
![image](https://user-images.githubusercontent.com/19366516/114179841-b60f3d80-9969-11eb-878a-bc62e6921f2f.png)

Output source<br>
![image](https://user-images.githubusercontent.com/19366516/114179914-caebd100-9969-11eb-93eb-05d450acbd24.png)


### By  Transact-SQL query
Import data directly into SQL Server from Excel files by using the Transact-SQL OPENROWSET or OPENDATASOURCE function. This usage is called a distributed query.<br>

Reference:<br>
- https://docs.microsoft.com/en-us/sql/relational-databases/import-export/import-data-from-excel-to-sql?view=sql-server-ver15
