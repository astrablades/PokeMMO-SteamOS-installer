#!/bin/bash

# made by astra#0017
# i know i shouldnt want credit for this shit but it was fun

clear

echo -e "press enter for: /home/deck/Documents/PokeMMO/\ncustom install location:"
read location

if [ "$location" = "" ];
then
    location="/home/deck/Documents/PokeMMO"
else
    echo "Custom install location set as: $location"
    read
fi

# kids please dont do it like this
jdkfile="openjdk-19.0.1_linux-x64_bin.tar.gz"
pokemmofile="PokeMMO-Client.zip"

# this is probabl ok but still shit

# currently broken, i fucking wonder why
# dont do it like this either
#curl "https://pokemmo.com/download_file/1/" > $pokemmofile && unzip -d $location $pokemmofile



unzip -d $location $pokemmofile
wget "https://download.java.net/java/GA/jdk19.0.1/afdd2e245b014143b62ccb916125e3ce/10/GPL/openjdk-19.0.1_linux-x64_bin.tar.gz" && tar -xf $jdkfile -C $location
rm $pokemmofile $jdkfile



echo """
#!/bin/sh

os_flags=''

case `uname`' in
  Darwin* )
    # GLFW/LWJGL3 limitation for macOS
    os_flags='-XstartOnFirstThread'
    ;;
esac

# PokeMMO requires that the working directory be that of all game files (PokeMMO.exe / data / roms / etc.)
# `cd` to this directory prior to executing this script, or include your `cd` below.

# PokeMMO currently requires JDK 17.
# Consult your distro's documentation for how to install the OpenJDK 17 Java Runtime Environment

'$location/jdk-19.0.1/bin/java' -Xmx384M $os_flags -Dfile.encoding='UTF-8' -cp PokeMMO.exe com.pokeemu.client.Client

""" > $location/PokeMMO.sh
