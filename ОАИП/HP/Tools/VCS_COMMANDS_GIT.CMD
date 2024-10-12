@ECHO OFF
:: This is the default command file for Help+Manual to integrate Git version control
:: Help+Manual calls this file with the following syntax:
::
:: vcs_commands_git [GET|SYNC|CHECKOUT|CHECKIN|STATUS] "git_exe_file_path" "projectfolder" [optional parameters]
::
:: Please do not make any changes to this command file. If you need to (and know what you are doing)
:: make a copy of this file and place it in a different location on your computer. Open Help+Manual,
:: click "File > Program Options", switch to the "Version Control" tab and tell H+M to use your custom
:: command file instead of the default file.
::
:: Please note: 
:: The commands "CHECKOUT" and "CHECKIN" are generic functions introduced by Help+Manual.
:: In Git, these commands relate to "PULL" and "PUSH", respectively.
::
:: Before we do any update or commit, we must check the hidden .gitignore file. This file must exclude 
:: the __history/ subfolder(s) of the project, because the history is always local and should not be synced.
:: We test this configuration file for the two entries required to exclude the history.
setlocal enabledelayedexpansion
set "historyexclude1="
set "historyexclude2="
for /F %%G in (.gitignore) do (
	set foo=%%G
	if !foo!==__history/   set "historyexclude1=true"
	if !foo!==__history/** set "historyexclude2=true"
) 
if [%historyexclude1%]==[] (
	echo.>> .gitignore
	echo __history/ >> .gitignore
)
if [%historyexclude2%]==[] (
	if [%historyexclude1%] NEQ [] echo.>> .gitignore
	echo __history/** >> .gitignore
)

:: All checks done. Execute command...
set doconflict=false
GOTO %1
GOTO eof

:get
::  vcs_commands_git GET "gitexe" "projectfolder" "username" "useremail" '
CD /D %3
%2 init -b main
GOTO eof

:sync
::  vcs_commands_git SYNC "gitexe" "projectfolder" 
ECHO Help+Manual: Commiting changes in the project (working) folder to the local repository...
CD /D %3
%2 config core.autocrlf true
%2 add -A
%2 commit -m "HMSAVE %USERNAME%@%COMPUTERNAME%"
ECHO.      					 
ECHO Help+Manual: Pulling changes from the server respository...
%2 pull
if %ErrorLevel% neq 0 (set doconflict=true)
ECHO.     
ECHO Help+Manual: Pushing local changes to the server...
%2 push
if %ErrorLevel% neq 0 ( if "%doconflict%"=="true" (GOTO conflict))
GOTO eof

:checkout
::  vcs_commands_git CHECKOUT "gitexe" "projectfolder" 
CD /D %3
%2 add -A
%2 commit -m "HMSAVE %USERNAME%@%COMPUTERNAME%"
%2 pull
GOTO eof

:checkin
::  vcs_commands_git CHECKIN "gitexe" "projectfolder" 
CD /D %3
%2 add -A
%2 commit -m "HMSAVE %USERNAME%@%COMPUTERNAME%"
%2 push
GOTO eof

:status
::  vcs_commands_git STATUS "gitexe" "projectfolder"
CD /D %3
%2 status
GOTO eof

:conflict
ECHO.     
ECHO.     
ECHO CONFLICTS FOUND
ECHO Your merge tool has been started to resolve them
%2 mergetool
goto checkin

GOTO eof


:eof