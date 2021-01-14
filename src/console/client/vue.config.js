var path = require('path')
module.exports = {
  publicPath: '',
  configureWebpack: {
    
    resolve: {
      alias: {
        'qpcr': path.resolve(__dirname, '../../qpcr/')
      },
    },
    devServer: {
      port: 8888,
      watchOptions: {
        poll: true
      },
      disableHostCheck: true
    }
  }
};