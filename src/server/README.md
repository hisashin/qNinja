# Ninja-qPCR server

The endpoint for the console that controls the instrument.

It should handle the following functions:

* Start, pause and experiment experiments (experiment protocol)
* Return current status of the thermal cycler
* Return fluorescence data
* Notify thermal cycler's transition events (stages and steps)
* Notify errors and alerts

## Development
```
yarn
yarn start
```