
# virsh

	virsh list -all

### copy domain

	domain='debian9'
	clone='debianCloneA'
	diskBasePath=''
	virsh dumpxml $domain > $domain.xml

	diskecho (PathOrigin=$(cat $domain.xml | grep 'source file' | awk -F "'" '{print $2}'{})
	cp $diskPathOrigin $diskBasePath$clone.qcow2heq
