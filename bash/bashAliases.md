

### Enable aliases for the current user

    if [ ! -e ~/.bash_aliases ]; then
        touch ~/.bash_aliases
    fi

### Linking aliases for root to those of a normal user

    if [ ! -e /root/.bash_aliases ]; then
        ln -s /home/service/.bash_aliases /root/.bash_aliases
    fi

### Adding some useful aliases

    #echo "Adding la='ls -la' to .bash_aliases"
    echo "alias la='ls -la'" >> ~/.bash_aliases

