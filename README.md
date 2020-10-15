# tomato-themes
Tomato Firmware Themes

The aims of this project:

* To self-host themes currently hosted on: https://tomatothemebase.eu (TTB)
* To provide a space for theme designers to easily contribute new designs

## Requirements

Package requirements to run scripts:

* bash (Tested on WSL2 Ubuntu)
* zip
* unzip
* dos2unix

## Scripts

* List themes
* Clone from zip
* Clone from theme
* Pack theme
* Get themes from TBB

### List Themes

At the moments it's just listing the zip files

    ./list-themes.sh

### Clone from Zip

Clones from a current theme zip file. Do this to work on a theme based off another theme.

    ./clone-from-zip.sh <theme-name> <new-theme-name>
    
### Clone from Theme

Clones from a current theme. Do this to work on a theme based off another theme.

    ./clone-from-theme.sh <theme-name> <new-theme-name>
    
### Pack Theme File

Packs theme file into TTB standard. Do this once you are ready to publish.

    ./pack-theme.sh <theme-name>
    
### Get Themes From TTB

Get themes from TTB and place them in the ./zip dir

    ./get-themes.sh

## Router Theme Admin

In a compatible router that supports TTB (TomatoThemeBase), go to the Administration page and set the following:

    Color Scheme: Online From TTB
    TTB theme name: advanced_v2_dark (for example)
    TTB URL: https://github.com/kinekt4/tomato-themes/raw/main/zip
