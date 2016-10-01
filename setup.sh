#!/bin/sh

# Verify that the old versions are what we expect
diff -q base.lst.orig /usr/share/X11/xkb/rules/base.lst >/dev/null
if [ $? != 0 ]; then
    echo "The base.lst file does not match the expected version, aborting"
    exit 1
fi
diff -q base.xml.orig /usr/share/X11/xkb/rules/base.xml >/dev/null
if [ $? != 0 ]; then
    echo "The base.xml file does not match the expected version, aborting"
    exit 1
fi
diff -q ru.orig /usr/share/X11/xkb/symbols/ru >/dev/null
if [ $? != 0 ]; then
    echo "The ru file does not match the expected version, aborting"
    exit 1
fi
# Move the old versions
sudo mv /usr/share/X11/xkb/rules/base.lst /usr/share/X11/xkb/rules/base.lst.bkp
sudo mv /usr/share/X11/xkb/rules/base.xml /usr/share/X11/xkb/rules/base.lst.xml
sudo mv /usr/share/X11/xkb/symbols/ru     /usr/share/X11/xkb/symbols/ru.bkp
# Install the modified versions
sudo cp base.lst /usr/share/X11/xkb/rules/
sudo cp base.xml /usr/share/X11/xkb/rules/
sudo cp ru       /usr/share/X11/xkb/symbols/
