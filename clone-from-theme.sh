#!/usr/bin/env bash

curr_dir=$(pwd)
theme_name=$1
new_theme_name=$2

theme_base_path="${curr_dir}/themes"
theme_dir_path="${theme_base_path}/${theme_name}"
new_theme_dir_path="${theme_base_path}/${new_theme_name}"

show_help() {
    echo "Usage:"
    echo "./clone-theme.sh <theme-name> <new-theme-name>"
}

if [ -z "${theme_name}" ]; then

    show_help
    exit 1
fi

if [ -z "${new_theme_name}" ]; then

    show_help
    exit 1
fi

if [ ! -d "${theme_dir_path}" ]; then

    echo "Theme dir not found: ${theme_dir_path}"
    exit 1
    
fi

if [ -d ${new_theme_dir_path} ]; then

    echo "New theme dir exists: ${new_theme_dir_path}"

    read -p "Continue? [y/N] " overwrite_new_dir

    if [ "${overwrite_new_dir}" != 'y' ]; then

        echo "Exit."
        exit 1

    fi

fi

echo "Copying dir: ${theme_dir_path}"
echo "To dir: ${new_theme_dir_path}"

cp -r "${theme_dir_path}" "${new_theme_dir_path}"

echo "Done."