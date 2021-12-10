cd ~
if [ ! -d "~/serverfiles/Mods" ] 
then
	mkdir -p ~/serverfiles/Mods
fi


mkdir mods
cd mods
wget https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/server/mods_list

inputfile="mods_list"
while IFS=, read -r y
do
mkdir $y
chmod 777 $y
cd $y
wget https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/server/mods/$y/install_mod.sh
sh ./install_mod.sh
cd ..
rm -rf $y
done < $inputfile

cd ..
rm -rf mods

