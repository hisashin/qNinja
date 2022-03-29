"use strict";
class Validator {
  constructor(rule) {
     this.rule = rule;
  }
  validate (data) {
    let path = [];
    let errors = [];
    this._validate(this.rule, data, errors, path);
    return errors;
  }
  
  _validateStringField(key, field, value, errors, path) {
    // TODO type check
    if (field.min_length != null && value.length < field.min_length) {
      errors.push(this._createError("The length should be " + field.min_length + " or more.", path));
    }
    if (field.max_length != null && value.length > field.max_length) {
      errors.push(this._createError("The length should be " + field.min_length + " or less.", path));
    }
  }
  _validateNumberField(key, field, value, errors, path) {
    if (field.min != null && value < field.min) {
      errors.push(this._createError("It should be " + field.min + " or greater.", path));
    }
    if (field.max != null && value > field.max) {
      errors.push(this._createError("It should be " + field.max + " or less.", path));
    }
  }
  _validateIntegerField(key, field, value, errors, path) {
    if (value != Math.floor(value)) {
      errors.push(this._createError("The input should be an integer.", path));
    }
    this._validateNumberField(key, field, value, errors, path);
  }
  _validateBooleanField(key, field, value, errors, path) {
    if (typeof(value) != 'boolean') {
      errors.push(this._createError("The value should be true or false.", path));
    }
  }
  _validateArrayField(key, field, value, errors, path) {
    
    if (!Array.isArray(value)) {
      errors.push(this._createError("The value should be an integer.", path));
      return;
    }
    if (field.min_length != null && value.length < field.min_length) {
      errors.push(this._createError("The number of items should be " + field.min_length + " or more.", path));
    }
    if (field.max_length != null && value.length > field.max_length) {
      errors.push(this._createError("The number of items should be " + field.min_length + " or less.", path));
    }
    if (field.rule != null) {
      for (let i=0; i<value.length; i++) {
        this._validate(field.rule, value[i], errors, this._addPath(path, i));
      }
    }
  }
  _validateObjectField(key, field, value, errors, path) {
    if (typeof(value) != 'object') {
      errors.push(this._createError("It should be an object.", path));
      return;
    }
    if (field.rule != null) {
      this._validate(field.rule, value, errors, path);
    }
  }
  
  _validate (rule, data, errors, parentPath) {
    for (let key in rule) {
      if (key == "_func") {
        // Custom function
        continue;
      }
      let path = this._addPath(parentPath, key);
      const field = rule[key];
      if (data[key] == null || data[key] === "") {
        if (field.required) {
          errors.push(this._createError("This field is required.", path));
        } else {
          if (data[key] != null) {
            delete data[key]
          }
        }
        continue;
      }
      if (field.type == "string") {
        this._validateStringField(key, field, data[key], errors, path);
      } else if (field.type == "number") {
        this._validateNumberField(key, field, data[key], errors, path);
      } else if (field.type == "integer") {
        this._validateIntegerField(key, field, data[key], errors, path);
      } else if (field.type == "boolean") {
        this._validateBooleanField(key, field, data[key], errors, path);
      } else if (field.type == "array") {
        this._validateArrayField(key, field, data[key], errors, path);
      } else if (field.type == "object") {
        this._validateObjectField(key, field, data[key], errors, path);
      }
    }
  }
  _createError (message, path) {
    return {message:message, path:path }
  }
  _addPath (path, next) {
    let newPath = [];
    for (let i=0; i<path.length; i++) {
      newPath[i] = path[i];
    }
    newPath.push(next);
    return newPath;
  }
}

module.exports = Validator;