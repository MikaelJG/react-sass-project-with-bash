#!/bin/bash

DATE=$(date +%Y-%m-%d)
DIR=$(pwd)
COMPONENTS=( "alert" "avatar" "banner" "button" "btn" "card" "cardcategory" "cardcat" "cardproduct" "cardprod" "cardgrid" "cardtrip" "cards" "footer" "navbar" "nav" "bar" "notification" "notif" "searchform" "form" "tabs")
ARG_ARRAY=( "$@" )

NPX_INSTALL() {
    npx create-react-app $NOM_DU_PROJET

    cd "${DIR}/$NOM_DU_PROJET"

    # change App.js
    sed -i '/<header/,/<\/header>/d' ./src/App.js
    # change la page landing par default
    sed -i '/className="App"/d' ./src/App.js
    sed -i '/import/,/.css.;/d' ./src/App.js

    rm -f ./src/index.css
    touch ./src/index.css
}

SASS_INSTALL() {
    echo "installing SASS"
    sleep 3
    # installing sass with yarn, not npm
    yarn add sass

    mv ./src/App.css ./src/App.scss

    sed -i "s/css/scss/" ./src/App.js
    echo "to use a component, add @use './shared.scss'; to App.js"
}

BONES_DEFAULT() {
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

    echo "------------------ CREATION DU FICHIER VARIABLES.SCSS ------------------"
    sleep 3 

    mkdir ./src/components

    # créer les fichiers de components de bases
    touch ./src/components/Navbar.js ./src/components/Content.js ./src/components/Footer.js
    # créer le fichier _variables.scss dans le dossier components
    touch ./src/components/_variables.scss
    
    echo "
    // COLORS //
    
    \$white: #ffffff;
    
    \$black: #151515;
    " > ./src/components/_variables.scss
}

MATERIAL_UI_INSTALL() {
    echo "------------------ INSTALLATION DE MATERIAL UI ------------------"
    sleep 3 
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
}

FOR_WANTED() {
    for i in "${ARG_ARRAY[@]}";
        do
            echo "in for arg array, $i is in too"

            # header should always be first in the array
            # footer should always be last in the array

            # case if footer, last in array.
            # case if header, first in array.

            # for every in array, 
            # case statement

            # is this nice to have ???

            # we can give the order !!! 
    done
}

read -p "Nom du projet : " NOM_DU_PROJET

if [ $# -eq 0 ];
    then

    NPX_INSTALL
    SASS_INSTALL
    BONES_DEFAULT
    MATERIAL_UI_INSTALL
    
    echo "------------------ IMPORTATION DU FICHIER VARIABLES.SCSS ------------------"
    sleep 3
    # écrire @import './components/variables' dans le fichier _variables.scss
    echo "@import './components/variables';" > ./src/App.scss

elif [ $# -eq 1 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] ;
    then
        echo "in elif 1 arg";


elif [ $# -eq 2 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] && [[ " ${COMPONENTS[*]} " =~ " $2 " ]] ;
    then
        echo "in elif 2 args";
        FOR_WANTED

elif [ $# -eq 3 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] && [[ " ${COMPONENTS[*]} " =~ " $2 " ]] && [[ " ${COMPONENTS[*]} " =~ " $3 " ]] ;
    then
        echo "in elif 3 args";
        FOR_WANTED

elif [ $# -eq 4 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] && [[ " ${COMPONENTS[*]} " =~ " $2 " ]] && [[ " ${COMPONENTS[*]} " =~ " $3 " ]] && [[ " ${COMPONENTS[*]} " =~ " $4 " ]] ;
    then
        echo "in elif 4 args";
        FOR_WANTED

elif [ $# -eq 5 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] && [[ " ${COMPONENTS[*]} " =~ " $2 " ]] && [[ " ${COMPONENTS[*]} " =~ " $3 " ]] && [[ " ${COMPONENTS[*]} " =~ " $4 " ]] && [[ " ${COMPONENTS[*]} " =~ " $5 " ]] ;
    then
        echo "in elif 5 args";
        FOR_WANTED
        

elif [ $# -eq 6 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] && [[ " ${COMPONENTS[*]} " =~ " $2 " ]] && [[ " ${COMPONENTS[*]} " =~ " $3 " ]] && [[ " ${COMPONENTS[*]} " =~ " $4 " ]] && [[ " ${COMPONENTS[*]} " =~ " $5 " ]]  && [[ " ${COMPONENTS[*]} " =~ " $6 " ]] ;
    then
        echo "in elif 6 args";
        FOR_WANTED

elif [ $# -eq 7 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] && [[ " ${COMPONENTS[*]} " =~ " $2 " ]] && [[ " ${COMPONENTS[*]} " =~ " $3 " ]] && [[ " ${COMPONENTS[*]} " =~ " $4 " ]] && [[ " ${COMPONENTS[*]} " =~ " $5 " ]] && [[ " ${COMPONENTS[*]} " =~ " $6 " ]] && [[ " ${COMPONENTS[*]} " =~ " $7 " ]];
    then
        echo "in elif 7 args";
        FOR_WANTED

elif [ $# -eq 8 ] && [[ " ${COMPONENTS[*]} " =~ " $1 " ]] && [[ " ${COMPONENTS[*]} " =~ " $2 " ]] && [[ " ${COMPONENTS[*]} " =~ " $3 " ]] && [[ " ${COMPONENTS[*]} " =~ " $4 " ]] && [[ " ${COMPONENTS[*]} " =~ " $5 " ]] && [[ " ${COMPONENTS[*]} " =~ " $6 " ]] && [[ " ${COMPONENTS[*]} " =~ " $7 " ]] && [[ " ${COMPONENTS[*]} " =~ " $8 " ]] ;
    then
        echo "in elif 8 args";
        FOR_WANTED

else
    echo "Something went wrong"

fi

# ouvrir VS CODE

# code .

# to run the app on http://localhost:3000
# npm start
