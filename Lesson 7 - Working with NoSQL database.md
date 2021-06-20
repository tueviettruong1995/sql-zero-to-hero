# Lesson 8:  Working with NoSQL Database

You are familiar with structure data and relational database. Now, we extend our understanding with Unstructured data and and Not-only SQL database (MongoDB).


__Table of content__<br>
[Introduction to MongoDB](#intro)<br>
[Working with MongoDB](#wokring)<br>


Note:<br>
- Download and install component for MongoDB:
![image](https://user-images.githubusercontent.com/19366516/114291220-db0dc880-9aaf-11eb-9daf-d6dbf9a1720f.png)

+ Mongodb Server: https://www.mongodb.com/try/download/community
+ Mongidb GUI:
+    Studio 3T
+    MongoDB Compass
+    Robo 3T (used for this lecture)
+    Mongo Management Studio

Reference: <br>
https://dzone.com/articles/which-is-the-best-mongodb-gui-2019-update


### <a name="intro"/> Introduction to MongoDB

- Allows storing programmatic models close to how they are modeled
- Stores data as is (instead of rows of tables)
- Optimizes schema based on how your application will access the data (no need to define the schema), just drop in documents
- Does not need same fields for every document within one collection
- Uses embedding and linking instead of joins
- Transactions do not exist
- Needs to index data still


#### Compare between SQL terms and MongoDB term
![image](https://user-images.githubusercontent.com/19366516/114291237-f8db2d80-9aaf-11eb-849c-0eb529a2b902.png)

Note: <br>
- show dbs: Display a list of all databases
- use db_name: Switch to a new database (even if it doesn’t exist)
- db: Show the current database
- to comment a line in MongoDB // or multiple lines: /* */

### <a name="wokring"/> Working with MongoDB
#### Create component of a MongoDB
|No|Item|MongoDB|SQL|
|--------------|--------------|--------------|--------------|
1| Creating and Connecting to a Database|Database is created after inserting data| Create Database database_name|
2| Creating a Collection|db.createCollection('collection_name')| CREATE TABLE table_name ()
2.1|Renaming Collections|db.collection_name.renameCollection('newCollection')|ALTER TABLE table_name; RENAME TO new_table_name;
2.2|Delete Collection|db.collecetion.drop()| Drop table table_name|
3|Inserting Documents Into a Collection|db.collection.insert({_id:n,"field":"value"})|INSERT INTO table_name (column_id, col) VALUES(n, "value");
4|Create Index|db.collection.ensureIndex({"field":[1 or -1]})|CREATE INDEX index_name ON table_name (column);
5|Delete Database|db.dropDatabase()||


#### Select, Delete and Update components of MongoDB
|No|Item|MongoDB|SQL|
|--------------|--------------|--------------|--------------|
1| Selecting Documents|db.collection_name.find()|SELECT * FROM table_name;|
1.1| Selecting Specific Fields| db.collection_name.find({},{"field":1})|SELECT column1, column2 FROM table_name;|
1.2| Selecting Using Selectors (WHERE clause in SQL)|db.collection_name.find({"field":"value"})|SELECT * FROM table_name WHERE condition = criteria;|
1.3| Selecting Documents Using Conditional Operators|db.collection.find({field: {$gte: value}})|SELECT * FROM table_name WHERE column_name >= criteria;|
1.4| Selecting Documents Using Wildcards|db.collection_name.find({field: {$gte: value}})|SELECT * FROM table_name WHERE column_name >= criteria;|
1.5| Selecting Documents Using Multiple Criteria|db.collection.find({"field":"value", $or:[{"field2":{$gt:n}, {"field2":{$lt:n}]})|SELECT * FROM table_name WHERE column1 = criteria AND (column2 = criteria_2 OR column2 = criteria_3);|
1.6|Selecting Unique Documents|db.collection_name.distinct("field")|SELECT DISTINCT column_name FROM table_name;|
2|Counting Documents|db.collection.count({})|SELECT Count(*) FROM table_name;|
2.1|Count with condition|db.collection.find({}).count()||
3|Sorting Documents|db.collection.find({}).sort({field: [1 or -1]})|SELECT * FROM table_name ORDER BY column_name;|
4|Limiting Documents| db.collection_name.find().limit(n).skip(n)|SELECT * FROM table_name LIMIT n SKIP n|
5|Grouping Documents|db.collection.aggregate({$group:{_id:{"fieldAlias":"$field"}, opAlias:{$operator:"$field2"}}}) |SELECT column, Sum(column2) AS alias FROM table_name GROUP BY column;|
6|Updating Documents| db.collection.update({}, {$set: {field: 'value'}}, {multi: true}) |UPDATE table_name SET column_name = value WHERE condition;|
7|Deleting Documents|db.collection.remove({"field":"value"})|DELETE FROM table_name WHERE condition;|


Note:<br>
- Conditional Operators

|Operator|Meaning|
|--------------|--------------|
|$lt|	value must be less than the conditional|
|$gt|	value must be greater than the conditional|
|$lte|	value must be less than or equal to the conditional|
|$gte|	value must be greater than or equal to the conditional|
|$in|	value must be in a set of conditionals|
|$nin|	value must NOT be in a set of conditionals|
|$ne|	value must NOT be equal to a conditional|
|$nor|	value must NOT equal any of the conditionals|
|$exists|	returns documents where values exist for a field if true|

- Grouping condinator

|Operator|Meaning|
|--------------|--------------|
|$sum| Returns sum for each group. Ignores non-numeric values.|
|$avg| Returns average for each group. Ignores non-numeric values.|
|$max| Returns highest expression value for each group.|
|$min| Returns lowest expression value for each group.|


- Updating operator
|Operator|Meaning|
|--------------|--------------|
|$set| Updates only the criteria specified, without set update will replace ALL fields|
|$inc| Increments (decrements) the indicated field|
|{multi: true}|	Updates all documents where the condition is met	|
|{upsert: true}| Inserts a new document if no document is found|
