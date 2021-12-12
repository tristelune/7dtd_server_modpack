$url_name = "https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/players/"
$file_name = "mod_list.txt"
Invoke-WebRequest -OutFile ./$file_name $url_name/$file_name

$file_read=get-content -Path $PSScriptRoot\$file_name | Where-Object { $_.Trim() -ne '' }
foreach ($mod in $file_read) 
{
New-Item -ItemType directory -Path "$mod" -Force
cd $mod
$url_name = "https://raw.githubusercontent.com/tristelune/7dtd_server_modpack/main/players/mods/$mod"
$file_name = "install_mod.ps1"
Invoke-WebRequest -OutFile ./$file_name $url_name/$file_name
invoke-expression -Command ./$file_name 
cd ..
}
 # $path1=split-path -path $line -parent
 # $path2=split-path -path $path1 -noqualifier
 # $path=$files_path+$path2
 # New-Item -ItemType directory -Path "$path" -Force
 # copy-item -path "$line" -destination "$path" -Force