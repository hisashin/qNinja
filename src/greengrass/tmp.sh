echo "AWS_ACCESS_KEY_ID=$1"
echo "AWS_SECRET_ACCESS_KEY=$2"
echo "JAVA_HOME=$3"
echo "export AWS_ACCESS_KEY_ID=${1}\nexport AWS_SECRET_ACCESS_KEY=${2}\nexport JAVA_HOME=${3}" >> environment.txt
