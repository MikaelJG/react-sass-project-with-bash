#!/bin/bash

################### SCRIPT POUR INSTALLER SAAS ###################

#================== avoir le droit d'éxécuter le script : ==================#
#================== chmod +x ./NOM_DU_SCRIPT ==================#

#================== lancer le script : ==================#
#================== ./NOM_DU_SCRIPT.sh ==================#

DATE=$(date +%Y-%m-%d)


read -p "Nom du projet : " NOM_DU_PROJET
mkdir $NOM_DU_PROJET

cd $NOM_DU_PROJET

npm init

sed -i 's/..............\\"Error: no test specified............/"sass": "sass --watch .\/main.scss:.\/public\/style.css/' ./package.json

# créer le fichier index.html, main.scss et script.js
touch index.html main.scss script.js README.md

# écrire <link rel="stylesheet" href="/public/style.css"> dans index.html
echo '<link rel="stylesheet" href="/public/style.css">' > index.html

# écrire <script src="main.js"></script> dans index.html
echo '<script src="main.js"></script>' >> index.html

# ecrire comment

echo "This script was created by Julien Le Mee and Mikael Gonsalves "
echo "$NOM_DU_PROJET was created on $DATE\n
To Test\n\n
Run command: ....\n\n
For Demo\n\n
Visit: **Link**\n\n
Thank You!
" > README.md

# créer le dossier components
mkdir components

# créer le fichier _variables.scss dans le dossier components
touch ./components/_variables.scss

# écrire @import './components/variables' dans le fichier _variables.scss
echo "@import './components/variables';" > main.scss

cd $NOM_DU_PROJET

# Set up GitHub Repo automatically
# gh repo create --private --source=.

code .

npm run sass
