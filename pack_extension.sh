#/bin/bash

FILE=$(pwd)/manifest.json
if [ -f "$FILE" ]; then
    CURRENT=$(pwd)
    DIRS=(${CURRENT//\// })
    EXTENSION=${DIRS[${#DIRS[@]} - 1]}
    OLDFILE="../$EXTENSION.zip"
    if [ -f "$OLDFILE" ]; then
        rm $OLDFILE
    fi
    echo "Packing files to $EXTENSION.zip"
    zip -r -FS ../$EXTENSION.zip * --exclude '*.git*'.
fi