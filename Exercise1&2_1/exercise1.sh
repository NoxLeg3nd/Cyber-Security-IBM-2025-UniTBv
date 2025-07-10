ssh-keygen -t rsa -f rsa_key

printf "\n\n\n\nRSA key:\n"
cat rsa_key

printf "\n\n\n\nPublic RSA key:\n"
cat rsa_key.pub
