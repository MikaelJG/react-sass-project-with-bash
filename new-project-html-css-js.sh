#!/bin/bash

################### SCRIPT POUR LANCER UN PROJET SIMPLE ###################

#================== avoir le droit d'éxécuter le script : ==================#
#================== chmod +x ./NOM_DU_SCRIPT ==================#

#================== lancer le script : ==================#
#================== ./NOM_DU_SCRIPT.sh ==================#


read -p "Nom du projet : " NOM_DU_PROJET
mkdir $NOM_DU_PROJET

cd $NOM_DU_PROJET

# créer le fichier index.html, style.css et script.js
touch index.html style.css script.js

# écrire le squeltte de base du html et lier le css et le javascript
echo '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>Document</title>
</head>
<body>

  <h1>Hello</h1>

<script src="script.js"></script>
</body>
</html>' > index.html

code .
