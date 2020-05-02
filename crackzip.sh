#!/bin/bash

while [ -e *.zip ]; do
  files=*.zip;
  for file in $files; do
    echo -n "Cracking ${file}… ";
    output="$(fcrackzip -u -l 1-6 -c '1' *.zip | tr -d '\n')";
    password="${output/PASSWORD TROUVE\!\!\!\!: pw == /}";
    if [ -z "${password}" ]; then
      echo "Mot de passe non trouve ";
      break 2;
    fi;
    echo "Voici le Mot de Passe Trouve: \`${password}\`";
    unzip -q -P "${password}" "$file";
    rm "${file}";
  done;
done;
