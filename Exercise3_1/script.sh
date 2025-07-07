#!/usr/bin/env bash

# Comanda ce trebuie utilizata pentru decriptare este (decodificata cu Caesar Cipher ce are shift de 23);
# openssl enc -aes-256-cbc -d -salt -in confession.enc -out confession.mp4 -k Put_PWD_HERE

# Hashul este 767ae4575f235465c0318145d85cd947

string1="Sticks"
string2="Canon"
string3="Civic"

for string_var in "$string1" "$string2" "$string3"; do

    result=$(echo -n "$string_var" | md5sum | awk '{print $1}')

    if [[ "$result" == "767ae4575f235465c0318145d85cd947" ]]; then
        echo "Parola este $string_var"
	echo "Se ruleaza comanda de decriptare cu parola gasita..."
	openssl enc -aes-256-cbc -d -salt -in confession.enc -out confession.mp4 -k "$string_var"
	echo "Videoclipul a fost decriptat."
	xdg-open confession.mp4
	
	read -p "Vrei sa stergi fisierul video pentru a reincepe? (y/n) " choice
	case "$choice" in
		y|Y) rm confession.mp4 && echo "Videoul a fost sters!";;
		n|N) echo "OK, videoul nu fost sters!";;
		*) echo "Invalid, videoul nu a fost sters!";;
	esac
    fi
done

