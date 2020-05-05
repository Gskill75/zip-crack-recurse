#!/bin/bash
#modify 05/05/2020 Gskill75
while [ -e *.zip ]; do
  files=*.zip;
  for file in $files; do
    echo -n "Cracking ${file}… ";
    output="$(fcrackzip -b -D -p rockyou.txt -u *.zip | tr -d '\n')";
    password="${output/Mot de Passe\!\!\!\!: pw == /}";
    if [ -z "${password}" ]; then
      echo "Mot de pass non trouve";
      break 2;
    fi;
    echo "Mot de pass trouve: \`${password}\`";
    unzip -q -P "${password}" "$file";
    rm "${file}";
  done;
done;
