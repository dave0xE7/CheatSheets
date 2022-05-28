### Starting a linux screen

    screen

### Get a list of commands

    Ctrl+a ?

### Starting a named Session

    screen -S session_name

### Working with Linux Screen Windows

    Ctrl+a c Create a new window (with shell)
    Ctrl+a " List all window
    Ctrl+a 0 Switch to window 0 (by number )
    Ctrl+a A Rename the current window
    Ctrl+a S Split current region horizontally into two regions
    Ctrl+a | Split current region vertically into two regions
    Ctrl+a tab Switch the input focus to the next region
    Ctrl+a Ctrl+a Toggle between the current and previous region
    Ctrl+a Q Close all regions but the current one
    Ctrl+a X Close the current region

### Detach

    Ctrl+a d

### Detach and Logout

    Ctrl+a D D

### Reattach to a Linux Screen

    screen -r

### List the current running Sreen Sessions with

    screen -ls

### output

    There are screens on:
        10835.pts-0.linuxize-desktop   (Detached)
        10366.pts-0.linuxize-desktop   (Detached)
    2 Sockets in /run/screens/S-linuxize.

### Restore specific Screen Session

    screen -r 10835

### Customize Linux Screen

    configuration parameters are read from
    /etc/screenrc
    and ~/.screenrc

### Example ~/.screenrc

```bash
# Turn off the welcome message
startup_message off

# Disable visual bell
vbell off

# Set scrollback buffer to 10000
defscrollback 10000

# Customize the status line
hardstatus alwayslastline
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B} %m-%d %{W}%c %{g}]'
```
