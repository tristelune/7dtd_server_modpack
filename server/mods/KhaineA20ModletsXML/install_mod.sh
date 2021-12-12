###############################################
# variables                                   #
###############################################

# read parametters 
server_folder_path=$1
server_mods_folder_name=$2
mod_name=$3
mod_script_url=$4 

#set mod list file name
mod_list_file_name=mod_list



###############################################
# traitement                                  #
###############################################

GIT_SSL_NO_VERIFY=true git clone https://github.com/KhaineGB/$mod_name.git

chmod -R 777 $mod_name

wget --timestamping --no-check-certificate $mod_script_url/$mod_list_file_name

inputfile="$mod_list_file_name"
while IFS=, read -r mod_componant_name
do
cp -r ./$mod_name/$mod_componant_name $server_folder_path/$server_mods_folder_name/$mod_componant_name
done < $inputfile

