#!/bin/bash

echo "Enabling firewall..."
ufw --force enable
echo ""
awk -F':' '{print $1}' /tmp/generated_addresses.txt|pv -s $(stat -c%s /tmp/generated_addresses.txt)|gzip -1 > addr.gz
echo ""
echo "The final file is saved under: addr.gz"
echo "Please send it to us by any available method"
