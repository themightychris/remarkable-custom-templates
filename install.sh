#!/bin/bash -e


# file locations
path_installed='/usr/share/remarkable/templates/templates.json'
path_stock='./templates.json.state/stock.json'
path_patched='./templates.json.state/templates.json'


# examine current state of templates.json files
echo
echo "Examining snapshot hashes..."
hash_installed=$(sha1sum "${path_installed}" | awk '{print $1}')
hash_stock=$(sha1sum "${path_stock}" | awk '{print $1}')

if [ -f "${path_patched}" ]; then
    hash_patched=$(sha1sum "${path_patched}" | awk '{print $1}')
fi

echo "hash_installed=${hash_installed}"
echo "hash_stock=${hash_stock}"
echo "hash_patched=${hash_patched}"


# if installed doesn't match known stock or patched, update known stock
if [ "${hash_installed}" != "${hash_patched}" ] && [ "${hash_installed}" != "${hash_stock}" ]; then
    echo
    echo "Installed templates.json doesn't match known stock or patched version, assuming it's a new stock..."
    echo "Backing up and updating stock snapshot..."
    cp -v "${path_stock}" "${path_stock}.$(date -r "${path_stock}" '+%Y-%m-%d')"
    cp -v "${path_installed}" "${path_stock}"
fi


# generate new patched templates.json
echo
echo "Generating patched templates.json..."
cp -v "${path_stock}" "${path_patched}"
(cd "$(dirname "${path_patched}")" && patch) < ./templates.json.patch


# update templates
echo
echo "Updating templates..."
cp -v ./templates/* /usr/share/remarkable/templates/
cp -v "${path_installed}" ./backups/"templates.$(date +'%Y-%m-%d').json"
cp -v "${path_patched}" "${path_installed}"


echo
echo "Restarting UI..."
systemctl restart xochitl
