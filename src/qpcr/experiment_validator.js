"use strict";

const Validator = require("./validator");

const RULE_CONFIG = {
};
const RULE_ANALYSIS_CONFIG = {
};
const RULE_INFO = {
};

const experimentValidator = {
  CONFIG: new Validator(RULE_CONFIG),
  ANALYSIS_CONFIG: new Validator(RULE_ANALYSIS_CONFIG),
  INFO: new Validator(RULE_INFO)
};

module.exports = new Validator(RULE_PROTOCOL);
