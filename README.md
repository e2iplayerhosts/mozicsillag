E2iPlayer mozicsillag HU host

Install:

~~~
wget --no-check-certificate https://github.com/e2iplayerhosts/mozicsillag/archive/master.zip -q -O /tmp/mozicsillag.zip
unzip -q -o /tmp/mozicsillag.zip -d /tmp
cp -r -f /tmp/mozicsillag-master/IPTVPlayer/* /usr/lib/enigma2/python/Plugins/Extensions/IPTVPlayer
rm -r -f /tmp/mozicsillag*
~~~

restart enigma2 GUI