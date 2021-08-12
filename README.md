# Linux Proficient Environent SetUp 

## -------------- BSPWM + SXHKD ---------------------- 

### 1. Setup Inicial Dependencies 
```bash
sudo apt update
apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

sudo parrot-upgrade

sudo apt update

```
### 2. KanguBuilding and Installing 
```bash
sudo apt-get install bspwm -y
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git 
cd bspwm && make && sudo make install 
cd ../sxhkd && make && sudo make install 
```
### 3. Running bspwm 
```bash
$ mkdir -p ~/.config/{bspwm,sxhkd} 
$ cp /uAv er sr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/ 
$ cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/ 
$ chmod u+x ~/.config/bspwm/bspwmrc 
```
## Configurar .xinitr en ~
```bash
$ echo "sxhkd &" >> .xinitrc
$ echo "exec bspwm" >> .xinitrc
$ chmod +x .xinitrc
```
## ------------------   Polybar  ----------------------

Hasta ahora la version 3.4.0 es la version buena
```bash
$ wget https://github.com/jaagr/polybar/releases/download/3.4.0/polybar-3.4.0.tar
$ tar -xvf polybar-3.4.0.tar
```
## Instalar dependencias
```bash
$ apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
$ apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
```
## Build from source

Dentro del directorio Polybar
```bash
$ mkdir build
$ cd build
$ cmake ..
$ make -j$(nproc)
$ sudo make install
```
## -------------- Fuentes ------------
```Bash
$ cd /usr/share/fonts/
$ sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip
$ sudo unzip Hack.zip -d HackNerd
$ sudo fc-cache -v -t
```
## -------------- Mas plugins --------------
```bashs
$ sudo apt-get install rofi -y
$ sudo apt-get install feh -y
$ sudo apt-get install compton -y
```
## ------------- Mas archivos --------------
```bashs
$ cd
$ touch .zsh_histfile
```

