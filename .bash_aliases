# Search in history: "h buck"
alias h='history | sed "s/^ *[0-9][0-9]* *//" | grep'
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
