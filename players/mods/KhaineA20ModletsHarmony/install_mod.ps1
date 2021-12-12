$mod_name="KhaineA20ModletsHarmony"

$url_name = "https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/players/mods/$mod_name"
$file_name = "mod_list.txt"
Invoke-WebRequest -OutFile ./$file_name $url_name/$file_name