#/bin/bash

FILE=$(pwd)/manifest.json
if [ -f "$FILE" ]; then
    CURRENT=$(pwd)
    DIRS=(${CURRENT//\// })
    EXTENSION=${DIRS[${#DIRS[@]} - 1]}
    echo "Packing files to $EXTENSION.zip"
    # zip -r -FS ../$EXTENSION.zip * --exclude '*.git*'.
fi