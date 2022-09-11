#!/usr/bin/sh

myOs=$(cat /etc/os-release | grep -E "^ID=[a-z]{1,}")

declare -A osInstallers=(
    ["ID=fedora"]="dnf -y install"
    ["ID=manjaro"]="yay --noconfirm -S"
    ["ID=arch"]="yay --noconfirm -S"
    ["ID=elementary"]="apt -y install"
    ["ID=kali"]="apt -y install"
    ["ID=raspbian"]="apt -y install"
    ["ID=zorin"]="apt -y install"
    ["ID=debian"]="yes | dpkg -i"
    ["ID=linuxmint"]="yes | dpkg -i"
    ["ID=opensuse"]="zypper --non-interactive install"
)

installer="${osInstallers[$myOs]}"

if [[ $1 == "-f" ]]; then
    content=$(cat $2)
elif [[ $1 == "-u" ]]; then
    content=$(curl $2)
else
    echo "flag error"
    exit 1
fi

while read -r line; do
    command=$(echo $line | grep -Po "^[A-Z]{1,}")
    parameter=$(echo $line | grep -Po "[a-zA-Z0-9]{1,}$")

    if [[ $command == "INSTALL" ]]; then
        eval "$installer $parameter"
    fi
done <<< $content
