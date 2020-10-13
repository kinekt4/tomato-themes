#!/usr/bin/env bash

curr_dir=$(pwd)
theme_name=$1

theme_base_path="${curr_dir}/themes"
theme_dir_path="${theme_base_path}/${theme_name}"
zip_base_path="${curr_dir}/zip"

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

theme_file="theme.css"
# theme_file_path="${theme_dir_path}/${theme_file}"
new_theme_file="${theme_name}.css"
# new_theme_file_path="${theme_dir_path}/${new_theme_file}"
zip_file="${theme_name}.zip"
zip_file_path="${zip_base_path}/${zip_file}"

if [ -f "${zip_file_path}" ]; then

    echo "Caution: Zip file exists"
    echo "Overwriting..."

fi

echo "Creating zip file: ${zip_file_path}"
cd "${theme_dir_path}"
zip "${zip_file_path}" "${theme_file}"

echo "Renaming ${theme_file} to ${new_theme_file}"
printf "@ ${theme_file}\n@=${new_theme_file}\n" | zipnote -w "${zip_file_path}"

echo "Done."