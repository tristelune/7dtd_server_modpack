###############################################
# variables                                   #
###############################################

#set repository url
repo_url_name=https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main

#repository for server scripts sub folder name
sub_cat_1=server
sub_cat_1_url=$repo_url_name/$sub_cat_1

#repository for mods scripts sub folder name under sub_cat_1 folder
sub_cat_2=mods
sub_cat_2_url=$sub_cat_1_url/$sub_cat_2

#set path to server files
server_folder_path=~/serverfiles

#set mods folder name 
server_mods_folder_name=Mods

#set path to server mods folder
server_mods_folder_path=$server_folder_path/$server_mods_folder_name

#set temporary folder name
temp_mods_folder_name=temp_mods

#set mods list file name 
mods_list_file_name=mods_list.txt

#set mod script file name
mod_script_file_name=install_mod.sh

###############################################
# traitement                                  #
###############################################

#go to user root folder
cd ~

#check if git is installed if not install it
pkg-name=git
dpkg -s $pkg-name 2>/dev/null >/dev/null || sudo apt-get -y install $pkg-name

#check if game server mods folder exist and create it if not
if [ ! -d $server_mods_folder_path ] 
then
	mkdir -p $server_mods_folder_path
fi

# make temporary folder for mods installation
mkdir $temp_mods_folder_name
# grant full right to everyone on folder and subfolder to avoir deletion errors
chmod -R 777 $temp_mods_folder_name
#go to temporary folder for mods installation
cd $temp_mods_folder_name
#get mods list to install
wget --timestamping --no-check-certificate $sub_cat_1_url/$mods_list_file_name
# read and proceed  mods list to install 
inputfile="$mods_list_file_name"
while IFS=, read -r mode_name
do
#create current mod folder 
mkdir $mode_name
# grant full right to everyone on folder and subfolder to avoir deletion errors
chmod -R 777 $mode_name
#go to current mod folder 
cd $mode_name
#get current mod installation script from github
wget --timestamping --no-check-certificate $sub_cat_2_url/$mode_name/$mod_script_file_name
#run current mod installation script
sh ./$mod_script_file_name "$server_folder_path" "$server_mods_folder_name" "$mode_name" "$sub_cat_2_url/$mode_name"
#go out of current mod folder 
cd ..
#remove current mod folder 
rm -rf $mode_name
done < $inputfile
#go out of temporary folder for mods installation
cd ..
#remove temporary folder for mods installation
rm -rf $temp_mods_folder_name

