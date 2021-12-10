cd ~
if [ ! -d "~/serverfiles/Mods" ] 
then
	mkdir -P ~/serverfiles/Mods
fi


mkdir mods
cd mods
wget https://github.com/tristelune/7dtd_server_modpack/blob/main/server/mod_list.txt

inputfile="mods_list.txt"
while IFS=, read -r y
do
mkdir $y
chmod 777 $y
cd $y
wget https://github.com/tristelune/7dtd_server_modpack/blob/main/server/mods/$y/install_mod.sh
sh ./install_mod.sh
cd ..
rmdir -rf $y
done < $inputfile

cd ..
rmdir -rf mods

