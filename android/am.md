



# starting my self developed app example

    am start -n com.androidjs.info_app/com.android.js.webview.MainActivity -a android.intent.action.MAIN -c android.intent.category.LAUNCHER 

# and force-stopping it again

    am force-stop com.androidjs.info_app




# starting a termux terminal or bring it to front

    am start -n com.termux/com.termux.app.TermuxActivity -a android.intent.action.MAIN -c android.intent.category.LAUNCHER 

# same here but attention its stupid however (kills all daemons/services)
# only usefull to kill a ps mess

    am force-stop com.termux