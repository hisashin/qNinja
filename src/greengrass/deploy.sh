if [ $# -ne 1 ]; then
  echo "Usage : sh deploy.sh (branch)"
  exit 1
fi
branch=$1
echo "Use branch $branch"

// heavy
//curl -L -o production.zip https://github.com/hisashin/Ninja-qPCR/archive/production.zip
mkdir sandbox
cd sandbox
git init
git config core.sparsecheckout true
git remote add origin github:hisashin/Ninja-qPCR.git
echo src > .git/info/sparse-checkout
git pull origin $branch

zip -r src-$branch.zip src
version=`sed -z "s/.*ComponentVersion: *'//" src/greengrass/recipe/create-component-version-$branch.yaml |sed -z "s/'.*//"`
echo "Upload artifact version $version ($branch)"
aws s3 cp src-prod.zip s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/$version/src-$branch.zip
echo "Create component version $version ($branch)"
aws greengrassv2 create-component-version --inline-recipe fileb://Ninja-qPCR-production/src/greengrass/recipe/create-component-version-$branch.yaml
echo "Revise deployment version $version (prod)"
sed "s/{version}/$version/" src/greengrass/deployment/revise-$branch.json.template > revise.json
aws greengrassv2 create-deployment --cli-input-json file://revise.json  
cd ..
rm -rf sandbox
