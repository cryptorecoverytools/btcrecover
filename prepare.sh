#!/bin/bash

#echo "Enabling firewall..."
#ufw --force enable
echo ""
pv -p -t -e -r -b -l -s $(wc -l < pairs.txt) pairs.txt | awk '{print $1}' > addr.txt
echo ""
echo "The final file is saved under: addr.txt"
echo "Please send it to us by any available method"
