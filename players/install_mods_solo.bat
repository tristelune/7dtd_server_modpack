@echo off
REM ###############################################
REM # variables                                   #
REM ###############################################

REM set repo url
set repo_url_name=https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/players/

REM set install script name
set mods_install_script_name=install_mods.ps1

REM set install script name
set mod_folder_name=Mods

REM set temp folder name
set temp_mod_install_folder_name=temp_mods

REM game file to check
set game_file_test=7DaysToDie.exe

REM mods list file name
set mods_list_file_name=mods_list_solo.txt

REM ###############################################
REM # traitement                                  #
REM ###############################################

REM go to script folder
CD /d "%~dp0"
set current_folder='%CD%'
REM check if in game folder if not exit
IF NOT EXIST %game_file_test% (
echo ***********************************************************************************
echo must be run in 7dtd game root folder where the game executable %game_file_test% is
echo ***********************************************************************************
pause
goto end
)
 
REM check if mod folder exist if not create it 
IF NOT EXIST %mod_folder_name%/ md %mod_folder_name%

REM create temp folder for installation
md %temp_mod_install_folder_name%
cd %temp_mod_install_folder_name%

REM download powershell installation script
set url_name=%repo_url_name%
set file_name=%mods_install_script_name%
powershell.exe -Command "Invoke-WebRequest -OutFile ./%file_name% %url_name%/%file_name%"
Powershell -ExecutionPolicy bypass -file "%file_name%" "%current_folder%" "%mod_folder_name%" "%mods_list_file_name%"

CD /d "%~dp0"
IF EXIST %temp_mod_install_folder_name%/ rd /s /q %temp_mod_install_folder_name%

:end