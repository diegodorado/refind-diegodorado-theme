# rEFInd diegodorado theme

A custom and minimal theme for rEFInd

![Screenshot 02](https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/src/dark_theme.png)


1. Clone git repository to your $HOME directory.
   ```
   git clone https://github.com/bobafetthotmail/refind-theme-regular.git
   ```

2. Locate refind directory under EFI partition. For most Linux based system is commonly `/boot/efi/EFI/refind/`. Copy theme directory to it.

   **Important:** Delete older installed versions of this theme before you proceed any further.

   ```
   sudo rm -rf /boot/efi/EFI/refind/{diegodorado-theme}
   ```
   ```
   sudo cp -r refind-theme-regular /boot/efi/EFI/refind/
   ```

5. To enable the theme add `include refind-theme-regular/theme.conf` at the end of `refind.conf`, and comment out or delete any other themes you might have installed.
   ```
   sudo vi /boot/efi/EFI/refind/refind.conf

   ```

path="/boot/efi/EFI/refind"
mkdir -p "$path/themes" 
#Remove previous installs
rm -rf "$path/themes/refind-diegodorado-theme" 
#Copy theme setup folders
cp -r . "$path/themes/refind-diegodorado-theme"
#Edit refind.conf - add new theme
include themes/refind-diegodorado-theme/theme.conf" | tee -a "$path"/refind.conf &> /dev/null
