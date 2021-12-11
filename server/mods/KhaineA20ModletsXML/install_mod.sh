ken_mod_familly_name=KhaineA20ModletsXML

GIT_SSL_NO_VERIFY=true git clone https://github.com/KhaineGB/$ken_mod_familly_name.git

chmod -R 777 $ken_mod_familly_name

wget --timestamping --no-check-certificate https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/server/mods/$ken_mod_familly_name/mod_list

inputfile="mod_list"
while IFS=, read -r y
do
cp -r ./$ken_mod_familly_name/$y ~/serverfiles/Mods/$y
done < $inputfile