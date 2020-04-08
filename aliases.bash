
# echo with colors
BLACK_COLOR='\033[0;30m'
RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
ORGANGE_COLOR='\033[0;33m'
BLUE_COLOR='\033[0;34m'
PURPLE_COLOR='\033[0;35m'
CYAN_COLOR='\033[0;36m'
LIGHT_GREY_COLOR='\033[0;37m'
DARK_GREY_COLOR='\033[1;30m'
LIGHT_RED_COLOR='\033[1;31m'
LIGHT_GREEN_COLOR='\033[1;32m'
YELLOW_COLOR='\033[1;33m'
LIGHT_BLUE_COLOR='\033[1;34m'
LIGHT_PURPPLE_COLOR='\033[1;35m'
LIGHT_CYAN_COLOR='\033[1;36m'
WHITE_COLOR='\033[1;37m'

END_COLOR='\033[0m' # No Color

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
# END_COLOR    \033[0m

function echo_black {
  echo "${BLACK_COLOR}$1${END_COLOR}"
}
function echo_red {
  echo "${RED_COLOR}$1${END_COLOR}"
}
function echo_green {
  echo "${GREEN_COLOR}$1${END_COLOR}"
}
function echo_organge {
  echo "${ORGANGE_COLOR}$1${END_COLOR}"
}
function echo_blue {
  echo "${BLUE_COLOR}$1${END_COLOR}"
}
function echo_purple {
  echo "${PURPLE_COLOR}$1${END_COLOR}"
}
function echo_cyan {
  echo "${CYAN_COLOR}$1${END_COLOR}"
}
function echo_light_grey {
  echo "${LIGHT_GREY_COLOR}$1${END_COLOR}"
}
function echo_dark_grey {
  echo "${DARK_GREY_COLOR}$1${END_COLOR}"
}
function echo_light_red {
  echo "${LIGHT_RED_COLOR}$1${END_COLOR}"
}
function echo_light_green {
  echo "${LIGHT_GREEN_COLOR}$1${END_COLOR}"
}
function echo_yellow {
  echo "${YELLOW_COLOR}$1${END_COLOR}"
}
function echo_light_blue {
  echo "${LIGHT_BLUE_COLOR}$1${END_COLOR}"
}
function echo_light_purpple {
  echo "${LIGHT_PURPPLE_COLOR}$1${END_COLOR}"
}
function echo_light_cyan {
  echo "${LIGHT_CYAN_COLOR}$1${END_COLOR}"
}
function echo_white {
  echo "${WHITE_COLOR}$1${END_COLOR}"
}

# git
alias git_delete_merged_branches='git for-each-ref --format "%(refname:short)" --merged HEAD refs/heads/$1 | grep -v master | xargs git branch -d'
alias git_delete_merged_feature_branches='git_delete_merged_branches feature'
alias git_master='git fetch origin && git checkout master && git remote prune origin && git clean -d -f && git pull'
alias gitm='git_master'
alias git_branch='git_master && git checkout $1'

# cci shortcuts
alias cci_test='cci task run run_tests --org dev -o test_name_match '
alias ccit='cci task run '
alias ccif='cci flow run '
alias ccib='cci org browser '
alias ccii='cci org info '

# sfdx shortcuts
alias sfdxp='sfdx force:source:push '
alias sfdxl='sfdx force:source:pull '
alias sfdxd='sfdx force:source:deploy '
alias sfdxo='sfdx force:org:open '

alias sfp='sfdx force:source:push '
alias sfl='sfdx force:source:pull '
alias sfd='sfdx force:source:deploy '
alias sfo='sfdx force:org:open '

alias sfdo_devhub='sfdx force:config:set defaultdevhubusername=sfdo-dx-hub-prod'

alias force_connect='force usedxauth "${PWD##*/}"__dev && sfdx force:config:set defaultusername="${PWD##*/}"__dev'

alias install_local_cci='pip install -r requirements_dev.txt'

alias source_convert='sfdx force:source:convert -r force-app/ -d src/'

# use python 3 instead of python 2
alias python=$(which python3)
alias pip=$(which pip3)

flow_org() {
  if [[ $# -eq 0 ]]
    then
      echo_red "No arugments found.  Expecting 2 arguments: cci org name, cci flow name"
      echo ""
      return 1
  fi
  if [[ -z "$1" ]]
    then
      echo_red "First argument cannot be blank: cci org name"
      echo ""
      return 1
  fi

  if [[ -z "$2" ]]
    then
      echo_red "First argument cannot be blank: cci flow name"
      echo ""
      return 1
  fi

  echo ""
  
  echo_green "Removing cci org: $1"
  echo_green "--------------------------------------"
  cci org remove "$1"
  echo ""

  echo_green "Setting $1 as cci's default org"
  echo_green "--------------------------------------"
  cci org default "$1"
  echo ""

  echo_green "Running $2 flow on $1 org"
  echo_green "--------------------------------------"
  cci flow run "$2" --org "$1"

  echo ""
}

dev_org() {
  flow_org $1 "dev_org"
}

dev_org_namespaced() {
  flow_org "$1_namespaced" "dev_org_namespaced"
}

pmdm_org() {
  flow_org $1 "pmdm_org"
}

pmdm_org_namespaced() {
  flow_org "$1_namespaced" "pmdm_org_namespaced"
}

caseman_org() {
  flow_org $1 "caseman_org"
}

caseman_org_namespaced() {
  flow_org "$1_namespaced" "caseman_org_namespaced"
}

alias dev_open='cci org browser dev'

alias push_and_test='sfdx force:source:push -f && cci_test $1'
alias dev_deploy='cci flow run deploy_unmanaged --org dev'
alias remove_git_hooks='find .git/hooks -type f ! -name "*.sample" -delete'

alias update_cci='brew update && brew upgrade && npm update --global sfdx-cli && sfdx update'

alias cci_rollback='git checkout -- . && rm -rf force-app-bak'

# Synchronuously test $1; can only synchronuously test a single Apex Class
alias sfdx_test='sfdx force:apex:test:run -c -r human -w 10 -y -n $1'
alias sfdx_test_method='sfdx force:apex:test:run --codecoverage --resultformat=human --wait=10 --synchronous -t $1'

# Aynchronuously test $1; $1 is a comma-delimited list of Apex Class Names
alias sfdx_tests='sfdx force:apex:test:run -c -r human -w 10 -n $1'
alias sfdx_tests_all='sfdx force:apex:test:run -c -l RunLocalTests -r human'

function force_push_and_test {
  if [ -z "$1" ]
  then
    echo "Syntax: force_push_and_test {Apex Test Class Name}"
    echo "Apex Test Class Name cannot be blank"
    return
  fi

  force push "src/classes/$1.cls"
  # exit/return if force push fails
  if [[ $? != 0 ]]
  then
    return
  fi
  cci task run run_tests --org dev -o test_name_match "$1"
}

function force_push_and_test {
  if [ -z "$1" ]
  then
    echo "Syntax: push_and_test {Apex Test Class Name}"
    echo "Apex Test Class Name cannot be blank"
    return
  fi

  sfdx force:source:push -f
  # exit/return if force push fails
  if [[ $? != 0 ]]
  then
    return
  fi
  
  cci task run run_tests --org dev -o test_name_match "$1"
}

function source_pull_convert {
  if [ -z "$1" ]
  then
    sfdx force:source:pull -f
  else
    sfdx force:source:pull -f -u "$1"
  fi

  # exit/return if force push fails
  if [[ $? != 0 ]]
  then
    return
  fi
  sfdx force:source:convert -r force-app/ -d src/
}

function yaml {
  python -c "import yaml;print(yaml.safe_load(open('$1'))$2)"
}

function dev_sfdx {
  PROJECT_NAME=$(yaml cumulusci.yml  "['project']['name']")
  PROJECT_NAME+='__dev'
  sfdx force:config:set defaultusername=$PROJECT_NAME
}

# auto-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

export GITHUB="$HOME/Documents/github.com"
export CCI="$GITHUB/SFDO-Tooling/CumulusCI"
export ALIASES="$GITHUB/spelak-salesforce/aliases"
export SALESFORCE_FOUNDATION="$GITHUB/SalesforceFoundation"
export SFDO="$GITHUB/SalesforceFoundation"

export SOMA="$HOME/Documents/git.soma.salesforce.com"

export GPG_TTY=$(tty)
