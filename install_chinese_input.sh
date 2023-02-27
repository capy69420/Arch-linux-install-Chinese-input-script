#!/bin/bash

# Install the necessary packages
echo "Select the Chinese input method you want to install:"
echo "1. fcitx-googlepinyin (default)"
echo "2. fcitx-sunpinyin"
echo "3. fcitx-pinyin"
echo "4. fcitx-libpinyin"
echo "5. fcitx-rime"
read input_method

if [ "$input_method" = "2" ]; then
    sudo pacman -S fcitx-sunpinyin
elif [ "$input_method" = "3" ]; then
    sudo pacman -S fcitx-pinyin
elif [ "$input_method" = "4" ]; then
    sudo pacman -S fcitx-libpinyin
elif [ "$input_method" = "5" ]; then
    sudo pacman -S fcitx-rime
else
    sudo pacman -S fcitx-googlepinyin
fi

# Install the configuration tool
sudo pacman -S fcitx-im fcitx-configtool fcitx-configtool

# Set the default input method for GTK-based applications
echo 'export GTK_IM_MODULE=fcitx' >> ~/.xprofile
echo 'export XMODIFIERS=@im=fcitx' >> ~/.xprofile
echo 'export QT_IM_MODULE=fcitx' >> ~/.xprofile

# Exit the script
echo "Installation completed."
exit 0
