## How to deploy Ninja qPCR with Greengrass

### Dev

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/create-component-version-dev.yaml) and push to **dev** branch.
- GitHub Action run these commands as IAM user gg_component.
  ```
  curl -L -o production.zip https://github.com/hisashin/Ninja-qPCR/archive/dev.zip
  unzip dev.zip
  zip -r src-dev.zip Ninja-qPCR-dev/src
  version=`sed -z "s/.*ComponentVersion: *'//" Ninja-qPCR-production/src/greengrass/recipe/create-component-version-dev.yaml |sed -z "s/'.*//"`
  aws s3 cp Ninja-qPCR-src.zip s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/$version/src-dev.zip
  aws greengrassv2 create-component-version --inline-recipe fileb://Ninja-qPCR-production/src/greengrass/recipe/create-component-version-dev.yaml
  ```
- [Components](https://ap-northeast-1.console.aws.amazon.com/iot/home?region=ap-northeast-1#/greengrass/v2/components) > Select **dev.hisa.Ninja** > **Deploy** > Add to deployment **deploy-qpcr-dev** > NextNextNext.... > Deploy


### Production

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/create-component-version-production.yaml) and push to **production** branch.
- GitHub Action run these commands as IAM user gg_component.
  ```
  curl -L -o production.zip https://github.com/hisashin/Ninja-qPCR/archive/production.zip
  unzip production.zip
  zip -r src-prod.zip Ninja-qPCR-production/src
  version=`sed -z "s/.*ComponentVersion: *'//" Ninja-qPCR-production/src/greengrass/recipe/create-component-version-prod.yaml |sed -z "s/'.*//"`
  aws s3 cp Ninja-qPCR-src.zip s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/$version/src-prod.zip
  aws greengrassv2 create-component-version --inline-recipe fileb://Ninja-qPCR-production/src/greengrass/recipe/create-component-version-prod.yaml
  ```
- [Components](https://ap-northeast-1.console.aws.amazon.com/iot/home?region=ap-northeast-1#/greengrass/v2/components) > Select **dev.hisa.Ninja** > **Deploy** > Add to deployment **deploy-qpcr-prod** > NextNextNext.... > Deploy

### References ###

- [Upload components to deploy to your core devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/upload-components.html)
- [AWS IoT Greengrass component recipe reference](https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html#component-recipe-artifacts-decompressed-path)
- [Deploy AWS IoT Greengrass components to devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/manage-deployments.html)

