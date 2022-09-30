
for f in /wagon_ui_components; do
    if [ -d "$f" ]; then
        echo "$f" 
        # $f is a directory
    fi
done


#echo "do you want this $COMPONENT"?
#    if yes
#        echo HTML + CSS << append
#    if no
#        break;
#    end


