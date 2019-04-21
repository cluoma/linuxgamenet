echo .. Compiling bittyblog
make all
echo .. Copying executables
mv bb.cgi www/cgi-bin/bb.cgi
mv bbadmin.cgi www/cgi-bin/bbadmin.cgi
echo .. Copying images, and css
cp -r css www/

echo Update complete
