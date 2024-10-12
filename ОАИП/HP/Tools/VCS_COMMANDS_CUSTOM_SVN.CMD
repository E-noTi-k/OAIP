@ECHO OFF
:: This is the default command file for Help+Manual to integrate Subversion (SVN) version control
:: Help+Manual calls this file with the following syntax:
::
:: vcs_commands_custom_svn [GET|SYNC|CHECKOUT|CHECKIN|STATUS] "projectfolder" [optional parameters]
::
:: Please do not make any changes to this command file. If you need to (and know what you are doing)
:: make a copy of this file and place it in a different location on your computer. Open Help+Manual,
:: click "File > Program Options", switch to the "Version Control" tab and tell H+M to use your custom
:: command file instead of the default file.
SET project=%2
SET svntool=enter path to SVN.EXE here
SET mergetool=enter path to merge tool here

REM For the custom script, this must be set in SVN directly: %svntool% propset svn:ignore __history .
GOTO %1
GOTO :eof

:get
:: vcs_commands_svn GET "svnexe" "projectfolder"
echo SVN init not implemented!
GOTO eof

:sync
:: vcs_commands_svn SYNC "svnexe" "projectfolder"
:: for /F: If a file has been renamed or deleted, it has status "!" (missing) in SVN. We must 
:: explicitely delete those missing files. Otherwise, they will reappear with the next "update" command.
for /f "tokens=2 delims= " %%G in ('%svntool% status ^|findstr /B ! ') do %svntool% delete %%G
:: Add new files
%svntool% add --force --auto-props %project%
:: Update and commit
%svntool% update %project%
%svntool% commit %project% --message nul
if %ErrorLevel% neq 0 goto conflict
GOTO eof

:checkout
:: vcs_commands_svn CHECKOUT "svnexe" "projectfolder"
for /f "tokens=2 delims= " %%G in ('%svntool% status ^|findstr /B ! ') do %svntool% delete %%G
%svntool% add --force --auto-props %project%
%svntool% update %project%
GOTO eof

:checkin
:: vcs_commands_svn CHECKIN "svnexe" "projectfolder" 
for /f "tokens=2 delims= " %%G in ('%svntool% status ^|findstr /B ! ') do %svntool% delete %%G
%svntool% add --force --auto-props %project%
%svntool% commit %project% --message nul
GOTO eof

:status
:: vcs_commands_svn STATUS "svnexe" "projectfolder"
%svntool% status %project%
GOTO eof

:conflict
cd /D %project%
@echo off
setlocal enableextensions enabledelayedexpansion
call :resolve-conflicts ./ *.mine
goto :eof

:resolve-conflicts
set conflicted=
for /r "%~1" %%P in ("%~2") do (
set conflicted=%%~fP
set conflicted=!conflicted:.mine=!
%mergetool% "!conflicted!"
%svntool% resolved "!conflicted!"
)


:eof