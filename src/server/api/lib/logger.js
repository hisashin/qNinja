'use strict';

// A configurable instance of the [Winston Logger](https://github.com/winstonjs/winston) to use in the modules.

// Production logging level should be set to info.
// npm logging levels: { error: 0, warn: 1, info: 2, verbose: 3, debug: 4, silly: 5 }
// RFC5424 the syslog levels: { emerg: 0, alert: 1, crit: 2, error: 3, warning: 4, notice: 5, info: 6, debug: 7 }

// https://github.com/winstonjs/winston/issues/614

const config = require('config');
const winston = require('winston');
const MESSAGE = Symbol.for('message');
const path = require('path');
const { format } = require('logform');
const {combine, timestamp, prettyPrint } = format;

const getLogger = (module, type) => {
  const modulePath = module.filename.split('/').slice(-2).join('/');
  
  const alignedWithColorsAndTime = format.combine(
    format.colorize(),
    format.timestamp(),
    format.align(),
    format.printf(info => `${info.timestamp} ${info.level}: ${info.message}`)
  );
  
  const logger = winston.createLogger({
    transports: [
      new (winston.transports.Console)({format: alignedWithColorsAndTime, level: config.logging_level})
    ]
  }); 
    
  switch (type) {
    case 'error':
      logger.add( new winston.transports.File({
        filename: './logs/error.log',
        level: 'error',
        maxsize: 5242880, //5MB
        maxFiles: 5,
        format: combine(
          // timestamp(), // defaults to ISO date
          timestamp({
            format: "YYYY-MM-DD HH:mm:ss"
          }),
          prettyPrint()
        )
      }));
      return logger;
    case 'info':
      logger.add( new winston.transports.File({
        filename: './logs/info.log', 
        level: 'info',
        maxsize: 5242880, // 5MB
        maxFiles: 5,
        format: combine(
          // timestamp(), // defaults to ISO date
          timestamp({
            format: "YYYY-MM-DD HH:mm:ss"
          }),
          prettyPrint()
        )
      }));
      return logger;
    case 'debug':
      logger.add( new winston.transports.File({
        filename: './logs/debug.log',
        level: 'debug',
        maxsize: 5242880, // 5MB
        maxFiles: 5,
        format: combine(
          // timestamp(), // defaults to ISO date
          timestamp({
            format: "YYYY-MM-DD HH:mm:ss"
          }),
          prettyPrint()
        )
      }));
      return logger;
    default:
      return logger;
  }
};

module.exports = module => ({
    error(err) {
      if (!this.errorLogger) {
        this.errorLogger = getLogger(module, 'error');
      }
      this.errorLogger.error(err);
    },
    info(err) {
      if (!this.infoLogger) {
        this.infoLogger = getLogger(module, 'info');
      }
      this.infoLogger.info(err);
    },
    debug(err) {
      if (!this.debugLogger) {
        this.debugLogger = getLogger(module, 'debug');
      }
      this.debugLogger.debug(err);
    }
});
