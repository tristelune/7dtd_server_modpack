CD /d "%~dp0"

REM check if in game folder if not exit
IF NOT EXIST 7DaysToDie.exe (
echo must be run in 7dtd game root folder (where the game executable 7DaysToDie.exe is)
pause
goto end:
)
 
REM check if mod folder exist if not create it 
IF NOT EXIST Mods/ md Mods


REM download powershell script
set url_name=https://location
set file_name=file.txt
powershell.exe -Command "Invoke-WebRequest -OutFile ./%file_name% %url_name%/%file_name%"





md temp_mods








IF EXIST temp_mods/ rd /s /q temp_mods