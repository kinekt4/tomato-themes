#!/usr/bin/env bash

theme_name=$1
curr_dir=$(pwd)

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

theme_file="${theme_dir_path}/theme.css"
new_theme_file="${theme_dir_path}/${theme_name}.css"
zip_file="${theme_name}.zip"
zip_file_path="${zip_base_path}/${zip_filetheme_name}"

if [ -f "${zip_file_path}" ]; then

    echo "Caution: Zip file exists"

fi

echo "Creating zip file: ${zip_file_path}"
zip "${zip_file_path}" "${theme_file}"

cd "${zip_base_path}"
echo "Renaming theme.css to ${theme_name}.css"
printf "@ theme.css\n@=$theme_name.css\n"
printf "@ theme.css\n@=$theme_name.css\n" | zipnote -w "${zip_file}"

echo "Done."