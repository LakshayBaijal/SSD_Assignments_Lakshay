#!/bin/bash

password_length=$((8 + RANDOM % 3))
password=" "

password+=$(tr -dc 'A-Z' < /dev/urandom | head -c 1)
password+=$(tr -dc 'a-z' < /dev/urandom | head -c 1)
password+=$(tr -dc '%&#$@()!' < /dev/urandom | head -c 1)
password+=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c $((password_length - 3)))
password=$(echo $password | fold -w1 | shuf | tr -d '\n' ) 


account_length=$((12 + RANDOM % 3))
account=" "


while true; do

account+=$(tr -dc '1-9' < /dev/urandom | head -c 1)
account+=$(tr -dc '0-9' < /dev/urandom | head -c $((account_length - 1)))

if [[ $account =~ 000|111|222|333|444|555|666|777|888|999  ]]; then
	continue
fi
if [[ $account =~ 012|123|235|358|853|532|321|210 ]]; then
	continue
fi

	break
done

echo "Account Number: $account"
echo "Password: $password"
