#!/usr/bin/env bash


LIMIT=10240;

SOURCE_DIR=/home/ozge/scripts
FILES=(  
   "$SOURCE_DIR"/big1.odt
   "$SOURCE_DIR"/big.odt
   "$SOURCE_DIR"/two.odt
   "$SOURCE_DIR"/three.odt
   "$SOURCE_DIR"/big3.odt
   "$SOURCE_DIR"/bigg1.odt
   "$SOURCE_DIR"/one.odt 
)

for i in "${FILES[@]}";
    do
        all=($(du $i)) 
        size=${all[0]} #var2=$(awk '{print $1}' file) 	
        if [[ -f "$i" ]]; then  # Script statements if $FILE exists.
            if [ $size -gt $LIMIT ]; then
                echo "$i size = $size is greater than $LIMIT"
                sudo rm -rf $i && echo "removed"
                echo ""
            else 
                echo "$i size =$size less than 10MB"
                echo ""
            fi
        fi
    done

