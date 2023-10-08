if [[ $# = 0 ]] || [[ $# < 4 ]]
then
  exit 1
else
  for d in ../*/ ; do
    echo $d
    cd $d
    eval `ssh-agent`
    ssh-add ~/.ssh/vietanh188
    if [ "git status --porcelain" ]
    then
      git status
      git add .
      git commit $1 "$2: $3"
      git push origin $4
    fi
  done
fi