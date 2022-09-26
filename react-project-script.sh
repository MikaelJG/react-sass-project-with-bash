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

# ../mod_index.sh $NOM_DU_PROJET

echo "installing SASS"

yarn add sass

mv ./src/App.css ./src/App.scss

sed -i "s/css/scss/" ./src/App.js

echo "to use a component, add @use './shared.scss'; to App.js";

# créer le dossier components

echo "------------------ CREATION DU FICHIER VARIABLES.SCSS ------------------"

mkdir components

# créer les fichiers de components de bases
touch ./components/Navbar.js ./components/Content.js ./components/Footer.js

# link les components dans index.js
echo "import Navbar from '../components/Navbar'
import Content from '../components/Content'
import Footer from '../components/Footer'
import './App.scss'

export default function App() {
    return (
        <div className='App'>
            <Navbar />
            <Content />
            <Footer />
        </div>
    )
}" >> ./src/App.js

# créer le fichier _variables.scss dans le dossier components
touch ./components/_variables.scss

echo "------------------ IMPORTATION DU FICHIER VARIABLES.SCSS ------------------"

# écrire @import './components/variables' dans le fichier _variables.scss
echo "@import './components/variables';" > ./src/App.scss

# to run the app on http://localhost:3000
npm start
