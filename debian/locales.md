
# Locales generieren

Fehlende locales werden über locale-gen generiert:

	locale-gen en_US.UTF-8

## Alternativ kann eine Locale-Datei auch manuell erstellt werden:[1]

	localedef -i en_US -f UTF-8 en_US.UTF-8

# Locale Einstellungen setzen

Die locale Einstellungen können wie folgt gesetzt werden (im Beispiel auf en_US.UTF-8): 

## Re-Configuring locales

	export LANGUAGE=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	locale-gen en_US.UTF-8
	dpkg-reconfigure locales
