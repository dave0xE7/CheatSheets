
# bash openssl commands

### Generating RSA PrivateKey

    openssl genrsa -out privateKey.pem 2048


### Generating PublicKey from PrivateKey

    openssl rsa -in privateKey.pem -pubout -out publicKey.pem


### Generate a random Key

    openssl rand -base64 32 > key.bin


### Encrypt Message

    openssl rsautl -encrypt -inkey publicKey.pem -pubin -in message.txt -out message.enc
    
### Decrypt Message

    openssl rsautl -decrypt -inkey privateKey.pem -in message.enc -out message.txt

### Encrypt with Password

    openssl enc -aes-256-cbc -salt -in message.txt -out message.enc -pass file:./key.bin

### Decrypt with Password

    openssl enc -d -aes-256-cbc -in message.enc -out message.txt -pass file:./key.bin


### Generating Sha256 Hash

    openssl sha256 publicKey.pem
    sha256sum publicKey.pem

    openssl sha256 publicKey.pem | awk '{print $1}' > publicKeyHash.sha256



### Base64 Encrypt

    base64 -w 0

use option -W for keys without linebreaks   

### Base64 Decrypt

    base64 -d


### Sign a file using sha1 digest and PKCS1 padding scheme
    openssl dgst -sha1 -sign myprivate.pem -out sha1.sign myfile.txt

### Dump the signature file
    hexdump sha1.sign

### Verify the signature of file
    openssl dgst -sha1 -verify mypublic.pem -signature sha1.sign myfile.txt
    Verified OK