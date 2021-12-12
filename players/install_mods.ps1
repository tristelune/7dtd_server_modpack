###############################################
# variables                                   #
###############################################
#read script arguments
$game_folder_path=$args[0]
$game_mods_folder_name=$args[1]

#repository main url
$repo_url_name="https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main"

#repository for players scripts sub folder name
$sub_cat_1='players'
$sub_cat_1_url=$repo_url_name + '/' + $sub_cat_1

#repository for mods scripts sub folder name under sub_cat_1 folder
$sub_cat_2='mods'
$sub_cat_2_url=$sub_cat_1_url + '/' + $sub_cat_2

#set mods list file name
$mods_list_file_name="mod_list.txt"

#set mod install script name
$mod_install_script_name="install_mod.ps1"

###############################################
# traitement                                  #
###############################################

#download mods list file
$url_name = $sub_cat_1_url
$file_name = $mods_list_file_name
Invoke-WebRequest -OutFile ./$file_name $url_name/$file_name

#read mods list file
$file_read=get-content -Path $PSScriptRoot\$file_name | Where-Object { $_.Trim() -ne '' }

#run throug all mods in the list
foreach ($mod in $file_read) 
{
#create new folder based on mod name and go inside
New-Item -ItemType directory -Path "$mod" -Force
cd $mod
#download mod script
$url_name = $sub_cat_2_url + '/' + $mod
$file_name = $mod_install_script_name
Invoke-WebRequest -OutFile ./$file_name $url_name/$file_name

#run mod script and pass to it : game folder path, game mods folder name, current mod name, gith hub url for current mod
$commande='./' + $file_name + ' ' + $game_folder_path + ' ' + $game_mods_folder_name + ' ' + $mod + ' ' + $url_name 
invoke-expression -Command $commande

#get out of current mod folder before next loop for next mod
cd ..
}