

    sudo apt-get update && sudo apt-get upgrade

Installing Mate Desktop

    sudo apt-get install mate-desktop-environment-extras
    # or
    apt-get install mate-core

Add GTK Themes


Arc GTK theme

    sudo apt install arc-theme

Numix GTK theme

    sudo apt install numix-gtk-theme

Paper GTK theme

    wget https://launchpadlibrarian.net/279316945/paper-gtk-theme_2.1+r265~daily~ubuntu16.04.1_all.deb

    sudo dpkg -i paper-gtk-theme*.deb

Adapta GTK theme

    wget https://launchpadlibrarian.net/365484299/adapta-gtk-theme_3.93.0.258-0ubuntu1~xenial1_all.deb

    sudo dpkg -i adapta-gtk-theme*.deb

Flat Remix GTK theme

    wget https://launchpadlibrarian.net/360355654/flat-remix-gtk_1.4_amd64.deb

    sudo dpkg -i flat-remix-gtk*.deb


Add Icon Themes

install gome icon theme first

    sudo apt install gnome-icon-theme

Moka icon theme

    sudo apt install moka-icon-theme

Numix icon theme

    sudo apt install numix-icon-theme

Paper icon theme

    wget https://launchpadlibrarian.net/358582113/paper-icon-theme_1.4+r696~daily~ubuntu16.04.1_all.deb

    sudo dpkg -i paper-icon-theme*.deb

Papirus icon theme

    wget https://launchpadlibrarian.net/365722933/papirus-icon-theme_20180416-2338+pkg18~ubuntu16.04.1_all.deb

    sudo dpkg -i papirus-icon-theme*.deb

Flat Remix icon theme

    wget https://launchpadlibrarian.net/361602523/flat-remix_1.44_amd64.deb

    sudo dpkg -i flat-remix*.deb




Terminal Color Prompt

    nano ~/.bashrc

uncomment this line
    force_color_prompt=yes



Customizing Login Screen

    sudo apt-get install lightdm-gtk-greeter-settings

Install LightDM

    sudo apt-get install lightdm

Mate-Tweak

    sudo apt-get install mate-tweak