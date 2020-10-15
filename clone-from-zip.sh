#!/usr/bin/env bash

curr_dir=$(pwd)
theme_name=$1
new_theme_name=$2

orig_theme_file="theme.css"
theme_file="${theme_name}.css"
theme_base_path="${curr_dir}/themes"
zip_base_path="${curr_dir}/zip"
theme_dir_path="${theme_base_path}/${theme_name}"
new_theme_dir_path="${theme_base_path}/${new_theme_name}"
new_theme_file_path="${new_theme_dir_path}/${orig_theme_file}"
zip_file="${theme_name}.zip"
zip_file_path="${zip_base_path}/${zip_file}"
new_zip_file="${new_theme_name}.zip"
new_zip_file_path="${zip_base_path}/${new_zip_file}"

show_help() {
    echo "Usage:"
    echo "./clone-from-zip.sh <theme-name> <new-theme-name>"
}

if [ -z "${theme_name}" ]; then

    show_help
    exit 1
fi

if [ -z "${new_theme_name}" ]; then

    show_help
    exit 1
fi

if [ ! -f "${zip_file_path}" ]; then

    echo "Theme zip file not found: ${zip_file_path}"
    exit 1
fi

if [ -f "${new_zip_file_path}" ]; then

    echo "Caution: Theme zip file exists"
    echo "Overwriting..."
fi

echo "Copying: ${zip_file_path}"
echo "To: ${new_zip_file_path}"

cp "${zip_file_path}" "${new_zip_file_path}"

if [ ! -d "${new_theme_dir_path}" ]; then

    mkdir -p "${new_theme_dir_path}"

else

    echo "New theme dir exists: ${new_theme_dir_path}"

    read -p "Continue? [y/N] " overwrite_new_dir

    if [ "${overwrite_new_dir}" != 'y' ]; then

        echo "Exit."
        exit 1

    fi

fi

echo "Renaming ${theme_file} to ${orig_theme_file}"
printf "@ ${theme_file}\n@=${orig_theme_file}\n" | zipnote -w "${new_zip_file_path}"

unzip -o "${new_zip_file_path}" -d "${new_theme_dir_path}"

dos2unix "${new_theme_file_path}"

echo "Done."