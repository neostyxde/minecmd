:start
@echo off
color 3f
title StyxMineCMD - Help: bit.ly/minecmd
set mydrive=C
set pack=StyxMineCMD
goto updatedrive

:updatedrive
cd %mydrive%:\Users\%username%\AppData\Roaming\.minecraft\resourcepacks\%pack%\assets\minecraft\textures\item
if exist ok (
    goto help
) else (
	echo PLEASE FOLLOW THE TUTORIAL...
	start http://bit.ly/minecmd
	pause > NUL
)
goto help

:help
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
