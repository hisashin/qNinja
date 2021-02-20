// heavy
//curl -L -o dev.zip https://github.com/hisashin/Ninja-qPCR/archive/dev.zip
mkdir sandbox
cd sandbox
git init
git config core.sparsecheckout true
git remote add origin github:hisashin/Ninja-qPCR.git
echo src > .git/info/sparse-checkout
git pull origin dev

zip -r src-dev.zip src
version=`sed -z "s/.*ComponentVersion: *'//" src/greengrass/recipe/create-component-version-dev.yaml |sed -z "s/'.*//"`
echo "Upload artifact version $version (dev)"
aws s3 cp src-dev.zip s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/$version/src-dev.zip
echo "Create component version $version (dev)"
aws greengrassv2 create-component-version --inline-recipe fileb://Ninja-qPCR-dev/src/greengrass/recipe/create-component-version-dev.yaml
echo "Revise deployment version $version (dev)"
sed "s/{version}/$version/" src/greengrass/deployment/revise-dev.json.template > revise.json
aws greengrassv2 create-deployment --cli-input-json file://revise.json  
cd ..
rm -rf sandbox
