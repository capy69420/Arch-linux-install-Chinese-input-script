#!/bin/bash

# Install the necessary packages
echo "Select the Chinese input method you want to install:"
echo "1. fcitx-pinyin (default)"
echo "2. fcitx-sunpinyin"
echo "3. fcitx-googlepinyin"
echo "4. fcitx-libpinyin"
echo "5. fcitx-rime"
read input_method

if [ "$input_method" = "2" ]; then
    sudo pacman -S fcitx-sunpinyin
elif [ "$input_method" = "3" ]; then
    sudo pacman -S fcitx-googlepinyin
elif [ "$input_method" = "4" ]; then
    sudo pacman -S fcitx-libpinyin
elif [ "$input_method" = "5" ]; then
    sudo pacman -S fcitx-rime
else
    sudo pacman -S fcitx-pinyin
fi

# Install the configuration tool
sudo pacman -S fcitx-configtool

# Set the default input method for GTK-based applications
echo 'export GTK_IM_MODULE=fcitx' >> ~/.xprofile
echo 'export XMODIFIERS=@im=fcitx' >> ~/.xprofile
echo 'export QT_IM_MODULE=fcitx' >> ~/.xprofile

# Set the default input method for Qt-based applications (used by KDE desktop environment)
echo 'export XIM="fcitx"' >> ~/.config/plasma-workspace/env/fcitx.sh
echo 'export XMODIFIERS="@im=fcitx"' >> ~/.config/plasma-workspace/env/fcitx.sh
echo 'export QT_IM_MODULE="fcitx"' >> ~/.config/plasma-workspace/env/fcitx.sh

# Exit the script
echo "Installation completed."
exit 0
