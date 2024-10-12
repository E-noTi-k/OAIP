@ECHO OFF
:: This file is called by Help+Manual to execute generic version control commands
:: vcs_commands_custom [GET|SYNC|CHECKOUT|CHECKIN|STATUS] "projectfolder" [optional parameters]

GOTO %1
GOTO eof

:get
echo Please make a copy of this command script and place your custom GET commands here!
GOTO eof

:sync
echo Please make a copy of this command script and place your custom SYNC commands here!
GOTO eof

:checkout
echo Please make a copy of this command script and place your custom CHECKOUT commands here!
GOTO eof

:checkin
echo Please make a copy of this command script and place your custom CHECKIN commands here!
GOTO eof

:status
echo Please make a copy of this command script and place your custom STATUS commands here!
GOTO eof

:eof