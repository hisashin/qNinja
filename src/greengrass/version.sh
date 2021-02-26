if [ $# -ne 1 ]; then
  echo "Usage : sh version.sh (yaml)"
  exit 1
elif [ ! -e $1 ]; then
  echo "Target YAML $1 not found"
  exit 1
fi
sed -z "s/.*ComponentVersion: *'//" $1 |sed -z "s/'.*//"
