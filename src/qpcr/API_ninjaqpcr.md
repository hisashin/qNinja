# class NinjaQPCR

## constructor (hardwareConf)

## Public functions

### setEventReceiver (receiver)

Set an object to receive events.

### start (protocol)

### pause ()

### resume ()

### abort ()

### finish ()

## Event handling

You can get notified of events by setting a receiver object.

```
qpcr.setEventReceiver(receiver)
```

Functions below are defined. All of them are optional.
  
### onProgress(data)

Tells current progress of the experiment every 0.5 second.

```
{ 
  well: 50,
  lid: 40,
  state: 
  { 
    state: 'ramp', 
    stage: 0,
    repeat: 0,  
    step: 0, 
    stepElapsed: 5025 
  },
  remaining: 153475,
  elapsed: 8045 
}
```

* well (float) : Temperature of the well block
* lid (float) : Temperature of the heat lid
* remaining (long int) : Estimated remaining time in milliseconds
* elapsed (long int) : Elapsed time in milliseconds
* state (object) : State of the experiment
  * state (string) : Label of the state. (preheat/ramp/hold/complete)
  * stage (int) (*) : Index of the stage. 
  * repeat (int) (*) : Index of the cycle
  * step (int) (*) : Index of the step
  * stepElapsed (long) (*) : Elapsed time of the step in milliseconds
  
Fields with "(*)" are empty when the state is "preheat" or "compete".

### onThermalTransition(transition)

Notifies state changes of the thermal cycler.

```
{ 
  from:
   { state: 'hold', stage: 1, step: 0, repeat: 0, stepElapsed: 5028 },
  to:
   { state: 'ramp', stage: 1, step: 0, repeat: 0, stepElapsed: 0 } }
}
```

* from (object) : Previous state.
* to (object) : Current state.

### onError(error)

Notifies device errors.
  
### onStart(data)

Notifies that the experiment started.

```
{ 
  id: '34aa55dc-e63d-4562-836d-6900dee11608',
  protocol: '2B93DB54-E14D-444F-BAEE-5B595F3FB917' 
}
```
  
### onComplete(data)

Tell the end of the experiment. The well unit is still working to keep the final hold temperature.
"Finish" command is needed to completely stop heat units and make the device ready again.

```
{ 
  id: '34aa55dc-e63d-4562-836d-6900dee11608',
  protocol: '2B93DB54-E14D-444F-BAEE-5B595F3FB917' 
}
```
  
### onDeviceStateChange(data)
  
### onFluorescenceDataUpdate(data)

Tell result of fluorescence measurement.

```
[ 0.10801242489714052,
  0.12294936026411177,
  0.11420738944199534,
  0.13175764679533242,
  0.12903787941280465,
  0.10887617636084554,
  0.13071267983725746,
  0.12279237404504303 ]
```
  
### onFluorescenceEvent (data)

```
{ type: 'measure' }
```

* type (string) : Type of the event

Event types are

* measure : One-shot measurement (at ends of steps of qPCR stages)
* start : Starting continuous measurement (for baseline or melt curve)
* stop : Stopping continuous measurement
* baseline : End of baseline measurement. At this time, thresholds are determined automatically.
