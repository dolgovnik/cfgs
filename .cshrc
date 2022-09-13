# .cshrc

set path = ( /sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin /home/nikolay/.local/bin)

if ( -d /usr/X11R6/bin ) then
    set path = ( $path /usr/X11R6/bin )
endif

if ( -d /usr/games ) then
    set path = ( $path /usr/games )
endif

if ( -d $HOME/bin ) then
    set path = ( $HOME/bin $path )
endif

setenv  BLOCKSIZE   K
setenv  EDITOR  vi
if( -X vim ) then
    setenv EDITOR vim
endif
setenv  PAGER       'less -SI'
#if ( -X less ) then
#   setenv PAGER `which less`
#endif

setenv  TMPDIR      /tmp

if ($?prompt) then  # An interactive shell -- set some stuff up

setenv CLICOLOR
# setenv LSCOLORS GxFxcxdxCxegedabagacad
setenv LSCOLORS Exfxcxdxbxegedabagacad
setenv RUBYLIB /usr/local/summa/lib

alias   mv  mv -vi
alias   cp  cp -vi
alias   rm  rm -v
alias   grep    grep -nsi --color

alias   h   history 60
alias   t   ~/todo.txt/todo.sh -d ~/todo.txt/todo.cfg -c
alias   j   jobs -l
alias   l   ls-F
alias   la  l -l
alias   lf  l -FA
alias   ll  l -la
alias   lla ll -a
alias   lt  ll -t
alias   ltr ll -tr
alias   p   pwd
alias   catp    cat '`' which \!:1 '`'
alias   filep   file '`' which \!:1 '`'
alias   vimp    $EDITOR '`' which \!:1 '`'
alias   psu ps -U $user
if( -X sudo ) then
    alias   sd  sudo
endif

alias   .   exit

alias   prompt1 'set prompt = "%B%b%m%B%#%b "'
alias   prompt2 'set prompt = "%n%B@%b%m%B:%b%~%B%#%b "'

alias   dater   perl -e \' print scalar localtime \!:1, \"\\n\" \'

prompt1

set filec
set history = 3000
set savehist = (3000 merge)
set histdup = erase
set mail = (/var/mail/$USER)
set autolist = ambiguous
set nobeep
set color
set colorcat
#setenv LS_COLORS 'di=01;36:ln=01;35'
setenv LS_COLORS 'or=01;36:ln=35:ex=31'
set dunique
set correct = cmd

set killdup = erase

bindkey "^W" backward-delete-word
bindkey "^R" i-search-back
bindkey -k up   history-search-backward
bindkey "^P"    history-search-backward
bindkey -k down history-search-forward
bindkey "^N"    history-search-forward

bindkey "^_"    insert-last-word

#if("${TERM}" == "xterm") then
# "home"
bindkey "^[[7~" beginning-of-line

# M-Left
bindkey '^[^[[D' beginning-of-line

# "end"
bindkey "^[[8~" end-of-line

# M-Right
bindkey '^[^[[C' end-of-line

# C-Left
bindkey '^[Od' backward-word

# C-Right
bindkey '^[Oc' forward-word

# "delete"
bindkey "^[[3~" delete-char-or-list-or-eof

# F1
bindkey '^[[11~' complete-word-fwd
# F2
bindkey '^[[12~' complete-word-back

bindkey '^[q'   complete-word-fwd
bindkey '^[2'   complete-word-fwd
bindkey '^[ ' complete-word-back
bindkey '^[1' complete-word-back

# F1
bindkey '^[[11~' complete-word-fwd
# F2
bindkey '^[[12~' complete-word-back

#bindkey '^[q'  complete-word-fwd
bindkey '^[2'   complete-word-fwd
bindkey '^[ ' complete-word-fwd
bindkey '^[1' complete-word-back
bindkey '^[`' complete-word-back

#endif # TERM==xterm-color

complete {complete,uncomplete}      'p/1/X/'    # Completions only
complete {cd,rmdir}         'p/1/d/'    # Directories only
complete {sudo,sd}          'p/1/c/'
complete which              'n/*/c/'
complete {setenv,unsetenv}      'p/1/e/' 'c/*:/f/'
complete printenv           'p/1/e/'
complete set                'c/*=/f/' 'p/1/s/=' 'n/=/f/'
complete {alias,unalias}        'p/1/a/'

complete {catp,filep,vimp}          'n/*/c/'

if ("${OSTYPE}" == "FreeBSD") then
    set pkgdbdir = '/var/db/pkg'
    alias pkg_ls /bin/ls $pkgdbdir

    complete pkg_info           'n/-W/f/' 'p/*/`pkg_ls`/'
    complete pkg_delete         'p/*/`pkg_ls`/'
    complete sd             'p/1/c/' 'n/pkg_delete/`pkg_ls`/'
    complete pkg_create         'n/-b/`pkg_ls`/'


    if( -x /usr/ports/Tools/scripts/portsearch ) then
        if(-f /var/db/portindex/INDEX) then
            alias portsearch /usr/ports/Tools/scripts/portsearch -f /var/db/portindex/INDEX
        else
            alias portsearch /usr/ports/Tools/scripts/portsearch
        endif
    endif

    complete sysctl 'p/*/`sysctl -AN`/'
endif # FreeBSD

if ("${OSTYPE}" == "linux") then

    if (${?LANG} == 0) then
        setenv LANG ru_RU.KOI8-R
    endif

    alias   du1 du --max-depth=1

    if ( -X apt-cache && -f ~/debian-tcsh.csh ) then
        source ~/debian-tcsh.csh

        alias ainstall  sudo apt-get install
        alias asearch   apt-cache search
    endif
endif

if( -X darcs ) then
    complete darcs \
        'p/1/(initialize get add remove mv whatsnew record unrecord \
            amend-record revert unrevert pull unpull rollback send \
            apply push replace tag setpref diff changes annotate \
            optimize check resolve dist trackdown repair)/' \
        'p/2/f/'
endif

endif # prompt

set localsets = "~/.cshrc.local"
if( -f $localsets ) then
    source $localsets
endif
