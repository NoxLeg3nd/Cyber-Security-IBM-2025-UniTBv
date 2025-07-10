# Se curata fisierele vechi la o noua rulare a scriptului

rm encrypted.dat enc_key.bin decrypted.txt vectorIV.hex encrypted2.enc decrypted2.txt

# ---------------------ECB 192 biti-----------------------

# Prima data se va face criptarea cu ECB pe 192 de biti.
openssl rand -out enc_key.bin 24

# Dupa se va folosi cripatrea AES-192 cu modul ECB care nu foloseste IV.
openssl enc -aes-192-ecb -salt -in hashing.txt -out encrypted.dat -pass file:enc_key.bin

# Dupa se va decripta fisierul si continutul va fi returnat intr-un fisier.
openssl enc -d -aes-192-ecb -in encrypted.dat -out decrypted.txt -pass file:enc_key.bin

# ------------------CFB 128 biti (cu IV)--------------------

# Generarea unui vector IV de 128 biti, in format hex.
openssl rand -hex 16 > vectorIV.hex

# Dupa se va cripta hashing.txt cu AES-128 cu modul CFB care foloseste IV.
openssl enc -aes-128-cfb -salt -in hashing.txt -out encrypted2.enc -pass file:enc_key.bin -iv $(cat vectorIV.hex)

# Dupa se va decripta fisierul si continutul va fi returnat intr-un fisier.
openssl enc -d -aes-128-cfb -in encrypted2.enc -out decrypted2.txt -pass file:enc_key.bin -iv $(cat vectorIV.hex)
# Observatie: Se va folosi acelasi IV.
