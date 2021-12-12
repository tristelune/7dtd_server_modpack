# set mode name
$mod_name="KhaineA20ModletsHarmony"
#set mod list file ghitub link 
$mod_script_url="https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/players/mods/$mod_name"
$mod_list_file_name="mod_list.txt"

#set mode archive to download link
$mod_archive_url="https://github.com/KhaineGB/$mod_name/archive/refs/heads/"
$mod_archive_file_name="main.zip"

#download modlist
$url_name = $mod_script_url
$file_name = $mod_list_file_name
write-host $url_name
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