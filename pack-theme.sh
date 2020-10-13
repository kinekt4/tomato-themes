#!/usr/bin/env bash

theme_name=$1
curr_dir=$(pwd)

theme_base_path="${curr_dir}/themes"
theme_dir_path="${theme_base_path}/${theme_name}"
zip_base_path="${curr_dir}/zip"
zip_dir_path="${zip_base_path}/${theme_name}"

show_help() {
    echo "Usage:"
    echo "./pack-theme.sh <theme-name>"
}

if [ -z "${theme_name}" ]; then

    show_help
    exit 1
fi

if [ ! -d "${theme_dir_path}" ]; then

    echo "Theme dir not found: ${theme_dir_path}"
    exit 1
fi

if [ ! -d "${zip_dir_path}" ]; then

    echo "Zip dir does not exist: ${zip_dir_path}"
    echo "Creating..."
    mkdir -p "${zip_dir_path}"
fi

theme_file="${theme_dir_path}/theme.css"
zip_file="${zip_dir_path}/${theme_name}.zip"

if [ -f "${zip_file}" ]; then

    echo "Zip file exists: ${zip_file}"
    echo "Overwriting..."

else

    echo "Creating zip file..."

fi

zip "${zip_file}" "${theme_file}"

echo "Renaming theme.css to ${theme_name}.css"
printf "@ theme.css\n@=$theme_name.css\n"
printf "@ theme.css\n@=$theme_name.css\n" | zipnote -w "${zip_file}"

echo "Done."