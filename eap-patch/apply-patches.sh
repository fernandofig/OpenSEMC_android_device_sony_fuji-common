#!/bin/bash

PFL=`find . -iname "*.patch"`
CDIR=`pwd`

cd $PWD/../../../../
REPOBASE=$PWD

cd $CDIR

for P in $PFL; do
	BASE=`dirname $P | sed 's/^.\///'`
	PF=`basename $P`

	echo -n "Apply $BASE/$PF ? [y/n] "
	read -r -s -N1

	if [ "$REPLY" = "y" ]; then
		cd $REPOBASE/$BASE
		git am $CDIR/$BASE/$PF
	else
		echo "Skipping... "
	fi
done

cd $CDIR

echo ""

