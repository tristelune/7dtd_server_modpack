###############################################
# variables                                   #
###############################################

# read parametters 
mod_name=$1 

###############################################
# traitement                                  #
###############################################

GIT_SSL_NO_VERIFY=true git clone https://github.com/KhaineGB/$mod_name.git

chmod -R 777 $mod_name

wget --timestamping --no-check-certificate https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/server/mods/$mod_name/mod_list

inputfile="mod_list"
while IFS=, read -r y
do
cp -r ./$mod_name/$y ~/serverfiles/Mods/$y
done < $inputfile

