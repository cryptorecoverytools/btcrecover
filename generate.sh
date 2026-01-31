#!/bin/bash

if [ $# -lt 3 ]; then
    echo ""
    echo "Usage: $0 <address_limit> <passwords_file> <\"your mnemonic phrase\"> [options]"
    echo ""
    echo "Example: $0 10 /tmp/pwd.txt \"your mnemonic phrase\""
    echo ""
    echo "where /tmp/pwd.txt is the file with pre-generated passwords using crunch tool"
    echo "to generate digital passwords with 8-digits length, use the following command:"
    echo "crunch 1 8 0123456789 -o /tmp/pwd.txt";
    echo ""
    exit 1
fi

#echo "Enabling firewall..."
#ufw --force enable

# generate digital passwords with 8-digits length
# crunch 1 8 0123456789 -o /tmp/pwd8.txt

python btcrecover.py --bip39 --bip32-path "m/44'/0'/0'/0" --force-bip44 --disable-p2sh --disable-p2tr --disable-bip84 --addr-limit $1 --passwordlist $2 --mnemonic "$3" --dsw --skip-pre-start --no-dupchecks --no-dupchecks --no-dupchecks --no-dupchecks --no-eta $4

echo ""
echo "To prepare a safe file containing only addresses, please run the following script: ./prepare.sh"
echo ""

history -c
rm ~/.bash_history 2>/dev/null
echo "history -c;> ~/.bash_history">~/.bash_logout
