

Generating RSA PrivateKey

    openssl genrsa -out privateKey.pem 2048


Generating PublicKey from PrivateKey

    openssl rsa -in privateKey.pem -pubout -out publicKey.pem


Generate a random Key

    openssl rand -base64 32 > key.bin


Encrypt Message

    openssl rsautl -encrypt -inkey publicKey.pem -pubin -in message.txt -out message.enc
    
Decrypt Message

    openssl rsautl -decrypt -inkey privateKey.pem -in message.enc -out message.txt

Encrypt with Password

    openssl enc -aes-256-cbc -salt -in message.txt -out message.enc -pass file:./key.bin

Decrypt with Password

    openssl enc -d -aes-256-cbc -in message.enc -out message.txt -pass file:./key.bin


Generating Sha256 Hash

    openssl sha256 -out publicKeyHash.sha256 publicKey.pem



Base64 Encrypt

    base64 -w 0

use option -W for keys without linebreaks   

Base64 Decrypt

    base64 -d