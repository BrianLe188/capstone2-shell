if [[ $1 = "--help" ]] 
then
  echo '1: type message (-m, -am, ...)'
  echo '2: type of commit (fix, mod, new, ...)'
  echo "3: commit's content"
  echo '4: branch (main, dev, ...)'
  exit 0
fi

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