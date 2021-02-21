## How to deploy Ninja qPCR with Greengrass

### bench

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/bench.yaml) and push to **bench** branch.
- GitHub Action run `sh [deploy.sh](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/deploy.sh) bench` as IAM user gg_component.

### prod

- Update version number**S** of [recipe](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/recipe/prod.yaml) and push to **prod** branch.
- GitHub Action run `sh [deploy.sh](https://github.com/hisashin/Ninja-qPCR/blob/master/src/greengrass/deploy.sh) prod` as IAM user gg_component.

### References ###

- [Upload components to deploy to your core devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/upload-components.html)
- [AWS IoT Greengrass component recipe reference](https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html#component-recipe-artifacts-decompressed-path)
- [Deploy AWS IoT Greengrass components to devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/manage-deployments.html)

