#!/bin/bash
# get prefix from input
OBJ=$1
OBJ="$(tr '[:lower:]' '[:upper:]' <<< ${OBJ:0:1})${OBJ:1}"

# cd to directory where application is located
TARGET_DIR=$(find . -type f -name '*Application.java' | sed -r 's|/[^/]+$||' |sort |uniq)
echo $TARGET_DIR
cd $TARGET_DIR

# get package name
PACKAGE_PREFIX=$(echo $TARGET_DIR | sed 's/.*java//')
PACKAGE_PREFIX=$(echo "$PACKAGE_PREFIX" | tr / .)
PACKAGE_PREFIX=${PACKAGE_PREFIX:1}

# declare files and directories to create
FILES_TO_CREATE=("" Controller Service Repository)
DIRS_TO_CREATE=(models controllers services repositories)

# create directories
mkdir "${DIRS_TO_CREATE[@]}"

# create files and directories
printf "creating files:\n"

for i in "${!DIRS_TO_CREATE[@]}"; do
    DIR=${DIRS_TO_CREATE[$i]}
    F_SUFFIX=${FILES_TO_CREATE[$i]}
    CLASS_NAME="${OBJ}${F_SUFFIX}"
    F_NAME="${DIR}/${OBJ}${F_SUFFIX}.java" 
    PACKAGE_NAME="${PACKAGE_PREFIX}.${DIR}"

    # insert boilerplate
    echo -e "package $PACKAGE_NAME;\n" > $F_NAME
    
    # insert imports and annotations
    if [ $i -gt 0 ]
    then
        echo -e "import org.springframework.stereotype.$F_SUFFIX;\n" >> $F_NAME;
        if [ $i -gt 0 ] && [ $i -lt 3 ]
        then
            echo "import org.springframework.beans.factory.annotation.Autowired;" >> $F_NAME;
            NEXT_DIR=${DIRS_TO_CREATE[$i+1]}
            NEXT_SUFFIX=${FILES_TO_CREATE[$i+1]}
            NEXT_CLASS_NAME=${OBJ}${NEXT_SUFFIX}
            echo -e "import $PACKAGE_PREFIX.$NEXT_DIR.$NEXT_CLASS_NAME;\n" >> $F_NAME;
        fi
        echo "@$F_SUFFIX" >> $F_NAME
    fi
    echo "public class ${CLASS_NAME} {" >> $F_NAME

    # insert autowired dependency 
    if [ $i -gt 0 ] && [ $i -lt 3 ]
    then
        DEPENDENCY=${OBJ}${FILES_TO_CREATE[$i+1]}
        echo -e "\n\t@Autowired" >> $F_NAME
        echo -e "\tprivate $DEPENDENCY ${DEPENDENCY,};" >> $F_NAME
    fi
    echo -e "\n}" >> $F_NAME
    
    printf ">>> $F_NAME"
    printf "\n"
done