

# wget

## download whole website using wget 

wget \
     --recursive \
     --level 5 \
     --no-clobber \
     --page-requisites \
     --adjust-extension \
     --convert-links \
     --domains wiki.archlinux.org \
     --no-parent \
     -e robots=off \
     -U mozilla \
     --random-wait \
     -r \
     -p \
		https://wiki.archlinux.org/
