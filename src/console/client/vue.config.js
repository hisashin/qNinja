module.exports = {
  publicPath: '',
  configureWebpack: {
    devServer: {
      watchOptions: {
        poll: true
      },
      disableHostCheck: true
    }
  }
};