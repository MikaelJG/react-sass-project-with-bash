#!/bin/bash

DATE=$(date +%Y-%m-%d)

read -p "Nom du projet : " NOM_DU_PROJET

npx create-react-app $NOM_DU_PROJET

DIR=`pwd`

cd "${DIR}/$NOM_DU_PROJET"

while true; do
    read -p "
    ##############################
    ##############################

    Need framer-motion to animate?

    ##############################
    ##############################

    >" yn
        case $yn in
                [Yy]* ) npm i framer-motion; break;;
                [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
        esac
done


while true; do
    read -p "
    ##############################
    ##############################

    Want the default landing page?

    ##############################
    ##############################

    >" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* )
            # change App.js
            sed -i '/<header/,/<\/header>/d' ./src/App.js;

            # change la page landing par default
            sed -i '/className="App"/d' ./src/App.js;

            sed -i '/import/,/.css.;/d' ./src/App.js; break;;

            * ) echo "Please answer yes or no.";;
        esac
done


# echo 'import { motion } from "framer-motion";' > ./src/App.js

rm -f ./src/index.css

touch ./src/index.css

# change index.css in src

../mod_index.sh $NOM_DU_PROJET

# to run the app on http://localhost:3000
# npm start
