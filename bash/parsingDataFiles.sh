






get values from all lines of a category

    awk '/^## Country Name$/{f=1}f==0{next}/^$/{exit}{print substr($0, 2)}' /etc/pacman.d/mirrorlist.backup


Uncomment every line in a file

    sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup

