!SLIDE transition=fade

!SLIDE section_title transition=fade

# Installation #


!SLIDE bullets incremental

# PostgreSQL Server/Client #

## everything you need ##

* basically
* how to get it?


!SLIDE bullets incremental

## installation options ##
* `brew install postgresql`
* `apt-get postgresql-server`
* `configure && make && make install`
* <s>`one click installer`</s>
* even on windows


!SLIDE bullets incremental
.notes put something like 'export PGDATA="datadir"' in your .profile

# Initial Setup #

* initdb
* set PGDATA
* `brew info postgresql`


!SLIDE bullets incremental

# PgAdmin #

## something you *want* ##

* [www.pgadmin.org](http://www.pgadmin.org/download/macosx.php)


!SLIDE bullets incremental

# Ruby bindings #

* `gem install pg`

