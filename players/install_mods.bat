@echo off

CD /d "%~dp0"

REM check if in game folder if not exit
IF NOT EXIST 7DaysToDie.exe (
echo ***********************************************************************************
echo must be run in 7dtd game root folder where the game executable 7DaysToDie.exe is
echo ***********************************************************************************
pause
goto end
)
 
REM check if mod folder exist if not create it 
IF NOT EXIST Mods/ md Mods

REM create temp folder for installation
md temp_mods
cd temp_mods

REM download powershell installation script
set url_name=https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/players/
set file_name=install_mods.ps1
powershell.exe -Command "Invoke-WebRequest -OutFile ./%file_name% %url_name%/%file_name%"
Powershell -ExecutionPolicy bypass -file "%file_name%"

CD /d "%~dp0"
IF EXIST temp_mods/ rd /s /q temp_mods

:end