# tomato-themes
Tomato Firmware Themes

The aims of this project:

* To self-host themes currently hosted on: https://tomatothemebase.eu
* To provide a space for theme designers to easily contribute new designs

## Usage

Package requirements to run scripts:

* bash (Tested on WSL2 Ubuntu)
* zip
* unzip
* dos2unix

### Clone from Zip

Clones from a current theme zip file. Do this to work on a theme based off another theme.

    ./clone-from-zip.sh <theme-name> <new-theme-name>
    
### Pack Theme File

Packs theme file into TTB (TomatoThemeBase) standard. Do this once you are ready to publish.

    ./pack-theme.sh <theme-name>

### Router Theme Admin

In a compatible router that supports TTB (TomatoThemeBase), go to the Administration page and set the following:

    Color Scheme: Online From TTB
    TTB theme name: advanced_v2_dark (for example)
    TTB URL: https://github.com/kinekt4/tomato-themes/raw/main/zip
