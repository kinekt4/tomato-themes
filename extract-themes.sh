#!/usr/bin/env bash

curr_dir=$(pwd)

orig_theme_file="theme.css"

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
    theme_file_path="${theme_dir_path}/${orig_theme_file}"

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

        echo "Renaming ${theme_file} to ${orig_theme_file}"
        printf "@ ${theme_file}\n@=${orig_theme_file}\n" | zipnote -w "${zip_file_path}"

        unzip -o "${zip_file_path}" -d "${theme_dir_path}"

        dos2unix "${theme_file_path}"

        echo "Extracted."

    fi

done

echo "Done."