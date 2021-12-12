#set repository url
repo_url_name=https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main

#repository for server scripts sub folder name
sub_cat_1=server
sub_cat_1_url=$repo_url_name/$sub_cat_1
###############################################
# variables                                   #
###############################################
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


mkdir $temp_mods_folder_name
chmod -R 777 $temp_mods_folder_name
cd $temp_mods_folder_name
wget --timestamping --no-check-certificate $sub_cat_1_url/$mods_list_file_name

inputfile="$mods_list_file_name"
while IFS=, read -r y
do
mkdir $y
chmod -R 777 $y
cd $y
wget --timestamping --no-check-certificate $sub_cat_2_url/$y/$mod_script_file_name
sh ./$mod_script_file_name
cd ..
rm -rf $y
done < $inputfile

cd ..
rm -rf $temp_mods_folder_name

