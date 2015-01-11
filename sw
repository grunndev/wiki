#!/usr/bin/env sh

# sw - suckless webframework - 2012 - nibble <develsec.org>
# Modified version of sw.

sw_filter() {
	for b in $BL; do
		[ "$b" = "$1" ] && return 0
	done
}

sw_main() {
	$MDHANDLER $1
}

sw_page_title() {
	head -n1 "$1"
}

sw_menu() {
	echo "<ul>"
	[ -z "`echo $1 | grep index.md`" ] && echo "<li><a href=\"index.html\">[root]</a></li>"
	[ "`dirname $1`" != "." ] && echo "<li><a href=\"../index.html\">[up]</a></li>"
	FILES=`ls \`dirname $1\` | sed -e 's,.md$,.html,g'`
	for i in $FILES ; do
		sw_filter $i && continue
		NAME=`echo $i | sed -e 's/\..*$//' -e 's/_/ /g'`
		[ -z "`echo $i | grep '\..*$'`" ] && i="$i/index.html"
		echo "<li><a href=\"$i\">$NAME</a></li>"
	done
	echo "</ul>"
}

# Set input dir
IDIR="`echo $1 | sed -e 's,/*$,,'`"
if [ -z "$IDIR" ] || [ ! -d $IDIR ]; then
	echo "Usage: sw [dir]"
	exit 1
fi

# Load config file
if [ ! -f $PWD/sw.conf ]; then
	echo "Cannot find sw.conf in current directory"
	exit 1
fi
. $PWD/sw.conf

# Setup output dir structure
CDIR=$PWD
ODIR="$CDIR/`basename $IDIR`.static"
rm -rf $ODIR
mkdir -p $ODIR
cp -rf $IDIR/* $ODIR
rm -f `find $ODIR -type f -iname '*.md'`

# Parse files
cd $IDIR
FILES=`find . -iname '*.md' | sed -e 's,^\./,,'`
for a in $FILES; do
	b="$ODIR/`echo $a | sed -e 's,.md$,.html,g'`"
	echo "* $a"
	render_page "$a" \
		"$TITLE" \
		"$SUBTITLE" \
		"$(sw_page_title $a)" \
		"$(sw_menu $a)" \
		"$(sw_main $a)" \
		> $b
done

exit 0
