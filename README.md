Purpose
===
`.aliases` contains aliases for MacOS or Linux that I find useful for [Salesforce Developement](https://developer.salesforce.com/tools/sfdxcli) with [CumulusCI](https://cumulusci.readthedocs.io/en/latest/).  Some aliases assume the existance of other programs.

Instructions
===

Load `.aliases` in when creating a new terminal by:
1) Create a variable as the path to this repository called `$ALIASES`, e.g. `$ALIASES="$HOME/[path to this repo]/aliases"`
2) Load `.aliases` by calling `source $ALISES/.aliases`
    - `.aliases` uses the `$ALIASES` variable to load other scripts such as [git-completion](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)

Example
--- 
-  If using the default terminal, add the following to your `~/.bash_profile`
-  If using [zsh](https://ohmyz.sh/), add the following to your `~/.zshrc`
```bash
# Load Aliases
export $ALIASES="$HOME/[path to repo]/aliases" 
source $ALIASES/.aliases
    # .alises also loads git-completion via $ALIASES variable
```