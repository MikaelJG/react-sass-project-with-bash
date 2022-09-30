cd wagon_ui_components 

for f in *; do
    if [ -d "$f" ]; then
                read -p "
Would you like a $f component?" yn
                            case $yn in
                                [Yy]* ) echo "in yes condition" ;;
                                [Nn]* ) echo "in no condition" ;;
                                * ) echo "in else condition";;
                            esac

    fi
done


#echo "do you want this $COMPONENT"?
#    if yes
#        echo HTML + CSS << append
#    if no
#        break;
#    end


