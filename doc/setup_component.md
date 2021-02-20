## How to deploy Ninja qPCR with Greengrass

### Dev

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/create-component-version-dev.yaml) and push to **dev** branch.
- GitHub Action run these commands as IAM user gg_component.
  ```
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
  ```

### Production

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/create-component-version-prod.yaml) and push to **production** branch.
- GitHub Action run these commands as IAM user gg_component.
  ```
  // heavy
  //curl -L -o production.zip https://github.com/hisashin/Ninja-qPCR/archive/production.zip
  mkdir sandbox
  cd sandbox
  git init
  git config core.sparsecheckout true
  git remote add origin github:hisashin/Ninja-qPCR.git
  echo src > .git/info/sparse-checkout
  git pull origin production
  
  zip -r src-prod.zip src
  version=`sed -z "s/.*ComponentVersion: *'//" src/greengrass/recipe/create-component-version-prod.yaml |sed -z "s/'.*//"`
  echo "Upload artifact version $version (prod)"
  aws s3 cp src-prod.zip s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/$version/src-prod.zip
  echo "Create component version $version (prod)"
  aws greengrassv2 create-component-version --inline-recipe fileb://Ninja-qPCR-production/src/greengrass/recipe/create-component-version-prod.yaml
  echo "Revise deployment version $version (prod)"
  sed "s/{version}/$version/" src/greengrass/deployment/revise-prod.json.template > revise.json
  aws greengrassv2 create-deployment --cli-input-json file://revise.json  
  cd ..
  rm -rf sandbox
  ```

### References ###

- [Upload components to deploy to your core devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/upload-components.html)
- [AWS IoT Greengrass component recipe reference](https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html#component-recipe-artifacts-decompressed-path)
- [Deploy AWS IoT Greengrass components to devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/manage-deployments.html)

