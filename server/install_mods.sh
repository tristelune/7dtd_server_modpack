cd ~
pkg-name=git
dpkg -s $pkg-name 2>/dev/null >/dev/null || sudo apt-get -y install $pkg-name

if [ ! -d "~/serverfiles/Mods" ] 
then
	mkdir -p ~/serverfiles/Mods
fi


mkdir mods
chmod -R 777 mods
cd mods
wget --timestamping --no-check-certificate https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/server/mods_list.txt

inputfile="mods_list.txt"
while IFS=, read -r y
do
mkdir $y
chmod -R 777 $y
cd $y
wget --timestamping --no-check-certificate https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/server/mods/$y/install_mod.sh
sh ./install_mod.sh
cd ..
rm -rf $y
done < $inputfile

cd ..
rm -rf mods

