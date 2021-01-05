# Search in history: "h buck"
alias h='history | sed "s/^ *[0-9][0-9]* *//" | egrep'
# L
alias l='ls -l'
# Do for all lines: "cat targets.txt | x buck build {}"
alias x='xargs -L 1 -I{}'

# cargo
alias cr='cargo run -q --'
alias ct='cargo test'

# setuptools
alias setup='python setup.py'

# mosh
alias mosh='mosh -6'

# WSL specific
if [[ $(uname -a) == *"Linux"*"Microsoft"* && -d $HOME/Miniconda3 ]]; then
  alias python=~/Miniconda3/python.exe
  alias pip=~/Miniconda3/Scripts/pip.exe
  alias conda=~/Miniconda3/Scripts/conda.exe
fi
