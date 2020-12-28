const LID_TEMP_MAX = 120;
const LID_TEMP_MIN = 25;
const WELL_TEMP_MAX = 100;
const WELL_TEMP_MIN = 25;

const NAME_MAX_CHAR_COUNT = 255;

const ERROR_NAME_EMPTY = { message:"Name is empty." };
const ERROR_NAME_TOO_LONG = { message:"Name is too long. The length should be less than " + (NAME_MAX_CHAR_COUNT+1) + "." };
const ERROR_NO_STAGES = { message:"The protocol should have at least one stage." };
const ERROR_NO_STEPS = { message:"The protocol should have at least one stage." };

class ProtocolValidator {
  constructor (protocol) {
    this.protocol = protocol;
  }
  validateName (errors) {
    if (this.protocol.name == null || this.protocol.name.length == 0) {
      errors.push(ERROR_NAME_EMPTY);
      return;
    }
    if (this.protocol.name.length > NAME_MAX_CHAR_COUNT) {
      errors.push(ERROR_NAME_TOO_LONG);
    }
  }
  validateLidTemp (errors) {
    // TODO
  }
  validateFinalHoldTemp (errors) {
    // TODO
  }
  validate () {
    let errors = [];
    console.log(this.protocol);
    this.validateName(errors);
    this.validateLidTemp(errors);
    this.validateFinalHoldTemp(errors);
    if (this.protocol.stages != null || this.protocol.stages.length == 0) {
      errors.push(ERROR_NO_STAGES);
    } else {
      // TODO Validate stages
    }
    //lid_temp
    //final_hold_temp
    /*
[OK]温度min/max
// TODO lid使わない場合どうしてる?

[]ラベル変じゃない?
[]ラベルとフォーマット一致してる?
[]name確認
[]stageがない
[]stepがない
[]stage多すぎ
[]step多すぎ
[]melt curveが2個以上
*/
    return errors;
  }
}

/*
{
"name": "Demo Protocol",
"lid_temp": 110,
"final_hold_temp": 30,
"stages": [

{
  type: Constants.StageType.HOLD,
  repeat: 1,
  steps: [
    { label:"hold", temp:DEMO_TEMP_HIGH, duration:5.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} }
  ]
}

{
  type: Constants.StageType.QPCR,
  repeat: 3,
  steps: [
    { label:"denature", temp:DEMO_TEMP_HIGH, duration:6.0, data_collection:{ramp_end:true, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"anneal", temp:DEMO_TEMP_MEDIUM, duration:6.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"extend", temp:DEMO_TEMP_LOW, duration:6.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} }
  ]
}

{
  type: Constants.StageType.MELT_CURVE,
  repeat: 1,
  steps: [
    { label:"denature", duration:5, temp:DEMO_TEMP_HIGH, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"cool", duration:5, temp:DEMO_TEMP_MEDIUM, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"melt", ramp_speed: 0.4, duration:5.0, temp:DEMO_TEMP_HIGH, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:true, hold_continuous:false} }
  ]
}

]
}
*/
module.exports = ProtocolValidator;