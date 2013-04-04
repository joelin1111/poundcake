#!/bin/bash
#
# initial setup:
# mkdir poundcake; git clone -b addrpool-2 git@github.com:clarkritchie/poundcake.git

# backup the database
function backup {
	mysqldump --extended-insert=FALSE --routines --opt poundcake > $BACKUP_FILE
}

# get the code from GitHub
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

function usage {
cat << EOF
usage: $0 options

This script will deploy the Poundcake application from GitHub.

OPTIONS:
   -h      Show this message
   -b      Git branch to pull from
   -d      Destination: s for staging (default) or p for production
EOF
}

# http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/
while getopts "hb:d:" OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         b)
             BRANCH=$OPTARG
             ;;
         d)
             DEST=$OPTARG
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

echo $BRANCH
echo $DEST

if [[ -z $BRANCH ]] || [[ -z $DEST ]]
then
     usage
     exit 1
fi

if  [[ $DEST == "p" ]]; then 
	TOWERDB=/var/www/towerdb.inveneo.org
else
	TOWERDB=/var/www/towerdb-staging.inveneo.org
fi

NOW=$(date +"%m_%d_%Y_at_%H_%M")

MAINT_FILE="$TOWERDB/poundcake/app/maintenance.txt"
BACKUP_DIR="~/poundcake"
BACKUP_FILE=$BACKUP_DIR"/poundcake-pre-"$BRANCH"-"$NOW".sql"

echo "This will deploy Tower DB using:"
echo "Branch: $BRANCH"
echo "Path:  $TOWERDB"
echo "DB backup:  $BACKUP_FILE"

while true; do
    read -p "Do you wish to deploy the site?  [Press Y to continue] " yn
    case $yn in
        [Yy]* )
        	backup
        	deploy
			exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer Y or y to continue deployment.";;
    esac
done

exit 0