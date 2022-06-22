
# In bash, how do I bind a function key to a command?

You can determine the character sequence emitted by a key by pressing Ctrl-v at the command line, then pressing the key you're interested in. On my system for F12, I get ^[[24~. The ^[ represents Esc. Different types of terminals or terminal emulators can emit different codes for the same key.

At a Bash prompt you can enter a command like this to enable the key macro so you can try it out.

	bind '"\e[24~":"foobar"'

Now, when you press F12, you'll get "foobar" on the command line ready for further editing. If you wanted a keystroke to enter a command immediately, you can add a newline:

	bind '"\e[24~":"pwd\n"'

Now when you press F12, you'll get the current directory displayed without having to press Enter. What if you've already typed something on the line and you use this which automatically executes? It could get messy. However, you could clear the line as part of your macro:

	bind '"\e[24~":"\C-k \C-upwd\n"'

The space makes sure that the Ctrl-u has something to delete to keep the bell from ringing.

Once you've gotten the macro working the way you want, you can make it persistent by adding it to your ~/.inputrc file. There's no need for the bind command or the outer set of single quotes:

	"\e[24~":"\C-k \C-upwd\n"

Edit:

You can also create a key binding that will execute something without disturbing the current command line.

	bind -x '"\eW":"who"'

Then while you're typing a command that requires a username, for example, and you need to know the names of user who are logged in, you can press Alt-Shift-W and the output of who will be displayed and the prompt will be re-issued with your partial command intact and the cursor in the same position in the line.

Unfortunately, this doesn't work properly for keys such as F12 which output more than two characters. In some cases this can be worked around.

The command (who in this case) could be any executable - a program, script or function. 


(reference link)[http://stackoverflow.com/questions/4200800/ddg#4201274]