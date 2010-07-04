!SLIDE transition=fade

!SLIDE section_title transition=fade

# Features #


!SLIDE bullets incremental

# Features #

* transactions (also for structural changes)
* foreign keys and constraints
* sequences (a.k.a. SERIAL)
* rule system (updateable views)
* table inheritance


!SLIDE bullets incremental

# Transactions #

* Atomic, Consitent, Isolated, Durable
* also for structural changes
* => no more half-run migrations

!SLIDE bullets incremental

# Constraints #
### if your DB is not just a dump datastore ###

* foreign keys and CHECKs
* Checks can be functions or queries
* => integrity and consistency
* some constraints require indices
* => performance gain


!SLIDE bullets incremental

# Sequences #

* just a list of numbers
* independent of tables
* no magical `AUTO_INCREMENT`
* default value is the next sequence value
* mapping happens implicetly with SERIAL type


!SLIDE bullets incremental

# The Rule System #

* things to do ALSO or INSTEAD of a query
* INSTEAD: delegate updates to another table
* ALSO: copy a deleted row to an archive table
* you can use that for updateable views
* Rules are like stored procedures


!SLIDE bullets incremental

# Table Inheritance #

* common fields in a table<br />
  (e.g. products)
* specialized fields in a child table<br />
  (e.g. posters, mp3s)
* another example
* `class Capital < City; end`


!SLIDE bullets incremental

## There is more ##
* in the docs
* [www.postgresql.org/docs](http://www.postgresql.org/docs/8.4/interactive/index.html)

