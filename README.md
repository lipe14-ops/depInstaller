# depInstaller

a simple dependencies installer and easy to use.

## installation:
```txt
git clone https://github.com/lipe14-ops/depInstaller
cd depInstaller
make install
```
## usage:
first you need to create a `.deps` file. and write the command and your dependency name on it. Example:

```txt
INSTALL discord
INSTALL spotify
INSTALL obs-studio
INSTALL nodejs
INSTALL npm
INSTALL pip
INSTALL neovim
INSTALL vim
```
run the following command `depinstaller -f <FILENAME>` and all you dependencies will be installed.

it is possible download files from web just passing the file url and the `-u` flag. Example: `depinstaller -u www.url.com`

## uninstall:
```txt
cd depInstaller
make remove
```
the file will be removed from `/usr/bin/` directory.

## author
<img width='100' height='100' style="border-radius:50%; padding:15px" src="https://avatars.githubusercontent.com/u/78698099?v=4" /></br>
<a href="https://github.com/lipe14-ops" style='padding: 15px' title="Rocketseat">Filipe Soares :computer:</a>
<p style='padding: 15px'>made with :heart: by <strong>Filipe</strong> :wave: reach me!!!</p>


[![](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](fn697169@gmail.com)
[![](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/filipe_1408/)
