#!/usr/bin/sh

if [[ $1 == "-f" ]]; then
    content=$(cat $2)
elif [[ $1 == "-u" ]]; then
    content=$(curl $2)
elif [[ $1 == "-h" ]]; then
    echo "    COMMAND FLAGS                    USAGE"
    echo
    echo "    depinstaller -f <FILE NAME>      installs dependencies listed on file."
    echo "    depinstaller -u <FILE URL>       installs dependencies listed on url."
    echo
    echo "    DEPENDECY FILES COMANDS          USAGE"
    echo
    echo "    INSTALL   <DEPENDENCY NAME>      installs a dependency."
    echo "    REMOVE    <DEPENDENCY NAME>      uninstalls a dependency."
    echo "    RUN       <COMMAND>              runs a command."
    echo "    UPDATESYS                        updates the OS."
    exit 0
else
    echo "[FLAG ERROR] use the command \"depinstaller -h\" to get help."
    exit 1
fi

declare -A systemUpdaters=(
    ["ID=fedora"]="dnf -y upgrade --refresh"
    ["ID=manjaro"]="yay --noconfirm -Syu"
    ["ID=arch"]="yay --noconfirm -Syu"
    ["ID=elementary"]="apt -y update && apt -y upgrade"
    ["ID=kali"]="apt -y update && apt -y upgrade"
    ["ID=raspbian"]="apt -y update && apt -y upgrade"
    ["ID=zorin"]="apt -y update && apt -y upgrade"
    ["ID=debian"]="apt -y update && apt -y upgrade"
    ["ID=linuxmint"]="apt -y update && apt -y upgrade"
    ["ID=opensuse"]="zypper --non-interactive update"
)

declare -A packageInstaller=(
    ["ID=fedora"]="dnf -y install"
    ["ID=manjaro"]="yay --noconfirm -S"
    ["ID=arch"]="yay --noconfirm -S"
    ["ID=elementary"]="apt -y install"
    ["ID=kali"]="apt -y install"
    ["ID=raspbian"]="apt -y install"
    ["ID=zorin"]="apt -y install"
    ["ID=debian"]="apt -y install"
    ["ID=linuxmint"]="apt -y install"
    ["ID=opensuse"]="zypper --non-interactive install"
)

declare -A packageRemovers=(
    ["ID=fedora"]="dnf -y erase"
    ["ID=manjaro"]="yay --noconfirm -R"
    ["ID=arch"]="yay --noconfirm -R"
    ["ID=elementary"]="apt -y remove"
    ["ID=kali"]="apt -y remove"
    ["ID=raspbian"]="apt -y remove"
    ["ID=zorin"]="apt -y remove"
    ["ID=debian"]="apt -y remove"
    ["ID=linuxmint"]="apt -y remove"
    ["ID=opensuse"]="zypper --non-interactive rm"
)

myOs=$(cat /etc/os-release | grep -E "^ID=[a-z]{1,}")
installer="${packageInstaller[$myOs]}"
remover="${packageRemovers[$myOs]}"
sysUpdater="${systemUpdaters[$myOs]}"

while IFS=' ' read -r command parameter
do
    if [[ $command == "INSTALL" ]]; then
        eval "$installer $parameter"
    elif [[ $command == "REMOVE" ]]; then
        eval "$remover $parameter"
    elif [[ $command == "RUN" ]]; then
        eval "$parameter"
    elif [[ $command == "UPDATESYS" ]]; then
        eval "$sysUpdater"
    fi
done <<< $content
