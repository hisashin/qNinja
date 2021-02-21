#
# curl -o deploy.sh https://raw.githubusercontent.com/hisashin/Ninja-qPCR/master/src/greengrass/deploy.sh
#
if [ $# -ne 1 ]; then
  echo "Usage : sh deploy.sh (branch)"
  exit 1
fi
branch=$1
echo "Use branch $branch"

mkdir sandbox
cd sandbox
git init
git config core.sparsecheckout true
git remote add origin github:hisashin/Ninja-qPCR.git
echo src > .git/info/sparse-checkout
git pull origin $branch
zip -r src-$branch.zip src

version=`sed -z "s/.*ComponentVersion: *'//" src/greengrass/recipe/$branch.yaml |sed -z "s/'.*//"`
echo "Upload artifact version $version ($branch)"
aws s3 cp src-$branch.zip s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/$version/src-$branch.zip
echo "Create component version $version ($branch)"
aws greengrassv2 create-component-version --inline-recipe fileb://src/greengrass/recipe/$branch.yaml
echo "Revise deployment version $version ($branch)"
sed -e "s/{version}/$version/" -e "s/{branch}/$branch/" src/greengrass/revise.json.template > revise.json
aws greengrassv2 create-deployment --cli-input-json file://revise.json
cd ..
rm -rf sandbox

