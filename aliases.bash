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

function echo_black() {
  echo "${BLACK_COLOR}$1${END_COLOR}"
}
function echo_red() {
  echo "${RED_COLOR}$1${END_COLOR}"
}
function echo_green() {
  echo "${GREEN_COLOR}$1${END_COLOR}"
}
function echo_organge() {
  echo "${ORGANGE_COLOR}$1${END_COLOR}"
}
function echo_blue() {
  echo "${BLUE_COLOR}$1${END_COLOR}"
}
function echo_purple() {
  echo "${PURPLE_COLOR}$1${END_COLOR}"
}
function echo_cyan() {
  echo "${CYAN_COLOR}$1${END_COLOR}"
}
function echo_light_grey() {
  echo "${LIGHT_GREY_COLOR}$1${END_COLOR}"
}
function echo_dark_grey() {
  echo "${DARK_GREY_COLOR}$1${END_COLOR}"
}
function echo_light_red() {
  echo "${LIGHT_RED_COLOR}$1${END_COLOR}"
}
function echo_light_green() {
  echo "${LIGHT_GREEN_COLOR}$1${END_COLOR}"
}
function echo_yellow() {
  echo "${YELLOW_COLOR}$1${END_COLOR}"
}
function echo_light_blue() {
  echo "${LIGHT_BLUE_COLOR}$1${END_COLOR}"
}
function echo_light_purpple() {
  echo "${LIGHT_PURPPLE_COLOR}$1${END_COLOR}"
}
function echo_light_cyan() {
  echo "${LIGHT_CYAN_COLOR}$1${END_COLOR}"
}
function echo_white() {
  echo "${WHITE_COLOR}$1${END_COLOR}"
}

function get_default_branch() {

}

# git
function git_default_branch() {
  if [[ -z "$1" ]]; then
    echo_red "Expecting 1 argument: default branch name"
    echo ""
    return 1
  fi
  default_branch=$1

  echo_blue 'git fetch origin --all --prune &&'
  echo_blue "    git checkout $GREEN_COLOR$default_branch$END_COLOR$BLUE_COLOR &&"
  echo_blue '    git remote prune origin && git clean -d -f &&'
  echo_blue '    git pull'
  echo_blue '---------------'

  git fetch --all --prune
  git checkout $default_branch
  git remote prune origin
  git clean -d -f
  git pull
}

function git_branch() {
  if [[ -z "$1" ]]; then
    echo_red "Expecting 2 arguments: default branch name, branch name"
    echo ""
    return 1
  fi
  if [[ -z "$2" ]]; then
    echo_red "Expecting 2 arguments: default branch name, branch name"
    echo ""
    return 1
  fi
  default_branch=$1
  branch=$2

  echo_blue 'git fetch origin --all --prune &&'
  echo_blue "    git checkout $GREEN_COLOR$default_branch$END_COLOR$BLUE_COLOR &&"
  echo_blue '    git remote prune origin && git clean -d -f &&'
  echo_blue '    git pull &&'
  echo_blue "    git checkout $GREEN_COLOR$branch$END_COLOR$BLUE_COLOR &&"
  echo_blue '    git pull'
  echo_blue '---------------'

  git fetch --all --prune
  git checkout $default_branch
  git remote prune origin
  git clean -d -f
  git pull
  git checkout $branch
  git pull
}

function git_main() {
  git_default_branch main
}

function git_master() {
  git_default_branch master
}

function gfp() {
  echo_blue 'git fetch origin --all --prune &&'
  echo_blue '    git pull'
  echo_blue '---------------'

  git fetch --all --prune
  git pull
}

alias git_delete_merged_branches_to_master='git for-each-ref --format "%(refname:short)" --merged HEAD refs/heads/$1 | grep -v master | xargs git branch -d'
alias git_delete_merged_branches_to_main='git for-each-ref --format "%(refname:short)" --merged HEAD refs/heads/$1 | grep -v main | xargs git branch -d'
alias git_delete_merged_feature_branches='git_delete_merged_branches feature'

alias git_cleanup_main='git branch -r --merged | grep -v main | sed "s/origin\///" | xargs -n 1 git push --delete origin'
alias git_cleanup_master='git branch -r --merged | grep -v master | sed "s/origin\///" | xargs -n 1 git push --delete origin'

alias git_masterd='git add . && git stash && git stash drop && git_master'
alias git_maind='git add . && git stash && git stash drop && git_main'

alias git_master_branch='git_branch master '
alias git_main_branch='git_branch main '

alias git_drop='git add . && git stash && git stash drop'

alias gitm='git_main'
alias gitmb='git_main_branch '
alias gmb='git_main_branch '
alias gitd='git_drop'
alias gitmd='git add . && git stash && git stash drop && gitm'

# cci shortcuts
alias cci_test='cci task run run_tests --org dev -o test_name_match '
alias ccit='cci task run '
alias cciti='cci task info '
alias ccif='cci flow run '
alias ccifi='cci flow info '
alias ccib='cci org browser '
alias ccid='cci org default '
alias ccii='cci org info '

# sfdx shortcuts
alias sfdxp='sfdx force:source:push '
alias sfdxl='sfdx force:source:pull '
alias sfdxd='sfdx force:source:deploy '
alias sfdxo='sfdx force:org:open '

alias sfp='echo "sfdx force:source:push" && sfdx force:source:push '
alias sfl='echo "sfdx force:source:pull" && sfdx force:source:pull '
alias sfd='echo "sfdx force:source:deploy" && sfdx force:source:deploy '
alias sfr='echo "sfdx force:source:retrieve" && sfdx force:source:retrieve '
alias sfs='echo "sfdx force:source:status" && sfdx force:source:status $1'
alias sfo='echo "sfdx force:org:open" && sfdx force:org:open '
alias sfa='echo "sfdx force:apex:execute" && sfdx force:apex:execute -f $1'

# Synchronuously test $1; can only synchronuously test a single Apex Class
alias sfdx_test='sfdx force:apex:test:run --outputdir ./.sfdx/tools/testresults/apex --loglevel error --codecoverage --resultformat=human --wait=30 --synchronous -n $1'
alias sfdx_test_method='sfdx force:apex:test:run --outputdir ./.sfdx/tools/testresults/apex --loglevel error --codecoverage --resultformat=human --wait=30 --synchronous -t $1'

# Aynchronuously test $1; $1 is a comma-delimited list of Apex Class Names
alias sfdx_tests='sfdx force:apex:test:run -c -r human -w 10 -n $1'
alias sfdx_tests_all='sfdx force:apex:test:run --codecoverage --testlevel=RunLocalTests --resultformat=human --outputdir ./.sfdx/tools/testresults/apex --loglevel error'

function sfpt() {
  # sfp && sfdx_test combined
  apex_test=$1
  is_force="-f"

  if [[ -z "$2" ]]; then
    is_force=""
  fi

  echo_green "sfdx pushing and running test for $apex_test"
  echo_green "---------------------------------------------------------"

  echo_blue "sfdx force:source:push $GREEN_COLOR$is_force$END_COLOR$BLUE_COLOR"
  sfdx force:source:push $is_force

  if [ $? -ne 0 ]; then
    return 1
  fi

  echo_blue ""
  echo_blue 'sfdx force:apex:test:run'
  echo_blue "    --classnames=$GREEN_COLOR$apex_test$END_COLOR$BLUE_COLOR"
  echo_blue "    --outputdir ./.sfdx/tools/testresults/apex"
  echo_blue '    --loglevel=error'
  echo_blue '    --codecoverage'
  echo_blue "    --resultformat=human"
  echo_blue '    --wait=30'
  echo_blue '    --synchronous'
  sfdx force:apex:test:run --outputdir ./.sfdx/tools/testresults/apex --loglevel=error --codecoverage --resultformat=human --wait=30 --synchronous "--classnames=$apex_test"
}

alias sfdo_devhub='sfdx force:config:set defaultdevhubusername=ngo'

alias force_connect='force usedxauth "${PWD##*/}"__dev && sfdx force:config:set defaultusername="${PWD##*/}"__dev'

alias install_local_cci='pip install -r requirements_dev.txt'

alias source_convert='sfdx force:source:convert -r force-app/ -d src/'

# use python 3 instead of python 2
alias python=$(which python3)
alias pip=$(which pip3)

flow_org() {
  org=$1
  flow=$2
  is_not_default=$3

  if [[ $# -eq 0 ]]; then
    echo_red "No arugments found.  Expecting 2 arguments: cci org name, cci flow name[, is_not_default]"
    echo ""
    return 1
  fi

  if [[ -z "$org" ]]; then
    echo_red "First argument cannot be blank: cci org name"
    echo ""
    return 1
  fi

  if [[ -z "$flow" ]]; then
    echo_red "Second argument cannot be blank: cci flow name"
    echo ""
    return 1
  fi

  echo ""

  echo_green "Removing cci org: $org"
  echo_green "--------------------------------------"
  echo "cci org remove \"$org\""
  echo ""
  cci org remove "$org"
  echo ""

  # Skip setting the org as the default org if the third argument is anything.
  if [[ -z "$is_not_default" ]]; then
    echo_green "Setting $org as cci's default org"
    echo_green "--------------------------------------"
    echo "cci org default \"$org\""
    echo ""
    cci org default "$org"
    echo ""
  fi

  echo_green "Running $flow flow on $org org"
  echo_green "--------------------------------------"
  echo "cci flow run \"$flow\" --org \"$org\""
  echo ""
  cci flow run "$flow" --org "$org"
  echo ""
}

scratch_org() {

  org_template=$1
  org=$2
  days=$3
  is_not_default=$4

  if [[ $# -eq 0 ]]; then
    echo_red "No arugments found.  Expecting 2 arguments: cci org template name, cci scratch org name, [days, is_default]"
    echo ""
    return 1
  fi

  if [[ -z "$org_template" ]]; then
    echo_red "First argument cannot be blank: cci org template name"
    echo ""
    return 1
  fi

  if [[ -z "$org" ]]; then
    echo_red "First argument cannot be blank: cci scratch org name"
    echo ""
    return 1
  fi

  echo_green "Removing cci scratch org $org"
  echo_green "--------------------------------------"
  echo "cci org remove \"$org\""
  echo ""
  cci org remove $org
  echo ""

  if [[ -z "$days" ]]; then
    days=1
  fi

  echo_green "Creating cci scratch org $org from $org_template for $days days"
  echo_green "--------------------------------------"
  echo "cci org scratch \"$org_template\" \"$org\" --days \"$days\""
  echo ""
  cci org scratch $org_template $org --days $days

  # Skip setting the org as the default org if the third argument is anything.
  if [[ -z "$is_default" ]]; then
    echo ""
  else
    echo_green "Setting $org as cci's default org"
    echo_green "--------------------------------------"
    echo "cci org default \"$org\""
    echo ""
    cci org default "$org"
    echo ""
  fi
}

flow_scratch_org() {

  flow=$1
  org_template=$2
  scratch_org=$3
  days=$4

  if [[ $# -eq 0 ]]; then
    echo_red "No arugments found.  Expecting 3 arguments: flow name, cci org template name, cci scratch org name, [days]"
    echo ""
    return 1
  fi

  if [[ -z "$flow" ]]; then
    echo_red "First argument cannot be blank: flow name"
    echo ""
    return 1
  fi

  if [[ -z "$org_template" ]]; then
    echo_red "Second argument cannot be blank: cci org template name"
    echo ""
    return 1
  fi

  if [[ -z "$scratch_org" ]]; then
    echo_red "Third argument cannot be blank: cci scratch org name"
    echo ""
    return 1
  fi

  scratch_org $org_template $scratch_org $days

  echo_blue "Running $flow flow on $scratch_org org"
  echo_blue "--------------------------------------"
  echo "cci flow run $flow --org \"$scratch_org\""
  echo ""
  cci flow run "$flow" --org "$scratch_org"
  echo ""
}

dev_scratch_org() {
  flow="dev_org"
  org_template="dev"
  org=$1
  days=$2

  flow_scratch_org $flow $org_template $org $days
}

dev_scratch_org_2gp() {
  flow="dev_org_2gp"
  org_template="dev"
  org=$1
  days=$2

  flow_scratch_org $flow $org_template $org $days
}

dev_org() {
  org="dev"
  flow="dev_org"
  days=$1

  flow_org $org $flow $is_not_default
}

dev_org_2gp() {
  flow="dev_org_2gp"
  org_template="dev"
  org="dev_2gp"
  days=$2

  flow_scratch_org $flow $org_template $org $days
}

dev_org_namespaced() {
  org="$1_namespaced"
  flow="dev_org_namespaced"
  is_not_default=$2
  flow_org $org $flow $is_not_default
}

2gp_org() {
  flow="2gp_org"
  org_template="dev"
  org="dev_2gp"
  days=$2

  flow_scratch_org $flow $org_template $org $days
}

beta_scratch_org() {
  flow="install_beta"
  org_template="beta"
  org=$1
  days=$2

  flow_scratch_org $flow $org_template $org $days
}

beta_org() {
  org="beta"
  days=$1
  beta_scratch_org $org $days
}

regression_org() {
  org=$1
  flow="regression_org"
  is_not_default="not default"
  flow_org $org $flow $is_not_default
}

pmdm_org() {
  org=$1
  flow="pmdm_org"
  is_not_default=$2
  flow_org $org $flow $is_not_default
}

pmdm_org_namespaced() {
  org="$1_namespaced"
  flow="pmdm_org_namespaced"
  is_not_default=$2
  flow_org $org $flow $is_not_default
}

caseman_org() {
  org=$1
  flow="caseman_org"
  is_not_default=$2
  flow_org $org $flow $is_not_default
}

caseman_org_namespaced() {
  org="$1_namespaced"
  flow="caseman_org_namespaced"
  is_not_default=$2
  flow_org $org $flow $is_not_default
}

alias dev_open='cci org browser dev'

alias push_and_test='sfdx force:source:push -f && cci_test $1'
alias dev_deploy='cci flow run deploy_unmanaged --org dev'
alias remove_git_hooks='find .git/hooks -type f ! -name "*.sample" -delete'

alias update_cci='brew update && brew upgrade && npm update --global sfdx-cli && sfdx update'

alias cci_rollback='git checkout -- . && rm -rf force-app-bak'

# Python
function blake() {
  echo "black"
  echo "----------------------"
  black $1
  echo ""

  echo "flake8"
  echo "----------------------"
  flake8 $1
  echo ""
}

function bytest() {
  blake $1
  echo "pytest"
  echo "----------------------"
  pytest $1
  echo ""
}

function force_push_and_test() {
  if [ -z "$1" ]; then
    echo "Syntax: force_push_and_test {Apex Test Class Name}"
    echo "Apex Test Class Name cannot be blank"
    return
  fi

  force push "src/classes/$1.cls"
  # exit/return if force push fails
  if [[ $? != 0 ]]; then
    return
  fi
  cci task run run_tests --org dev -o test_name_match "$1"
}

function force_push_and_test() {
  if [ -z "$1" ]; then
    echo "Syntax: push_and_test {Apex Test Class Name}"
    echo "Apex Test Class Name cannot be blank"
    return
  fi

  sfdx force:source:push -f
  # exit/return if force push fails
  if [[ $? != 0 ]]; then
    return
  fi

  cci task run run_tests --org dev -o test_name_match "$1"
}

function source_pull_convert() {
  if [ -z "$1" ]; then
    sfdx force:source:pull -f
  else
    sfdx force:source:pull -f -u "$1"
  fi

  # exit/return if force push fails
  if [[ $? != 0 ]]; then
    return
  fi
  sfdx force:source:convert -r force-app/ -d src/
}

function yaml() {
  python -c "import yaml;print(yaml.safe_load(open('$1'))$2)"
}

function dev_sfdx() {
  PROJECT_NAME=$(yaml cumulusci.yml "['project']['name']")
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
export LOC="$SOMA/platform-localization/loc"
export SCOTTPELAK="$GITHUB/scottpelak"
export SFDC="$GITHUB/salesforce"
export LWC="$GITHUB/salesforce/lightning-components"

# In Summer '20, the apex test reporter will return more relevant and accurate code coverage results for test runs.
# To preview this change, set the environment variable SFDX_IMPROVED_CODE_COVERAGE='true'.
# Learn more at # https://releasenotes.docs.salesforce.com/en-us/spring20/release-notes/rn_sf_cli_code_coverage_apextests.htm
export SFDX_IMPROVED_CODE_COVERAGE='true'

export GPG_TTY=$(tty)

# load platform localization tool in PATH
PATH=~PATH:$SOMA/spelak/l10n

# Checkout CCI master
#echo "Updating cci..."
#echo "---------------"
#current_directory=$PWD
#cd $CCI
#gitm
#echo "---------------"
#cd $current_directory

jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version")
  java -version
}
