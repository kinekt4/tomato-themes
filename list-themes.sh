#!/usr/bin/env bash

curr_dir=$(pwd)

theme_base_path="${curr_dir}/themes"
zip_base_path="${curr_dir}/zip"

cd "${zip_base_path}"
tree -L 1 .

