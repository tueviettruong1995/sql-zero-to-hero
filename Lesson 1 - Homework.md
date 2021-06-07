# Lesson 1 - Introduction to SQL
## Homework
###### Question 1:	Answer the following questions based on the figure below:<br>
<img src="https://user-images.githubusercontent.com/19366516/115988370-96237f00-a5e3-11eb-96b5-aab0270a5195.png" alt="L1-Homework1" width= 600 height= 300>

a. Can a disk contain multiple movies? <br>
b. Does an actor have to be in at least one movie? <br>
c. How many disks are part of a rental? <br>
d. Can a customer exist without making a rental? <br>
e. Why is serial number underlined in DISK? <br>
f. What type of attribute is address in the customer entity? <br>
g. What are the cardinalities of the relationship between store and disk? <br>
h. What type of entity is rental, what creates this entity, and where do its attributes come from?<br>

###### Question 2:	Create a textual description of the figure below. Be sure to state the business rules that are captured by this model (e.g. an employee is assigned to one and only one supervisor):<br>
<img src="https://user-images.githubusercontent.com/19366516/115988376-a4719b00-a5e3-11eb-98c3-f8a377f5c08c.png" alt="L1-Homework2" width= 600 height= 300>

###### Question 3: Create a database

A foreign friend has a small business to sell some stuffs to other foreigners living in surrounding area. Now, he starts thininking big like selling to other people in the city.He need your helps to develop a small database to manage his customer data.Connect to the MSSQL Server or PosgreSQL Server using these instructions. Then create SQL statements that would answer the questions below:<br>
(Important: make sure you use the exact same names for tables and attribute to facilitate populating the tables in later steps).<br>
1.	Create the customer table based on the following relation:
```roomsql
CUSTOMER (customer_id, first_name, last_name, phone, email)
```
a.	Customer ID should be of type integer, is the primary key, can't be null, and should auto increment. <br>
b.	First name is a variable character field with a maximum of 25 characters and can’t be null. <br>
c.	Last name is a variable character field with a maximum of 25 characters and can’t be null. <br>
d.	Phone is a fixed character field with a maximum of 12 characters and can't be null. <br>
e.	Email is a variable character field of 100 characters.<br>

2.	Create the item table based on the following relation:
```roomsql
ITEM (item_id, description)
```
a.	Item ID should be of type integer, is the primary key, can't be null, and should auto increment.<br>
b.	Description is a variable character field with a maximum of 255 characters and can’t be null.<br>

3.	Create the invoice table based on the following relation:
```roomsql
INVOICE (invoice_id, date_in, date_out)
```

  a.	Invoice ID should be of type integer, is the primary key, can't be null, and should auto increment.<br>
  b.	Date in is a date field and can't be null.<br>
  c.	Date out is a date field.<br>

4.	Create the invoice item table based on the following relation:<br>

```roomsql
INVOICE_ITEM (invoice_id, item_id, quantity, unit_price)
```

a.	Invoice ID is an integer field and it can't be null.<br>
b.	Item ID is an integer field and it can't be null.<br>
c.	Quantity is a numeric field with a maximum of five characters and it can't be null.<br>
d.	Unit price is a numeric field with a maximum of 8 characters with two after the decimal.<br>

5.	Move unit price to the correct table by (a) adding unit price (i.e. unit_price) to the item table and (b) removing unit price from the invoice item table.<br>
6.	Link each invoice to a single customer by (1) adding customer ID (i.e. customer_id) as an attribute of the invoice table and (2) linking this attribute to the customer table<br>
7.	Change the description column name to item_description in the item table.<br>

8. Insert some records to created tables.

