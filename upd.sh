clean="NO"
if [ $# -eq 1 ]; then
  if [ $1 = "-c" ]; then
    clean="YES"
  fi
fi
dirs=`find . -type d -depth 1`
for dit in $dirs
do
  echo $dit
  cd $dit
  if [ -d ".svn" ]; then
    svn update
  elif [ -d ".git" ]; then
    if [ $clean = "YES" ]; then
      git fsck
      git gc --prune
    fi
    git pull
  fi 
  cd ..
done
