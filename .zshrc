# Created by newuser for 5.7.1
source ~/powerlevel10k/powerlevel10k.zsh-theme

export PATH=~/.local/bin:/home/maopiccoto/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/opt:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$PATH

#Bind arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ll="lsd -lh --group-dirs=first"
alias la="lsd -lha --group-dirs=first"
alias cat="bat"
source ~/powerlevel10k/powerlevel10k.zsh-theme

#Funcion para crear directorios pentest
function mkt(){
	mkdir {nmap,exploits,content,scripts}
}

#Funcion para explorador de aechivos y comandos en linea
function fzfz(){
 
        if [ "$1" = "h" ]; then
                fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
                        echo {} is a binary file ||
                         (bat --style=numbers --color=always {} ||
                          highlight -O ansi -l {} ||
                          coderay {} ||
                          rougify {} ||
                          cat {}) 2> /dev/null | head -500'
 
        else
                fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
                                 echo {} is a binary file ||
                                 (bat --style=numbers --color=always {} ||
                                  highlight -O ansi -l {} ||
                                  coderay {} ||
                                  rougify {} ||
                                  cat {}) 2> /dev/null | head -500'
        fi
}
#Funcion para compiar los puertos al clipboard desde un archivo grepeable de escaneo
func extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address : $ip_address" >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n" >> extractPorts.tmp
	echo -e $ports | tr -d '\n' | xclip -sel clip
	echo extractPorts.tmp; rm extractPorts.tmp
}

#Poner colores en man
# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

#Guardar historial de comandos
SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.zsh_history

#El fuzzer instala esto solo
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Pluggins manuales
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

