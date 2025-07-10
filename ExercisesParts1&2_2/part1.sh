rm cert.crt domain.csr domain.key
# Creez o cheie privata
openssl genpkey -algorithm RSA -out domain.key -pkeyopt rsa_keygen_bits:2048

# Creez un CSR 
openssl req -new -key domain.key -out domain.csr -sha512 -subj "/C=RO/ST=Romania/L=Brasov/O=Company/OU=Network/CN=UniTBv-Practica-IBM.ro"

# Creez un certificat semnat ce foloseste CSR-ul si cheia generate anterior.
openssl x509 -req -in domain.csr -signkey domain.key -out cert.crt -days 365 -sha512
# Observatie: se foloseste SHA512.

printf "\n\n\n\n\n\n\n--------------------------------------------------\n"
# Se afiseaza certificate chain-ul trimis de intranet.unitbv.ro.
openssl s_client -connect intranet.unitbv.ro:443 -showcerts
