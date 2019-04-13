#!/bin/sh
echo "mozicsillag.sh: start"
cp $1/iptvupdate/custom/mozicsillag.sh $2/iptvupdate/custom/mozicsillag.sh
status=$?
if [ $status -ne 0 ]; then
	echo "mozicsillag.sh: Critical error. The $0 file can not be copied, error[$status]."
	exit 1
fi
cp $1/hosts/hostmozicsillag.py $2/hosts/
hosterr=$?
cp $1/icons/logos/mozicsillaglogo.png $2/icons/logos/
logoerr=$?
cp $1/icons/PlayerSelector/mozicsillag*.png $2/icons/PlayerSelector/
iconerr=$?
if [ $hosterr -ne 0 ] || [ $logoerr -ne 0 ] || [ $iconerr -ne 0 ]; then
	echo "mozicsillag.sh: copy error from source hosterr[$hosterr], logoerr[$logoerr, iconerr[$iconerr]"
fi
wget --no-check-certificate https://github.com/e2iplayerhosts/mozicsillag/archive/master.zip -q -O /tmp/mozicsillag.zip
if [ -s /tmp/mozicsillag.zip ] ; then
	unzip -q -o /tmp/mozicsillag.zip -d /tmp
	cp -r -f /tmp/mozicsillag-master/IPTVPlayer/hosts/hostmozicsillag.py $2/hosts/
	hosterr=$?
	cp -r -f /tmp/mozicsillag-master/IPTVPlayer/icons/* $2/icons/
	iconerr=$?
	if [ $hosterr -ne 0 ] || [ $iconerr -ne 0 ]; then
		echo "mozicsillag.sh: copy error from mozicsillag-master hosterr[$hosterr], iconerr[$iconerr]"
	fi
else
	echo "mozicsillag.sh: mozicsillag.zip could not be downloaded."
fi
rm -r -f /tmp/mozicsillag*
echo "mozicsillag.sh: exit 0"
exit 0