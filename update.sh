sqlite3 bittyblog.db "CREATE TABLE IF NOT EXISTS \`last_update\` (\`time\` INTEGER NOT NULL);"

sqlite3 bittyblog.db "DELETE FROM last_update;"
sqlite3 bittyblog.db "INSERT INTO last_update (time) VALUES(CAST(strftime('%s', 'now') AS INT));"

echo .. Compiling bittyblog
make all
echo .. Copying executables
mv bb.cgi www/cgi-bin/bb.cgi
mv bbadmin.cgi www/cgi-bin/bbadmin.cgi
echo .. Copying images, and css
cp -r css www/

echo Update complete
