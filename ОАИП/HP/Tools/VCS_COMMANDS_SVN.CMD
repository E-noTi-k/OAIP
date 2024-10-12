@ECHO OFF
:: This is the default command file for Help+Manual to integrate Subversion (SVN) version control
:: Help+Manual calls this file with the following syntax:
::
:: vcs_commands_svn [GET|SYNC|CHECKOUT|CHECKIN|STATUS] "svn_exe_file_path" "projectfolder" [optional parameters]
::
:: Please do not make any changes to this command file. If you need to (and know what you are doing)
:: make a copy of this file and place it in a different location on your computer. Open Help+Manual,
:: click "File > Program Options", switch to the "Version Control" tab and tell H+M to use your custom
:: command file instead of the default file.
SET svntool=%2
SET mergetool=%4
%2 propset svn:ignore __history .
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
for /f "tokens=2 delims= " %%G in ('%2 status ^|findstr /B ! ') do %2 delete %%G
:: Add new files
%2 add --force --auto-props %3
:: Update and commit
%2 update %3
%2 commit %3 --message nul
if %ErrorLevel% neq 0 goto conflict
GOTO eof

:checkout
:: vcs_commands_svn CHECKOUT "svnexe" "projectfolder"
for /f "tokens=2 delims= " %%G in ('%2 status ^|findstr /B ! ') do %2 delete %%G
%2 add --force --auto-props %3
%2 update %3
GOTO eof

:checkin
:: vcs_commands_svn CHECKIN "svnexe" "projectfolder" 
for /f "tokens=2 delims= " %%G in ('%2 status ^|findstr /B ! ') do %2 delete %%G
%2 add --force --auto-props %3
%2 commit %3 --message nul
GOTO eof

:status
:: vcs_commands_svn STATUS "svnexe" "projectfolder"
%2 status %3
GOTO eof

:conflict
cd /D %3
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