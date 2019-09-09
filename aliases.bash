
# git
alias git_delete_merged_branches='git for-each-ref --format "%(refname:short)" --merged HEAD refs/heads/$1 | grep -v master | xargs git branch -d'
alias git_delete_merged_feature_branches='git_delete_merged_branches feature'
alias git_master='git fetch origin && git checkout master && git clean -d -f && git pull && git_delete_merged_feature_branches'
alias git_branch='git_master && git checkout $1'

# cci shortcuts
alias cci_test='cci task run run_tests --org dev -o test_name_match '

alias force_connect='force usedxauth "${PWD##*/}"__dev && sfdx force:config:set defaultusername="${PWD##*/}"__dev'

alias install_local_cci='pip install -r requirements_dev.txt'

alias source_convert='sfdx force:source:convert -r force-app/ -d src/'

alias dev_org='cci org remove dev && cci flow run dev_org --org dev && cci org default dev'
alias dev_open='cci org browser dev'
alias dev_org_open='dev_org && dev_open'
alias push_and_test='sfdx force:source:push -f && cci_test $1'
alias dev_deploy='cci flow run deploy_unmanaged --org dev'

alias update_cci='brew update && brew upgrade && npm update --global sfdx-cli'

alias cci_rollback='git checkout -- . && rm -rf force-app-bak'

# Synchronuously test $1; can only synchronuously test a single Apex Class
alias sfdx_test='sfdx force:apex:test:run -c -r human -w 10 -y -n $1'

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

# Load scripts
source $ALIASES/git/git-completion.bash