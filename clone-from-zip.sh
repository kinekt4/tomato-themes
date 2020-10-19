#!/usr/bin/env bash

curr_dir=$(pwd)
theme_name=$1
new_theme_name=$2

custom_theme_file="custom.css"
theme_file="${theme_name}.css"
theme_base_path="${curr_dir}/themes"
zip_base_path="${curr_dir}/zip"
theme_dir_path="${theme_base_path}/${theme_name}"
new_theme_dir_path="${theme_base_path}/${new_theme_name}"
new_theme_file_path="${new_theme_dir_path}/${custom_theme_file}"
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

# echo "Renaming ${theme_file} to ${orig_theme_file}"
# printf "@ ${theme_file}\n@=${orig_theme_file}\n" | zipnote -w "${new_zip_file_path}"

# UNZIP ZIP FILE TO DIR
unzip -o "${new_zip_file_path}" -d "${new_theme_dir_path}"

# CHANGE TO THEM DIR
cd "${new_theme_dir_path}"
# CHECK IF ZIP FILE CONTAINS DIR
# zip_dir=$(zipnote "${new_zip_file_path}" | head -n 1 | grep -o -E "([a-z0-9_.-]+)/$")
# IF CONTAINS DIR

# echo "zip_dir: ${zip_dir}"
# echo "pwd: $(pwd)"

inner_theme_dir_path="${new_theme_dir_path}/${theme_name}"

if [ -d "${inner_theme_dir_path}" ]; then

    cd "${inner_theme_dir_path}"
    echo "cd ${inner_theme_dir_path}"
    # MOVE DIR CONTENTS TO THEME DIR
    echo "mv ./* ${new_theme_dir_path}/."
    mv ./* "${new_theme_dir_path}/."
    # RM INNER DIR
    cd "${new_theme_dir_path}"
    rm -rf "${inner_theme_dir_path}"

else

    echo "dir does not exist: ${inner_theme_dir_path}"
fi

theme_file_path="${new_theme_dir_path}/${theme_file}"
custom_theme_file_path="${new_theme_dir_path}/${custom_theme_file}"

if [ -f "${theme_file_path}" ]; then

    mv "${theme_file_path}" "${custom_theme_file_path}"
    dos2unix "${custom_theme_file_path}"
fi

# printf "@ ${orig_theme_file}\n@=${theme_file}\n" | zipnote -w "${new_zip_file_path}"

echo "Done."