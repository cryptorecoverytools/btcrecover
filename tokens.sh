#!/bin/bash

if [ $# -lt 1 ]; then
    echo ""
    echo "Usage: $0 <tokens_template> [options]"
    echo ""
    echo "Example: $0 tokens.tpl"
    echo "--show to show generated passwords to stdout"
    exit 1
fi

if [ "$2" == "--show" ]; then
    python btcrecover.py --dsw --tokenlist $1 --listpass
    exit 1
fi

echo ""
python btcrecover.py --dsw --tokenlist $1 --listpass|pv -p -t -e -r -b -l >pwd.txt
echo ""
echo "All generated passwords is saved under: pwd.txt"
