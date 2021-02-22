export PYENV_ROOT="$HOME/.pyenv"
export PATH=/usr/local/bin:$PATH
export PATH="$PYENV_ROOT/shims:$PATH"

eval "$(/usr/local/bin/pyenv init -)"
eval "$(/usr/local/bin/pyenv virtualenv-init -)"
