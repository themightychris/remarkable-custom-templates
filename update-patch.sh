#!/bin/bash -e


# update patch
echo
echo "Updating templates.json.patch via diff -u templates.json.state/stock.json templates.json"
diff -u templates.json.state/stock.json templates.json > templates.json.patch
