## How to deploy Ninja qPCR with Greengrass

### Dev

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/create-component-version-dev.yaml) and push to **dev** branch.
- GitHub Action run [this](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/deploy-dev.sh) as IAM user gg_component.

### Production

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/create-component-version-prod.yaml) and push to **production** branch.
- GitHub Action run [this](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/deploy-prod.sh) as IAM user gg_component.

### References ###

- [Upload components to deploy to your core devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/upload-components.html)
- [AWS IoT Greengrass component recipe reference](https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html#component-recipe-artifacts-decompressed-path)
- [Deploy AWS IoT Greengrass components to devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/manage-deployments.html)

