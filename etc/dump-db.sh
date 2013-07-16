#!/bin/bash

if [ $# -eq 0 ] ; then
    echo 'Missing args, Usage: '$0' [MySQL root password] [version]'
    exit 0
fi

echo $1
DB=poundcake

mysqldump  --opt --no-data --routines  --user root --password $1 $DB > $DB_db_$2.sql;

mysqldump -uroot -p $1 $DB site_states site_state_icons switch_types tower_types tower_mounts tower_members zones power_types antenna_types antenna_types_radio_types build_item_types change_logs connectivity_types contact_types equipment_spaces frequencies monitoring_system_types network_services power_types >> $DB_db_$2.sql

echo "INSERT INTO users(username,password,admin) VALUES ('admin','c37948de525341d871f0550a1e0140752a95316a',1);" >> $DB_db_$2.sql