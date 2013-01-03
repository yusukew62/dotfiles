# ===============================================================
# Filename: $HOME/.bashrc
# Purpose: Setup file for program " bash "
# Last Update: 2013.01.01
# Author: Yusuke Watanabe < yusuke.w62@gmail.com >
# ===============================================================

# ===============================================================
# init program
# ===============================================================
if [ $SHLVL = 1 ];then
    screen
fi

# ===============================================================
# export statements
# ===============================================================
export EDITOR='vim'
export TERM='xterm-256color'
export CLICOLOR=true
export GREP_OPTION='--color=auto'
export PS1='[\u@\h \W]\$ '
export HISTCONTROL=ignoredups
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTIGNORE=history:pwd:ls
# MacPorts Installer addition on 2012-10-24_at_00:17:24:
# adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# ===============================================================
# key stroke
# ===============================================================
#set -o emacs
set -o vi

# ===============================================================
# key bind
# ===============================================================
bind C-a:beginning-of-line
bind C-e:end-of-line
bind C-f:forward-char
bind C-b:backward-char
bind C-l:clear-screen
bind C-p:previous-history
bind C-n:next-history
bind C-d:delete-char
bind C-k:kill-line

# ===============================================================
# visual
# ===============================================================
# ls colors
#
# no  0       テキスト
# fi  0       ファイル
# di  32      ディレクトリ
# ln  36      シンボリックリンク
# pi  31      名前付きパイプ(FIFO)
# so  33      ソケット
# bd  44;37   ブロックデバイス
# cd  44;37   キャラクタデバイス
# ex  35      実行可能ファイル
# mi  なし    不明のファイル(デフォルトはfiと同じ)
# or  なし    リンク切れのシンボリックリンク(デフォルトはlnと同じ)
#
# 0   デフォルト状態
# 1   強調
# 4   下線
# 5   点滅
#
# 黒      30  40
# 赤      31  41
# 緑      32  42
# 黄(茶)  33  43
# 青      34  44
# 紫      35  45
# シアン  36  46
# 白(灰)  37  47


export LS_COLORS
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36'

# ===============================================================
# alias
# ===============================================================
alias ls="ls -FG"
alias grep="grep --color=always"

