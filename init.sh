#!/bin/bash

if [ -z ${1} ]; then
  echo "USAGE: ${0} <DIRECTORY_NAME>" 
  exit 1
else
  DIR_NAME=${1}
fi
mkdir -p slides/${DIR_NAME}
cp -pr reveal.js slides/${DIR_NAME}
cp -pr revealjs.template slides/${DIR_NAME}

cat << EOF > slides/${DIR_NAME}/convert.sh
#!/bin/bash
pandoc -s -t revealjs --template=revealjs.template -V theme:mozilla-devrel-light -V  transition:page --slide-level=2 slide.md -o slide.html
EOF
chmod 755 slides/${DIR_NAME}/convert.sh

cat << EOF > slides/${DIR_NAME}/slide.md
% Title
% Name
% Date

# Main Slide 1

---

### Sub Page

- list
- list

# Main Slide 2

---

### Sub Slide

1. list
1. list

EOF
