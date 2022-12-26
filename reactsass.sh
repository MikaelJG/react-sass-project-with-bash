#!/bin/bash

DATE=$(date +%Y-%m-%d)
DIR=$(pwd)
COMPONENTS=( "alert" "avatar" "banner" "button" "btn" "card" "cardcategory" "cardcat" "cardproduct" "cardprod" "cardgrid" "cardtrip" "cards" "footer" "navbar" "nav" "bar" "notification" "notif" "searchform" "form" "tabs")

read -p "Nom du projet : " NOM_DU_PROJET

if [ $# -eq 0 ];
    then

    npx create-react-app $NOM_DU_PROJET

    cd "${DIR}/$NOM_DU_PROJET"

    # change App.js
    sed -i '/<header/,/<\/header>/d' ./src/App.js

    # change la page landing par default
    sed -i '/className="App"/d' ./src/App.js

    sed -i '/import/,/.css.;/d' ./src/App.js

    rm -f ./src/index.css

    touch ./src/index.css

    echo "installing SASS"
    
    # installing sass with yarn, not npm
    yarn add sass

    mv ./src/App.css ./src/App.scss

    sed -i "s/css/scss/" ./src/App.js

    echo "to use a component, add @use './shared.scss'; to App.js";

    # créer le dossier components

    echo "------------------ CREATION DU FICHIER VARIABLES.SCSS ------------------"

    sleep 5

    mkdir ./src/components

    # créer les fichiers de components de bases

    touch ./src/components/Navbar.js ./src/components/Content.js ./src/components/Footer.js

# link les components dans index.js
    echo "
    import Navbar from './components/Navbar';
    import Content from './components/Content';
    import Footer from './components/Footer';
    import Button from '@mui/material/Button';
    import './App.scss';
    
    function App() {
        return (
            <div className='App'>
                <Navbar />
                <Content />
                <Footer />
                <Button variant=\"contained\"
                    onClick={() => {
                      alert('clicked');
                    }}
                  > Hello Julien!</Button>
            </div>
        )
    }
    
    export default App;
    " > ./src/App.js
    
    
    echo "------------------ INSTALLATION DE MATERIAL UI ------------------"

    sleep 5
    
    npm install @mui/material @emotion/react @emotion/styled
    
    echo "
    function Content() {
      return (
          <div className='Content'>
              <p> This is my Content</p>
          </div>
      )
    }
    
    export default Content;
    " > ./src/components/Content.js
    
    echo "
    function Navbar() {
      return (
          <div className='Navbar'>
              <p> This is my Navbar</p>
          </div>
      )
    }
    
    export default Navbar;
    " > ./src/components/Navbar.js
    
    echo "
    function Footer() {
      return (
          <div className='Footer'>
              <p> This is my Footer</p>
          </div>
      )
    }
    
    export default Footer;
    " > ./src/components/Footer.js
    
    # créer le fichier _variables.scss dans le dossier components
    touch ./src/components/_variables.scss
    
    echo "
    // COLORS //
    
    \$white: #ffffff;
    
    \$black: #151515;
    " > ./src/components/_variables.scss
    
    echo "------------------ IMPORTATION DU FICHIER VARIABLES.SCSS ------------------"
    
    # écrire @import './components/variables' dans le fichier _variables.scss
    echo "@import './components/variables';" > ./src/App.scss

elif [ $# -eq 1 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] ;
    then
        echo "in elif";

# know number of args
# --------------------
# take all args and create an array. 
# loop through args_arrays
# for every in args arrays, check if in components array.
# if in components array, 
# create app with component
#
# else echo " $arg is not a component " 

else
    echo "Something went wrong"

fi

# ouvrir VS CODE

# code .

# to run the app on http://localhost:3000
# npm start
