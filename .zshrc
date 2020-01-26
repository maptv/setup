
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# TERM=xterm-256color
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
# SABLE_AUTO_TITLE="true"

POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\uf0da'
POWERLEVEL9K_VCS_GIT_ICON='\ue60a'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='11'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='09'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs vcs dir time ram virtualenv anaconda battery)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_TIME_FORMAT="%D{%Y-%m-%d \uf073 %H:%M}" # \uf017 = clock

POWERLEVEL9K_STATUS_VERBOSE=false
#https://github.com/bhilburn/powerlevel9k
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "

POWERLEVEL9K_DIR_HOME_BACKGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="cyan"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="magenta"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='white'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='black'

POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='red'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='black'
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# fasd # I don't think this plugin does anything useful: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fasd
# fd # Adds completion for fd: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/fd/_fd
# fzf # enables fzf fuzzy auto-completion and key bindings: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
# git # I don't think this plugin does anything useful: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# github # TODO Replace these functions with alises: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github
# ripgrep # Adds completion for ripgrep: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ripgrep
# tmux # I don't think this plugin does anything useful: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='/usr/local/bin/vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Inititialize fasd and its aliases
eval "$(fasd --init auto)"

alias 0="directory=$(echo '$(dirs -v | cut -c3- | sed s+~+$HOME+ | fzf --delimiter=/ --preview="exa --all --classify --color=always -L=2 -T {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && cd $(echo '$directory')"
alias a="git add"
alias aa="func() { local files; files=$(echo '$(git status -s | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --nth=2.. --no-sort --preview="if [ \$(git ls-files --other --exclude-standard {2..} | sed s/\ //g) ]; then; git diff HEAD --color=always --color-words --no-index -- /dev/null {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; else; git diff HEAD --color=always --color-words {2..} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always; fi" --preview-window="70%" --reverse | cut -c4-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git add $(echo '$@') --; }; func"
alias aca="git add --all && git commit --amend"
alias acam="func() { git add --all && git commit --amend -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias acamp="func() { git add --all && git commit --amend -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias acap="git add --all && git commit --amend && git push --force"
alias acar="git add --all && git commit --amend --reuse-message=HEAD --reset-author"
alias acarp="git add --all && git commit --amend --reuse-message=HEAD --reset-author && git push --force"
alias ac="git add --all && git commit"
alias acm="func() { git add --all && git commit -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias acmp="func() { git add --all && git commit -m \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias acp="git add --all && git commit && git push"
alias acr="git add --all && git commit --reuse-message=HEAD --reset-author"
alias acrp="git add --all && git commit --reuse-message=HEAD --reset-author && git push"
alias ai="git add --interactive"
alias b="git branch"
alias ba="git branch -a"
alias bb="func() { local branch; branch=$(echo '$(git branch --color=always -v | fzf --ansi --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --no-sort --preview="git diff --color=always \$(echo \$(git rev-parse --abbrev-ref HEAD)..{2}) | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse | cut -c3- | cut -d " " -f1)') && [ $(echo '$branch') ] && git checkout $(echo '$branch'); }; func"
alias br="git branch -r"
alias c="func() { git clone $(echo '$1 ${1#*.*/}') && cd $(echo '${1#*.*/}'); }; func";
alias ca="git commit -a"
alias caa="git commit --amend -a"
alias car="git commit -a --reuse-message=HEAD --reset-author"
alias caam="func() { git commit --amend -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias caamp="func() { git commit --amend -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias caap="git commit --amend -a && git push --force"
alias caar="git commit --amend -a --reuse-message=HEAD --reset-author"
alias caarp="git commit --amend -a --reuse-message=HEAD --reset-author && git push --force"
alias cam="func() { git commit -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\"; }; func";
alias camp="func() { git commit -am \"$(echo '${*:-Changed files: $(echo $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " "))}')\" && git push; }; func";
alias cap="git commit -a && git push"
alias carp="git commit -a --reuse-message=HEAD --reset-author && git push"
alias cc="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(yellow)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --nth=1,2,4..-2 --no-sort --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" --reverse | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git checkout $(echo '$commit -- $@') }; func"
alias cm="func() { git commit -m \"$(echo '${*:-Changed files: $(git status --porcelain | grep -v "?" | cut -c4- | tr "\n" " ")}')\"; }; func";
alias cf="git clean -f"
alias cfd="git clean -fd"
alias cn="git clean -n"
alias cnd="git clean -nd"
alias co="git checkout"
alias cob="git checkout -b"
alias coh="func() { git checkout $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias com="git checkout master"
alias d="git diff --word-diff=color"
alias dw="git diff --word-diff=color"
alias dl="git diff --word-diff=color"
alias dd="func() { local commit; commit=$(echo '$(git log --color=always --format="%C(yellow)%>(12,trunc)%ar %Creset%s %Cred%D %Cgreen%cn %Cblue%h" --graph -- $@ | fzf --ansi --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --nth=1,2,4..-2 --no-sort --preview="git show --color=always {-1} -- $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="55%" --reverse | rev | cut -d " " -f1 | rev)') && [ $(echo '$commit') ] && git diff $(echo '$commit -- $@') }; func"
alias ds="git diff --word-diff=color --cached" # --staged is a synonym of --cached
alias dh="func() { git diff --word-diff=color $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias dc="git difftool -yt code --extcmd 'code --wait --diff'"
alias dcs="git difftool -yt code --extcmd 'code --wait --diff' --cached" # --staged is a synonym of --cached
alias dn="git difftool -yt nvim --extcmd 'nvim -d'"
alias dns="git difftool -yt nvim --extcmd 'nvim -d' --cached" # --staged is a synonym of --cached
alias du="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias dus="git difftool -yt nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached" # --staged is a synonym of --cached
alias dt="git difftool -yt vimdiff" # difftool is dt to match mergetool (mt)
alias dts="git difftool -yt vimdiff --cached" # --staged is a synonym of --cached
# alias dp="git difftool -yt pycharm --extcmd 'pycharm diff $LOCAL $REMOTE'"
# alias dps="git difftool -yt pycharm --extcmd 'pycharm diff'"
alias e="export"
# use fasd builtin f alias: alias f='fasd -f'
# use fd instead of find
alias ff="func() { local files; files=$(echo '$(git diff HEAD --diff-filter=M --name-only --relative $@ | fzf --ansi --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="git diff HEAD --color=always --color-words -- {1} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse | cut -c3-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git checkout HEAD --; }; func"
alias fl='fasd -fl'
# fc is a built-in command that is used by fzf ctrl-r
alias fn="fasd -fe nvim"
alias fo="fasd -fe open"
alias fp="fasd -fe pycharm"
alias fu="fasd -fe 'nvim -u ~/.SpaceVim/init.vim'"
alias fv="fasd -fe '$EDITOR'" # relies on EDITOR variable from line 121
alias fixnames="for f in *\ *; do mv '$f' '${f// /-}'; done;"
alias g="grep --color=always --exclude-dir={.git,.idea,.vscode}"
alias gg="func() { local commit_file; commit_file=$(echo '$(git grep -l ${1:-^} $(git rev-list --all --abbrev-commit) -- ${@:2} | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter=: --nth=2.. --no-sort --preview="git diff HEAD --color=always {1} {2} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$commit_file') ] && echo -n $(echo '$commit_file') | tr ':' '\0' | xargs -0 git checkout; }; func"
alias gi="grep -i --color=always --exclude-dir={.git,.idea,.vscode}"
alias gr="grep -r --color=always --exclude-dir={.git,.idea,.vscode}"
alias gir="grep -ir --color=always --exclude-dir={.git,.idea,.vscode}"
alias h='hub'
alias hb="hub browse"
alias ho="hub compare"
alias hc="hub create"
alias hd="hub delete"
alias hf="hub fork"
alias hg="hub gist"
alias hu="hub pull-request"
alias hp="hub pr"
alias hs="hub ci-status"
alias hi="hub issue"
alias hr="hub release"
alias hs="hub sync"
# alias i="func() { if $(echo '$1'); then; $(echo '$2'); fi; }; func";
alias i="func() { echo $(echo 'echo $@ | tr " " "\n" >> $(git rev-parse --show-toplevel)/.gitignore'); }; func";
alias ii="func() { local files; files=$(echo '$(git ls-files --others --exclude-standard | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -I file bash -c 'echo "file" >> \$(git rev-parse --show-toplevel)/.gitignore'; }; func";
alias ie="func() { if $(echo '$1'); then; $(echo '$2'); else; $(echo '$3'); fi; }; func";
alias iee="func() { if $(echo '$1'); then; $(echo '$2'); elif; $(echo '$3'); else; $(echo '$4'); fi; }; func";
alias j="func() { local directory; directory=$(echo '$(fd --type d ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --no-sort --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --preview-window="70%" --reverse)') && cd $(echo '$directory'); }; func";
alias jj="func() { local directory; directory=$(echo '$(fasd -Rdl | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter=/ --no-sort --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --preview-window="70%" --reverse --with-nth=4..)') && cd $(echo '$directory'); }; func";
alias jl="func() { local ipynb; ipynb=$(echo '$(fd --type f --extension ipynb ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --no-sort --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$ipynb') ] && jupyter lab $(echo '$ipynb'); }; func";
alias jn="func() { local ipynb; ipynb=$(echo '$(fd --type f --extension ipynb ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --no-sort --preview="jupyter nbconvert --to markdown {} --stdout | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$ipynb') ] && jupyter notebook $(echo '$ipynb'); }; func";
alias k="func() { ntimes=$(echo '$(printf "%$@s")') && cd $(echo '${ntimes// /../}'); }; func";
alias kk="func() {local untracked; untracked=$(echo '$(git clean -dfn | sed s/^Would\ remove\ // | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$untracked') ] && echo $(echo '$untracked') | tr '\n' '\0' | xargs -0 git clean -df; }; func";
alias l="git log --format='%C(yellow)%>(12,trunc)%ar %Cblue%h %Cgreen%<(8,trunc)%cn %Creset%s %Cred%D'"
alias lp="git log -p --word-diff=color"
alias la="ls -a"
alias lah="ls -ah"
alias lal="ls -al"
alias ll="ls -l"
alias ld="git log --format='%C(yellow)%ad %Creset%s %Cred%D %Cgreen%cn %Cblue%h' --date=short"
alias lr="git log --format='%C(yellow)%>(12,trunc)%ar %Creset%<(80,trunc)%s %Cblue%h %Cgreen%<(17,trunc)%cn %Cred%D'"
alias m="func() { mkdir -p $(echo '$1') && cd $(echo '$1'); }; func";
alias mm="func() { local file; file=$(echo '$(git diff --diff-filter=U --name-only --relative | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --no-sort --preview="git log --color=always --color-words --format=short --merge --patch -- {1} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse | cut -c3-)') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +Gvdiff! -- $(echo '$file'); }; func";
alias mc="git mergetool -t code --extcmd 'code --wait'"
alias mcs="git mergetool -t code --extcmd 'code --wait' --cached"
alias mn="git mergetool -t nvim --extcmd 'nvim -d'"
alias mns="git mergetool -t nvim --extcmd 'nvim -d' --cached"
alias mt="git mergetool -t vimdiff" # mv is taken
alias mts="git mergetool -t vimdiff --cached"
alias mu="git mergetool -t nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim'"
alias mus="git mergetool -t nvim --extcmd 'nvim -du ~/.SpaceVim/init.vim' --cached"
# alias mp="git mergetool -t pycharm --extcmd 'pycharm merge'"
# alias mps="git mergetool -t pycharm --extcmd 'pycharm merge'"
alias map="func() { for i in $(echo '${@:2}'); do; $(echo '$1 $i'); done; }; func";
alias n="nvim"
alias nd="func() { n $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ne="func() { local files; files=$(echo '$(n -u NONE -es "+pu =v:oldfiles" +%p +q! | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter / -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias nf="func() { local files; files=$(echo '$(fd --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias ng="func() { local file; file=$(echo '$(rg -l $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --no-sort --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$file') ] && echo $(echo '$file') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias nh="n -c History" # this only works with -c, not --cmd
alias nl="func() { local files; files=$(echo '$(rg -l $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | sed s+~+$HOME+ | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nn="func() { local files; files=$(echo '$(fasd -Rfl | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter / -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias no="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias np="func() { local files; files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nw="func() { local files; files=$(echo '$(fd -e docx --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n 1 -I{} pandoc {} -f docx -t markdown -o {}.md && echo $(echo '${files//.docx/.docx.md}') | tr '\n' '\0' | xargs -0 nvim --; }; func";
alias nr="func() { local files; files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter=/ -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 nvim $(echo '$@') --; }; func";
alias ns="func() { n -S $(echo '~/.config/nvim/session/$1.vim'); }; func";
alias nt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; nvim ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias nu="n -u ~/.SpaceVim/init.vim"
alias o="open"
alias od="func() { local directory; directory=$(echo '$(fd --type d ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="exa --all --classify --color=always -L=2 -T {} | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --preview-window="70%" --reverse)') && [ $(echo '$directory') ] && echo $(echo '$directory') | tr '\n' '\0' | xargs -0 open; }; func";
alias of="func() { local files; files=$(echo '$(fd --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias oh="func() { local files; files=$(echo '$(fd -e html --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias op="func() { local files; files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="pdftotext -l 2 {} - | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias or="func() { local files; files=$(echo '$(fd -e Rproj --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias oo="func() { local both; both=$(echo '$(fasd -Ral | fzf -m --no-sort --reverse)') && [ $(echo '$both') ] && echo $(echo '$both') | tr '\n' '\0' | xargs -0 open; }; func"
alias ow="func() { local files; files=$(echo '$(fd -e docx --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 open; }; func";
alias p="git push"
alias pc="pycharm"
alias pd="pycharm diff"
alias pp="func() { local files; files=$(echo '$(fd -e js --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 pycharm; }; func";
alias py="python"
alias pm="pycharm merge"
alias pf="git push --force"
alias pom="git push origin master"
# alias r="ranger"
alias r="git reset"
alias rr="func() { local files; files=$(echo '$(git diff --cached --name-only --relative $@ | fzf --ansi --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="git diff HEAD --color=always --color-words -- {1} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse | cut -c3-)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 git reset HEAD --; }; func"
# alias rr="func() { Rscript -e \"rmarkdown::render($(echo 'input=\"$1\", output_format=\"$2\"'))\"; }; func";
alias rot13="func() { tr 'A-Za-z' 'N-ZA-Mn-za-m' < $(echo '$1') > temp.txt && mv temp.txt $(echo '$1'); }; func";
alias ra="git remote add"
alias rau="git remote add upstream"
alias rc="git rebase --continue"
alias rs="git reset --soft" # resets by default to HEAD
alias rh="func() { git reset $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhh="func() { git reset --hard $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rhs="func() { git reset --soft $(echo 'HEAD~${1:-0}' '${@:2}'); }; func";
alias rq="git rebase --quit"
alias rs="git rebase --skip"
alias rv="git remote -v"
alias s="git status"
alias sa="git stash apply"
alias sb="git stash branch"
alias sc="git stash clear"
alias sd="git stash drop"
alias sl="git stash list"
alias sp="git stash push"
alias ss="func() { local stash; stash=$(echo '$(git stash list --color=always --format="%C(yellow)%>(12,trunc)%ar %Creset%s %Cgreen%cn %Cblue%gd" | fzf --ansi --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --nth=1,2,4..-2 --no-sort --preview="git stash show --color=always {-1} | rg -e {q} -e ^ --color=always" --preview-window="60%" --reverse | rev | cut -d " " -f1 | rev)') && [ $(echo '$stash') ] && git stash pop $(echo '$stash') }; func"
alias su="git stash push && git pull"
alias sub="git stash push && git pull && git stash branch"
alias suc="git stash push && git pull && git stash clear"
alias sud="git stash push && git pull && git stash drop"
alias sup="git stash push && git pull && git stash pop"
alias sz="source ~/.zshrc"
alias t="tmux"
alias tt="tmux attach -t $(echo '$(tmux list-sessions | fzf -m --no-sort | cut -d: -f1)')"
alias ta="tmux attach -t"
alias ti="tmux info"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new -s"
alias ts="tmux switch -t"
alias u="git pull"
alias uo="git pull origin"
alias uom="git pull origin master"
alias ur="git pull --rebase"
alias uru="git pull --rebase upstream"
alias urum="git pull --rebase upstream master"
alias v="$EDITOR"
alias vd="func() { v $(date '+%Y-%m-%d')_$(echo '$1').md; }; func";
alias ve="func() { local files; files=$(echo '$(v -es --noplugin -u ~/.vimrc "+set nonumber" "+pu =v:oldfiles" +%p +q! | sed /^.$/d | sed s+~+$HOME+ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter=/ -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vf="func() { local files; files=$(echo '$(fd --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vp="func() { local files; files=$(echo '$(fd -e pdf --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="pdftotext -l 2 {} - | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n1 -I '{}' pdftotext '{}' && echo $(echo '${files//.pdf/.txt}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vg="func() { local file; file=$(echo '$(rg -l $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --no-sort --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$file') ] && echo $(echo '$file') | tr '\n' '\0' | xargs -0 -o $EDITOR +$(echo '$(rg -n $@ $file | head -n 1 | cut -d: -f1)') --; }; func";
alias vh="v -c History" # this only works with -c, not --cmd
alias vl="func() { local files; files=$(echo '$(rg -l $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="bat --style=plain --color=always {} | rg --color=always -n $* | grep --color=always -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^)" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
alias vo="n -c 'browse oldfiles'" # this only works with -c, not --cmd
alias vr="func() { local files; files=$(echo '$(rg -e "^> ~/" -e "^> /" ~/.viminfo | cut -c3- | sed s+~+$HOME+ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter=/ -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vs="func() { v -S $(echo '~/.vim/session/$1.vim'); }; func";
alias vt="func() { [ ! -d ~/notes ] && git clone https://github.com/marskar/notes ~/notes; v ~/notes/$(date '+%Y-%m-%d')_$(echo '$1').tsv; }; func";
alias vu="v -u ~/.SpaceVim/vimrc"
alias vv="func() { local files; files=$(echo '$(fasd -Rfl | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter / -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -o $EDITOR $(echo '$@') --; }; func";
alias vw="func() { local files; files=$(echo '$(fd -e docx --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap -m --no-sort --preview="pandoc {} -t markdown | bat --style=numbers --color=always -l md | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 -n 1 -I{} pandoc {} -f docx -t markdown -o {}.md && echo $(echo '${files//.docx/.docx.md}') | tr '\n' '\0' | xargs -0 -o $EDITOR --; }; func";
# use z alias from fasd plugin instead of z plugin
alias ww="func() { local files; files=$(echo '$(fd -e js --type f ^ $@ | fzf --bind=alt-p:toggle-preview,alt-w:toggle-preview-wrap --delimiter / -m --no-sort --preview="bat --style=numbers --color=always {} | grep -E \$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g || echo ^) --color=always" --preview-window="70%" --reverse --with-nth=4..)') && [ $(echo '$files') ] && echo $(echo '$files') | tr '\n' '\0' | xargs -0 webstorm; }; func";
alias zc="fasd -de code"
alias zl="fasd -dl" # list all directories
alias zn="fasd -de nvim"
alias zo="fasd -de open"
alias zp="fasd -de pycharm"
alias zu="fasd -de 'vim -u ~/.SpaceVim/vimrc'"
alias zv="fasd -de '$EDITOR'"

# Suffix aliases: use with fzf ctrl-t: even with multiple files
# first file listed determines the command used to open all files
# e.g. `open` will be used when running `image.png file.txt`
# putting file.txt first will open both files in $EDITOR
# Run *.md to open all markdown files in $EDITOR
alias -s ipynb='jupyter lab'
alias -s zip=unzip
alias -s {R,r,rmd,Rmd,vim}=nvim
alias -s {ahk,js,json,md,py,sh,toml,tex,txt,yaml,yml}=$EDITOR
alias -s {csv,tsv}=scim
alias -s {doc,docx,html,pdf,ppt,pptx,xls,xlsx}=open
alias -s {gif,jpeg,jpg,png,tiff}=open

# brew installed python
# export PATH=/usr/local/bin/python3:$PATH
# miniconda python
export PATH=$HOME/miniconda3/bin:$PATH

bindkey -v
bindkey '\e.' insert-last-word
bindkey '\eb' backward-word
bindkey '\ed' delete-word
bindkey '\ef' forward-word
bindkey '\el' down-case-word
bindkey '\et' transpose-words
bindkey '\eu' up-case-word
bindkey '\ey' yank-pop
bindkey '^?' backward-delete-char
bindkey '^n' down-history
bindkey '^p' up-history
bindkey '^_' undo
bindkey '^a' beginning-of-line
bindkey '^b' backward-char
bindkey '^d' delete-char
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^h' backward-delete-char
bindkey '^k' kill-line
bindkey '^u' backward-kill-line
bindkey '^w' backward-kill-word
bindkey '\eh' backward-kill-word
bindkey '^y' yank

# the above is modified from https://dougblack.io/words/zsh-vi-mode.html

# ctrl-d in normalmode brings up info about the thing under the caret!!!

# https://www.youtube.com/watch?v=eLEo4OQ-cuQ
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# https://nuclearsquid.com/writings/edit-long-commands/
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line; zle -N edit-command-line
# Emacs style
bindkey '^x^e' edit-command-line
# Vi style:
# bindkey -M vicmd v edit-command-line

# https://github.com/clvv/fasd#tab-completion
bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (files and directories)
bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

# taken from https://emily.st/2013/05/03/zsh-vi-cursor/
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      echo -ne '\e[1 q';; # block cursor
        viins|main) echo -ne '\e[5 q';; # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    echo -ne '\e[1 q' # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

export KEYTIMEOUT=1

prompt_context() {}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# https://github.com/sharkdp/fd#using-fd-with-fzf
# https://github.com/junegunn/fzf#respecting-gitignore
export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings

export FZF_DEFAULT_OPTS="--bind=change:top,alt-p:toggle-preview,alt-w:toggle-preview-wrap --cycle --exit-0 --inline-info --no-height --no-sort --preview='bat --style=numbers --color=always {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always || exa --all --classify --color=always -L=2 -T {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always' --preview-window='70%' --reverse --select-1"
export FZF_CTRL_T_OPTS="-m --preview 'bat --style=numbers --color=always {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

export FZF_ALT_C_OPTS="--preview 'exa --all --classify --color=always -L=2 -T {} | grep -E \"\$([ {q} ] && echo {q} | xargs | sed s/\ /\|/g | sed s/$/\|$/g)\" --color=always'"
