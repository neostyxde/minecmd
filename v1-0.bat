REM this code is pretty self-explainitory but anyways, if you fell in love with comments (litteraly nobody asked for that),
REM here you go!

:start
REM normal stuff
@echo off
color 3f
title StyxMineCMD - Help: bit.ly/minecmd
REM reset variables to default one
set mydrive=C
set pack=StyxMineCMD
goto updatedrive

:updatedrive
REM goes to the path
cd %mydrive%:\Users\%username%\AppData\Roaming\.minecraft\resourcepacks\%pack%\assets\minecraft\textures\item
REM checks if the user installed the texturepack correctly by checking the "ok"-file in it
if exist ok (
    goto help
) else (
	echo PLEASE FOLLOW THE TUTORIAL...
	start http://bit.ly/minecmd
	pause > NUL
)
goto help

:help
REM help menu
cls
echo --MISCELLANEOUS--
echo.
echo !help			show this list
echo ===
echo !tutorial		open github-page
echo ===
echo !drive			choose your drive-letter (such as c, d, or e) [default c]
echo ===
echo !pack			choose your texturepack-name [default StyxMineCMD]
echo ===
echo !dev			do @echo on
echo ============================================================================
echo.
echo --GAME--
echo.
echo !ruby			change emerald texture to ruby one
echo ===
echo !noruby		reset emerald texture to normal one
echo ===
echo.
echo.
echo Remember to press [F3+T] in Minecraft
echo to apply the changes to the game!
goto ask

:ask
REM user input for commands
echo Select new action:
set input=
set /p input=!
if %input%==help goto help
if %input%==tutorial goto tutorial
if %input%==drive goto drive
if %input%==pack goto pack
if %input%==dev goto dev
if %input%==ruby goto ruby
if %input%==noruby goto noruby
pause > NUL
goto error

:tutorial
REM opens github page
start http://bit.ly/minecmd
goto help

:drive
echo Select the drive you have installed windows on.
set drive=
set /p %mydrive%= Drive:
cls
goto updatedrive

:pack
echo Select your texturepack (should be placed at the top)
set pack=
set /p %pack%= Pack: 
cls
goto updatedrive

:dev
@echo on
echo debug-echo ist now on.
goto help

REM ruby and noruby just copy some files nothin' special

:ruby
echo ---
xcopy /y ruby-normal.png emerald.png
echo ---
pause > NUL
cls
goto ask

:noruby
echo ---
xcopy /y emerald-normal.png emerald.png
echo ---
pause > NUL
cls
goto ask

:error
REM if someone writes a wrong command
echo.
echo.
echo --ERROR--
color cf
echo There was an error.
echo We are sorry about that.
echo Please visit the error page:
echo (press any key to open bug-report-page)
pause > NUL
start https://github.com/neostyxde/minecmd/issues
