#!/usr/bin/bash

lua z1/Sql.lua database/table_molecula.sql;

DATABASE="cat.sqlite3";

MIGRATIONS=(
    "database/table_element.sql"
    "database/table_molecula.sql"
);

if [ -f $DATABASE ]; then
    rm $DATABASE;
fi

for migration in ${MIGRATIONS[@]}; do
    sqlite3 $DATABASE < $migration;
done
