set ken_mod_familly_name=KhaineA20ModletsXML
git clone https://github.com/KhaineGB/$ken_mod_familly_name.git
chmod 777 $ken_mod_familly_name

for modename in KHA20-12CraftQueue KHA20-3SlotForge KHA20-HPBars KHA20-60BBM KHA20-96BBM KHA20-KillTracking KHA20-LockableInvSlots  
cp -r ~/mods/$ken_mod_familly_name/$modename ~/serverfiles/Mods/$modename