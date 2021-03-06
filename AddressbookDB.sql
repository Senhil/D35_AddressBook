# UC1
mysql> create Database Address_Book_Service
show databases;
USE Address_Book_Service;

#UC2
mysql> CREATE TABLE  addressBook(firstName varchar(50) NOT NULL, lastName varchar(50) NOT NULL, mobileNumber varchar(20) NOT NULL,email varchar(50) NOT NULL, city varchar(50) NOT NULL, state varchar(50) NOT NULL,
    ->  zip long NOT NULL, PRIMARY KEY(firstName));
Query OK, 0 rows affected (0.06 sec)

mysql> describe addressBook;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| firstName    | varchar(50) | NO   | PRI | NULL    |       |
| lastName     | varchar(50) | NO   |     | NULL    |       |
| mobileNumber | varchar(20) | NO   |     | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
| city         | varchar(50) | NO   |     | NULL    |       |
| state        | varchar(50) | NO   |     | NULL    |       |
| zip          | mediumtext  | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)
#UC3
mysql> INSERT INTO addressBook(firstName,lastName,mobileNumber,email,city,state,zip) VALUES('Piyush','Verma','9910936991','piyush@gmail','Faridabad','haryana',121001),('Pankaj','verma','9876566569','abc@gmail','Faridabad','Haryana',121001),('Ramit','Chauhan','9987676554','xyz@gmail','Noida','UP',121998);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+--------------+--------------+-----------+---------+--------+
| firstName | lastName | mobileNumber | email        | city      | state   | zip    |
+-----------+----------+--------------+--------------+-----------+---------+--------+
| Pankaj    | verma    | 9876566569   | abc@gmail    | Faridabad | Haryana | 121001 |
| Piyush    | Verma    | 9910936991   | piyush@gmail | Faridabad | haryana | 121001 |
| Ramit     | Chauhan  | 9987676554   | xyz@gmail    | Noida     | UP      | 121998 |
+-----------+----------+--------------+--------------+-----------+---------+--------+
3 rows in set (0.00 sec)
#UC4
mysql> UPDATE addressBook set MobileNumber="9910936991" where FirstName = 'Pankaj';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook set MobileNumber="121008" where FirstName = 'Pankaj';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook set state="UP" where FirstName = 'Pankaj';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+--------------+--------------+-----------+---------+--------+
| firstName | lastName | mobileNumber | email        | city      | state   | zip    |
+-----------+----------+--------------+--------------+-----------+---------+--------+
| Pankaj    | verma    | 121008       | abc@gmail    | Faridabad | UP      | 121001 |
| Piyush    | Verma    | 9910936991   | piyush@gmail | Faridabad | haryana | 121001 |
| Ramit     | Chauhan  | 9987676554   | xyz@gmail    | Noida     | UP      | 121998 |
+-----------+----------+--------------+--------------+-----------+---------+--------+
3 rows in set (0.00 sec)

mysql> UPDATE addressBook set MobileNumber="9871900840" where FirstName = 'Pankaj';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+--------------+--------------+-----------+---------+--------+
| firstName | lastName | mobileNumber | email        | city      | state   | zip    |
+-----------+----------+--------------+--------------+-----------+---------+--------+
| Pankaj    | verma    | 9871900840   | abc@gmail    | Faridabad | UP      | 121001 |
| Piyush    | Verma    | 9910936991   | piyush@gmail | Faridabad | haryana | 121001 |
| Ramit     | Chauhan  | 9987676554   | xyz@gmail    | Noida     | UP      | 121998 |
+-----------+----------+--------------+--------------+-----------+---------+--------+
3 rows in set (0.00 sec)
#UC5
mysql> DELETE from addressBook where FirstName='Piyush';
Query OK, 1 row affected (0.01 sec)

mysql> select * from addressBook;
+-----------+----------+--------------+-----------+-----------+-------+--------+
| firstName | lastName | mobileNumber | email     | city      | state | zip    |
+-----------+----------+--------------+-----------+-----------+-------+--------+
| Pankaj    | verma    | 9871900840   | abc@gmail | Faridabad | UP    | 121001 |
| Ramit     | Chauhan  | 9987676554   | xyz@gmail | Noida     | UP    | 121998 |
+-----------+----------+--------------+-----------+-----------+-------+--------+
2 rows in set (0.01 sec)
#UC6
mysql> INSERT INTO addressBook(firstName,lastName,mobileNumber,email,city,state,zip) VALUES('Piyush','Verma','9910936991','piyush@gmail','Faridabad','haryana',121001);
Query OK, 1 row affected (0.01 sec)

mysql> select * from addressBook;
+-----------+----------+--------------+--------------+-----------+---------+--------+
| firstName | lastName | mobileNumber | email        | city      | state   | zip    |
+-----------+----------+--------------+--------------+-----------+---------+--------+
| Pankaj    | verma    | 9871900840   | abc@gmail    | Faridabad | UP      | 121001 |
| Piyush    | Verma    | 9910936991   | piyush@gmail | Faridabad | haryana | 121001 |
| Ramit     | Chauhan  | 9987676554   | xyz@gmail    | Noida     | UP      | 121998 |
+-----------+----------+--------------+--------------+-----------+---------+--------+
3 rows in set (0.00 sec)

mysql>  SELECT * from addressBook where city = 'Faridabad';
+-----------+----------+--------------+--------------+-----------+---------+--------+
| firstName | lastName | mobileNumber | email        | city      | state   | zip    |
+-----------+----------+--------------+--------------+-----------+---------+--------+
| Pankaj    | verma    | 9871900840   | abc@gmail    | Faridabad | UP      | 121001 |
| Piyush    | Verma    | 9910936991   | piyush@gmail | Faridabad | haryana | 121001 |
+-----------+----------+--------------+--------------+-----------+---------+--------+
2 rows in set (0.00 sec)

mysql>  SELECT * from addressBook where state ='haryana';
+-----------+----------+--------------+--------------+-----------+---------+--------+
| firstName | lastName | mobileNumber | email        | city      | state   | zip    |
+-----------+----------+--------------+--------------+-----------+---------+--------+
| Piyush    | Verma    | 9910936991   | piyush@gmail | Faridabad | haryana | 121001 |
+-----------+----------+--------------+--------------+-----------+---------+--------+
1 row in set (0.00 sec)
#UC7
mysql> SELECT city,COUNT(city) as count from addressBook group by city;
+-----------+-------+
| city      | count |
+-----------+-------+
| Faridabad |     2 |
| Noida     |     1 |
+-----------+-------+
2 rows in set (0.01 sec)

mysql> SELECT state,COUNT(state) as count from addressBook group by state;
+---------+-------+
| state   | count |
+---------+-------+
| UP      |     2 |
| haryana |     1 |
+---------+-------+
2 rows in set (0.01 sec)
UC8
mysql> SELECT firstName,lastName from addressBook ORDER BY city;
+-----------+----------+
| firstName | lastName |
+-----------+----------+
| Pankaj    | verma    |
| Piyush    | Verma    |
| Ramit     | Chauhan  |
+-----------+----------+
3 rows in set (0.00 sec)
UC9
mysql> alter table addressBook add type varchar(15) after lastName ;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc addressBook;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| firstName    | varchar(50) | NO   | PRI | NULL    |       |
| lastName     | varchar(50) | NO   |     | NULL    |       |
| type         | varchar(15) | YES  |     | NULL    |       |
| mobileNumber | varchar(20) | NO   |     | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
| city         | varchar(50) | NO   |     | NULL    |       |
| state        | varchar(50) | NO   |     | NULL    |       |
| zip          | mediumtext  | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> update addressBook set type = 'Family' where firstName ='Piyush';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  update addressBook set type = 'Student' where firstName='pankaj';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressBook set type = 'Friend' where firstName='Ramit';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+---------+--------------+--------------+-----------+---------+--------+
| firstName | lastName | type    | mobileNumber | email        | city      | state   | zip    |
+-----------+----------+---------+--------------+--------------+-----------+---------+--------+
| Pankaj    | verma    | Student | 9871900840   | abc@gmail    | Faridabad | UP      | 121001 |
| Piyush    | Verma    | Family  | 9910936991   | piyush@gmail | Faridabad | haryana | 121001 |
| Ramit     | Chauhan  | Friend  | 9987676554   | xyz@gmail    | Noida     | UP      | 121998 |
+-----------+----------+---------+--------------+--------------+-----------+---------+--------+
3 rows in set (0.01 sec)

mysql> select type, Count(type) from addressBook group by type;
+---------+-------------+
| type    | Count(type) |
+---------+-------------+
| Student |           1 |
| Family  |           1 |
| Friend  |           1 |
+---------+-------------+
3 rows in set (0.00 sec)
mysql> INSERT INTO addressBook(firstName,lastName,type,mobileNumber,email,city,state,zip) VALUES('Nikhil','Bhatia','Friend','9717714997','nikhil@gmail.com','Haryana','Ambala',121000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO addressBook(firstName,lastName,type,mobileNumber,email,city,state,zip) VALUES('Manisha','Verma','Family','931176564','manu@gmail.com','Haryana','Ambala',121000);
Query OK, 1 row affected (0.02 sec)

mysql> select * from addressBook;
+-----------+----------+---------+--------------+------------------+-----------+---------+--------+
| firstName | lastName | type    | mobileNumber | email            | city      | state   | zip    |
+-----------+----------+---------+--------------+------------------+-----------+---------+--------+
| Manisha   | Verma    | Family  | 931176564    | manu@gmail.com   | Haryana   | Ambala  | 121000 |
| Nikhil    | Bhatia   | Friend  | 9717714997   | nikhil@gmail.com | Haryana   | Ambala  | 121000 |
| Pankaj    | verma    | Student | 9871900840   | abc@gmail        | Faridabad | UP      | 121001 |
| Piyush    | Verma    | Family  | 9910936991   | piyush@gmail     | Faridabad | haryana | 121001 |
| Ramit     | Chauhan  | Friend  | 9987676554   | xyz@gmail        | Noida     | UP      | 121998 |
+-----------+----------+---------+--------------+------------------+-----------+---------+--------+
5 rows in set (0.00 sec)
mysql> CREATE TABLE  contacts(firstName varchar(50) NOT NULL, lastName varchar(50) NOT NULL,mobileNumber varchar(20) NOT NULL,email varchar(50) NOT NULL, PRIMARY KEY(firstName));
Query OK, 0 rows affected (0.09 sec)

mysql> desc contacts;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| firstName    | varchar(50) | NO   | PRI | NULL    |       |
| lastName     | varchar(50) | NO   |     | NULL    |       |
| mobileNumber | varchar(20) | NO   |     | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table address(zip varchar(10) not null,city varchar(50) not null,state varchar(50) not null,primary key(zip));
Query OK, 0 rows affected (0.08 sec)

mysql> desc address;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| zip   | varchar(10) | NO   | PRI | NULL    |       |
| city  | varchar(50) | NO   |     | NULL    |       |
| state | varchar(50) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> create table contacts_address(firstname varchar(20) not null,zip varchar(6) not null,foreign key (firstname) references contacts(firstname),foreign key (zip) references address(zip));
Query OK, 0 rows affected (0.16 sec)

mysql> desc contacts_address;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstname | varchar(20) | NO   | MUL | NULL    |       |
| zip       | varchar(6)  | NO   | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table relations (type varchar(20),primary key(type));
Query OK, 0 rows affected (0.08 sec)

mysql> describe relations
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| type  | varchar(20) | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
1 row in set (0.01 sec)

mysql> create table contacts_relation(firstname varchar(20) not null,type varchar(20),foreign key(firstname) references contacts(firstname),foreign key(type) references relations(type));
Query OK, 0 rows affected (0.12 sec)

mysql> desc contacts_relation;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstname | varchar(20) | NO   | MUL | NULL    |       |
| type      | varchar(20) | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into contacts values('Rajiv','Bhardwaj','9876566767','rajiv@gmail.com'),('Anubhav','Bhatia','9999876765','anubhav@gmail.com'),('Piyush','Verma','991936991','piyush@gmail.com'),('Sheetal','Dhiman','9999876754','sheetal@gmail');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from contacts;
+-----------+----------+--------------+-------------------+
| firstName | lastName | mobileNumber | email             |
+-----------+----------+--------------+-------------------+
| Anubhav   | Bhatia   | 9999876765   | anubhav@gmail.com |
| Piyush    | Verma    | 991936991    | piyush@gmail.com  |
| Rajiv     | Bhardwaj | 9876566767   | rajiv@gmail.com   |
| Sheetal   | Dhiman   | 9999876754   | sheetal@gmail     |
+-----------+----------+--------------+-------------------+
4 rows in set (0.01 sec)

mysql> insert into relations values('family'),('friend'),('work');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from relations;
+--------+
| type   |
+--------+
| family |
| friend |
| work   |
+--------+
3 rows in set (0.00 sec)

mysql> insert into address values('121008','faridabad','haryana'),('121002','Delhi','Delhi'),('121000','Faridabad','Haryana');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from address;
+--------+-----------+---------+
| zip    | city      | state   |
+--------+-----------+---------+
| 121000 | Faridabad | Haryana |
| 121002 | Delhi     | Delhi   |
| 121008 | faridabad | haryana |
+--------+-----------+---------+
3 rows in set (0.00 sec)

mysql> insert into contacts_relation values('Anubhav','friend'),('Piyush','family'),('Rajiv','work'),('Sheetal','work');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from contacts_relation;
+-----------+--------+
| firstname | type   |
+-----------+--------+
| Anubhav   | friend |
| Piyush    | family |
| Rajiv     | work   |
| Sheetal   | work   |
+-----------+--------+
4 rows in set (0.00 sec)

mysql> insert into contacts_address values('Anubhav','121000');
Query OK, 1 row affected (0.01 sec)

mysql> insert into contacts_address values('Piyush','121002');
Query OK, 1 row affected (0.02 sec)

mysql> insert into contacts_address values('Rajiv','121008');
Query OK, 1 row affected (0.01 sec)

mysql> insert into contacts_address values('Sheetal','121002');
Query OK, 1 row affected (0.01 sec)

mysql> select * from contacts_address;
+-----------+--------+
| firstname | zip    |
+-----------+--------+
| Anubhav   | 121000 |
| Piyush    | 121002 |
| Rajiv     | 121008 |
| Sheetal   | 121002 |
+-----------+--------+
4 rows in set (0.00 sec)

UC13: Ensure all retrieve queries done especially in UC 6, UC 7, UC 8 and UC 10 are working with new AStable structure
mysql>select count(contacts.firstname) from contacts,contacts_address,address where contacts.firstname = contacts_address.firstname and contacts_address.zip = address.zip and address.state = 'Delhi';
+---------------------------+
| count(contacts.firstname) |
+---------------------------+
|                         2 |
+---------------------------+
1 row in set (0.00 sec)

mysql> select count(contacts.firstname) from contacts,contacts_address,address where contacts.firstname = contacts_address.firstname and contacts_address.zip = address.zip and address.state = 'hryana';
+---------------------------+
| count(contacts.firstname) |
+---------------------------+
|                         0 |
+---------------------------+
1 row in set (0.00 sec)

mysql> select count(contacts.firstname) from contacts,contacts_address,address where contacts.firstname = contacts_address.firstname and contacts_address.zip = address.zip and address.state = 'haryana';
+---------------------------+
| count(contacts.firstname) |
+---------------------------+
|                         2 |
+---------------------------+
1 row in set (0.00 sec)

mysql> select count(contacts.firstname) from contacts,contacts_address,address where contacts.firstname = contacts_address.firstname and contacts_address.zip = address.zip and address.state = 'Haryana';
+---------------------------+
| count(contacts.firstname) |
+---------------------------+
|                         2 |
+---------------------------+
1 row in set (0.00 sec)

mysql> select type, Count(firstName) from contacts_relation group by type;
+--------+------------------+
| type   | Count(firstName) |
+--------+------------------+
| family |                1 |
| friend |                1 |
| work   |                2 |
+--------+------------------+
3 rows in set (0.00 sec)