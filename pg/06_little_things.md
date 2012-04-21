!SLIDE transition=fade

!SLIDE section_title transition=fade

# nice little things #


!SLIDE bullets incremental

# nice little things #

* understandable error-messages
* double quotes for quoting
* limit and offset as keywords
* tab-completion in `psql`


!SLIDE top

# **error**-message #

	@@@ sql
	CREATE TABLE `something` (
		id imteger primary key auto_increment
	);

---

!SLIDE top

# **error**-message #

	@@@ sql
	CREATE TABLE `something` (
		id imteger primary key auto_increment
	);

---

	ERROR 1064 (42000): You have an error in
	your SQL syntax; check the manual that
	corresponds to your MySQL server version 
	for the right syntax to use near 
	'imteger primary key auto_increment
	)' at line 2


!SLIDE top

# error-**messages** #

	@@@ sql
	CREATE TABLE "MyStuff" (
	  id SERAIL PRIMARY KEY
	);

---


!SLIDE top

# error-**messages** #

	@@@ sql
	CREATE TABLE "MyStuff" (
	  id SERAIL PRIMARY KEY
	);

---

	ERROR:  type "serail" does not exist
	LINE 2: id SERAIL PRIMARY KEY
	           ^

!SLIDE top

# **messages** #

	@@@ sql
	CREATE TABLE "MyStuff" (
	  id SERIAL PRIMARY KEY
	);

---

!SLIDE top

# **messages** #

	@@@ sql
	CREATE TABLE "MyStuff" (
	  id SERIAL PRIMARY KEY
	);

---

	NOTICE:  CREATE TABLE will create implicit
	sequence "MyStuff_id_seq" for serial column
	"MyStuff.id"
	NOTICE:  CREATE TABLE / PRIMARY KEY will
	create implicit index "MyStuff_pkey" for
	table "MyStuff"
	CREATE TABLE


!SLIDE top bullets incremental

# quoting #

* uppercased table- or field-names need to be quoted with double quotes


!SLIDE top bullets incremental

# quoting #

## uppercased table- and field-names need to be quoted with double quotes ##

	@@@ sql
	SELECT "customerId" FROM "ProductList";

* thats both ugly named and properly quoted

* special quoting can hint at field type

* this might happen in an adapter


!SLIDE bullets incremental

# lets just compare #

* Objective:
* get the 10<sup>th</sup> row!


!SLIDE top bullets incremental

# MySQL #

### aka "most popular open-source database" ###

	@@@ sql
	SELECT *
	FROM `MyTable`
	LIMIT 10,1

* that quoting character is pure beauty
* `</irony>`
* popular != good


!SLIDE top bullets incremental

# SQL Server #

### aka "Navision" ###

	@@@ sql
	SELECT TOP 1 *
	FROM (
		SELECT TOP 10 *
		FROM [MyTable]
		ORDER BY [id] DESC
	)

* even uglier than MySQL
* there is no offset available


!SLIDE top bullets incremental

# PostgreSQL #

### aka "most advanced open-source database" ###

	@@@ sql
	SELECT *
	FROM "MyTable"
	LIMIT 1 OFFSET 10

* double quotes!
* `LIMIT n OFFSET m` reads good
