#set game mods folder
$game_mods_folders_name=$args[1]

#set game folder path
$game_folder_path=$args[0]

# set mode name
$mod_name=$args[2]

#set current mod url 
$mod_script_url=$args[3]

#set mod list file ghitub link 
$mod_list_file_name="mod_list.txt"

#set link to mod files archive to download
$mod_archive_url="https://github.com/KhaineGB/$mod_name/archive/refs/heads/"
$mod_archive_file_name="main.zip"

#download modlist
$url_name = $mod_script_url
$file_name = $mod_list_file_name
Invoke-WebRequest -OutFile ./$file_name $url_name/$file_name

#download mode archive
$url_name = $mod_archive_url
$file_name = $mod_archive_file_name
Invoke-WebRequest -OutFile ./$file_name $url_name/$file_name

#trim extention from archive name
$out_path=$mod_archive_file_name.SubString(0,$mod_archive_file_name.Length-4)
#unzip archive to archive name folder
Expand-Archive -Path ./$file_name -DestinationPath ./$out_path -Force

#read content of mod list 
$file_read=get-content -Path $PSScriptRoot\$file_name | Where-Object { $_.Trim() -ne '' }
# copy each mod to mod folder
foreach ($mod in $file_read) 
{

}