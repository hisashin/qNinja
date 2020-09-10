module.exports = {
  publicPath: '',
  configureWebpack: {
    devServer: {
      port: 8888,
      watchOptions: {
        poll: true
      },
      disableHostCheck: true
    }
  }
};