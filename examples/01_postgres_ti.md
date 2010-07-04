!SLIDE setion_title transistion=fade

# Example #


!SLIDE top

	@@@ sql
	CREATE TABLE "products" (
	  id SERIAL,
	  name VARCHAR(100)
	);


!SLIDE top

	@@@ sql
	CREATE TABLE "products" (
	  id SERIAL,
	  name VARCHAR(100)
	);

	CREATE TABLE "poster" (
	  size VARCHAR(100)
	) INHERITS("products");


!SLIDE top

	@@@ sql
	CREATE TABLE "products" (
	  id SERIAL,
	  name VARCHAR(100)
	);

	CREATE TABLE "poster" (
	  size VARCHAR(100)
	) INHERITS("products");

	CREATE TABLE "mp3" (
	  duration INTEGER,
	  genre VARCHAR(100)
	) INHERITS("products");


!SLIDE bullets incremental

# what did that do?

* created three tables
* created one sequence (implicitly)


!SLIDE top

# lets create some entries #

	@@@ sql
	INSERT INTO products_print
	  (name, size)
	VALUES
	  ("GitHub Community", "A-1")

	INSERT INTO products_music
	  (name, duration, genre)
	VALUES
	  ("The Changelog 0.2.8", 1284 , "Podcast"),
	  ("Episode 164:", 2831 , "Podcast")


!SLIDE top

	@@@ sql
	SELECT count(*) AS anzahl FROM products;


!SLIDE top

	@@@ sql
	SELECT count(*) AS anzahl FROM products;

	anzahl
	------
	     3


!SLIDE top

	@@@ sql
	SELECT count(*) FROM ONLY products;


!SLIDE top

	@@@ sql
	SELECT count(*) FROM ONLY products;

	anzahl
	------
	     0

!SLIDE top

	\d music

	  Column  |          Type
	----------+------------------------
	 id       | integer
	 name     | character varying(100)
	 duration | integer
	 genre    | character varying(100)

	  Column  | Modifiers
	----------+-------------------------------------------------------
	 id       | not null default nextval('products_id_seq'::regclass)
	Inherits: products

