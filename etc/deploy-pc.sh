#!/bin/bash
#
# initial setup:
# mkdir poundcake; git clone -b addrpool-2 git@github.com:clarkritchie/poundcake.git

function deploy {
	# put the site into maintenance mode
	sudo sh -c "echo 1 > $MAINT_FILE"
	cd $TOWERDB/poundcake
	sudo chown -R critchie $TOWERDB
	git pull origin $BRANCH
	sudo chown -R www-data $TOWERDB
	echo "*** REMEMBER TO DISABLE MAINTENANCE MODE ***"
	echo "    sudo sh -c \"echo 0 > $MAINT_FILE\" "
}

echo "Usage: $0 [git branch] [staging]"

if [ "x$1" = "x" ]; then 
    BRANCH='clark-dev'
else
	BRANCH=$1
fi

if [ "x$2" = "x" ]; then 
    TOWERDB=/var/www/towerdb.inveneo.org
    MAINT_FILE="$TOWERDB/poundcake/app/maintenance.txt"
else
	TOWERDB=/var/www/towerdb-staging.inveneo.org
fi

MAINT_FILE="$TOWERDB/poundcake/app/maintenance.txt"

echo "This will deploy Tower DB using:"
echo "Branch: $BRANCH"
echo "Path:  $TOWERDB"

while true; do
    read -p "Do you wish to deploy the site?  [Press Y to continue] " yn
    case $yn in
        [Yy]* )
        	deploy
			exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer Y or y to continue deployment.";;
    esac
done

exit 0