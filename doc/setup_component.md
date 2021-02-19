## How to deploy Ninja qPCR with Greengrass

## Manual deploy

[Upload components to deploy to your core devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/upload-components.html)
[AWS IoT Greengrass component recipe reference](https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html#component-recipe-artifacts-decompressed-path)

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/create-component-version.yaml?fbclid=IwAR1QTwhSN3xaRFmSvUM1PRnfuE6R080YpyvVHCD1gsyWy5UF_RBfns3m9Uk) in **production** branch
- Run this command as IAM gg_component to create component version
  ```
  curl -L -o production.zip https://github.com/hisashin/Ninja-qPCR/archive/production.zip
  unzip production.zip
  zip -r Ninja-qPCR-src.zip Ninja-qPCR-production/src
  aws s3 cp Ninja-qPCR-src.zip s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/{version number}/Ninja-qPCR-src.zip
  aws greengrassv2 create-component-version --inline-recipe fileb://src/greengrass/recipe/create-component-version.yaml
  ```
- [Components](https://ap-northeast-1.console.aws.amazon.com/iot/home?region=ap-northeast-1#/greengrass/v2/components) > Select **dev.hisa.Ninja** > **Deploy** > Add to deployment **deploy-qpcr-prod** > NextNextNext.... > Deploy
