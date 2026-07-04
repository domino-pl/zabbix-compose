#!/bin/bash
#v01-20250530.0

generate_salt() {
  tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 8
}

read -p "Username: " USERNAME

read -s -p "Password: " PASSWORD
echo
read -s -p "Repeat password: " PASSWORD2
echo

if [ "$PASSWORD" != "$PASSWORD2" ]; then
  echo "Passwords don't match!"
  exit 1
fi

SALT=$(generate_salt)
HASH=$(openssl passwd -apr1 -salt "$SALT" "$PASSWORD")

echo "USERNAME:HASH"
echo "$USERNAME:$HASH"
