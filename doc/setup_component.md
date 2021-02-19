## How to setup Greengrass component for Ninja qPCR

## Manual setup

[Upload components to deploy to your core devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/upload-components.html)
Replace **1.2.3** to the version you want to publish.

- As AWS IAM gg_component user,
- vi ~/greengrassv2/recipes/dev.hisa.Ninja-**1.2.3**.yaml
```
RecipeFormatVersion: 2020-01-25
ComponentName: dev.hisa.Ninja
ComponentVersion: '**1.2.3**'
ComponentDescription: Ninja qPCR Greengrass component
ComponentPublisher: Toriningen Inc.
Manifests:
  - Platform:
      os: linux
    Artifacts:
      - URI: s3://gg-ninja-qpcr/artifacts/dev.hisa.Ninja/**1.2.3**/hello_world.py
    Lifecycle:
      Run: |
        python3 {artifacts:path}/hello_world.py '{configuration:/Message}'
```
- Place all soruces to ~/greengrassv2/recipes/dev.hisa.Ninja-**1.2.3**/
