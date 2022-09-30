cd wagon_ui_components 

for f in *; do
    if [ -d "$f" ]; then
                read -p "
Would you like a $f component in your index.html?" yn
                            case $yn in
                                [Yy]* )
                                    chmod +x $f.sh;
                                    ./$f.sh;;
                                [Nn]* ) echo "$f was not added to you html" ;;
                                * ) echo "Please answer with Yy [yes] or Nn [no]";;
                            esac

    fi
done

