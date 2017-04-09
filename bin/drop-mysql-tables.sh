#!/bin/bash
# A shell script to delete / drop all tables from MySQL database.
# Usage: ./script user password dbnane
# Usage: ./script user password dbnane server-ip
# Usage: ./script user password dbnane mysql.nixcraft.in
# -------------------------------------------------------------------------
# Copyright (c) 2008 nixCraft project <http://www.cyberciti.biz/fb/>
# This script is licensed under GNU GPL version 2.0 or above
# -------------------------------------------------------------------------
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
# ----------------------------------------------------------------------
# See URL for more info:
# http://www.cyberciti.biz/faq/how-do-i-empty-mysql-database/
# ---------------------------------------------------

MUSER="$1"
MPASS="$2"
MDB="$3"

MHOST="localhost"

[ "$4" != "" ] && MHOST="$4"


if ! hash mysql 2> /dev/null; then
    PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
fi


if ! hash mysql 2> /dev/null; then
    echo "No MySQL Client found."
    exit 1
fi


# Detect paths
MYSQL=$(which mysql)
AWK=$(which awk)
GREP=$(which grep)

# help
if [ ! $# -ge 3 ]
then
	echo "Usage: $0 {MySQL-User-Name} {MySQL-User-Password} {MySQL-Database-Name} [host-name]"
	echo "Drops all tables from a MySQL"
	exit 1
fi

# make sure we can connect to server
$MYSQL -u $MUSER -p$MPASS -h $MHOST -e "use $MDB"  &>/dev/null
if [ $? -ne 0 ]
then
	echo "Error - Cannot connect to mysql server using given username, password or database does not exits!"
	exit 2
fi

TABLES=$($MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e 'show tables' | $AWK '{ print $1}' | $GREP -v '^Tables' )

# make sure tables exits
if [ "$TABLES" == "" ]
then
	echo "Error - No table found in $MDB database!"
	exit 3
fi

# let us do it
for t in $TABLES
do
	echo "Deleting $t table from $MDB database..."
	$MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e "SET foreign_key_checks = 0; drop table $t"
done
