#!/usr/bin/env bash

curr_dir=$(pwd)

custom_theme_file="custom.css"

theme_base_path="${curr_dir}/themes"
zip_base_path="${curr_dir}/zip"


find "${zip_base_path}" -type f | while read input_file; do

    base_name=$(basename -- "${input_file}")
    file_name="${base_name%.*}"
    extension="${base_name##*.}"

    # echo "base_name: ${base_name}"
    # echo "file_name: ${file_name}"
    # echo "extension: ${extension}"
    
    theme_file="${file_name}.css"
    zip_file="${file_name}.zip"
    zip_file_path="${zip_base_path}/${zip_file}"

    theme_dir_path="${theme_base_path}/${file_name}"
    theme_file_path="${theme_dir_path}/${custom_theme_file}"

    echo "theme_dir_path: ${theme_dir_path}"

    if [ ! -d "${theme_dir_path}" ]; then

        mkdir -p "${theme_dir_path}"

    fi

    if [ -f "${theme_file_path}" ]; then

        echo "Theme file exists: ${theme_file_path}"

        read -p "Continue? [y/N] " overwrite

        if [ "${overwrite}" != 'y' ]; then

            echo "Skip."
            continue

        fi

    fi

    # echo "Renaming ${theme_file} to ${orig_theme_file}"
    # printf "@ ${theme_file}\n@=${orig_theme_file}\n" | zipnote -w "${zip_file_path}"

    unzip -o "${zip_file_path}" -d "${theme_dir_path}"

    cd "${theme_dir_path}"

    inner_theme_dir_path="${theme_dir_path}/${file_name}"

    if [ -d "${inner_theme_dir_path}" ]; then

        cd "${inner_theme_dir_path}"
        echo "cd ${inner_theme_dir_path}"
        # MOVE DIR CONTENTS TO THEME DIR
        echo "mv ./* ${theme_dir_path}/."
        mv ./* "${theme_dir_path}/."
        # RM INNER DIR
        cd "${theme_dir_path}"
        rm -rf "${inner_theme_dir_path}"

    else

        echo "dir does not exist: ${inner_theme_dir_path}"

    fi

    theme_file_path="${theme_dir_path}/${theme_file}"
    custom_theme_file_path="${theme_dir_path}/${custom_theme_file}"

    if [ -f "${theme_file_path}" ]; then

        echo "theme_file_path: ${theme_file_path}"
        echo "custom_theme_file_path: ${custom_theme_file_path}"

        mv "${theme_file_path}" "${custom_theme_file_path}"
        dos2unix "${custom_theme_file_path}"
    fi

    # printf "@ ${orig_theme_file}\n@=${theme_file}\n" | zipnote -w "${zip_file_path}"

    echo "Extracted."

done

echo "Done."