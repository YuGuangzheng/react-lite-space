
fs = require('fs')
fontName = 'fonts/[name].[ext]'
webpack = require 'webpack'

module.exports =
  entry:
    vendor: [
      'webpack-dev-server/client?http://0.0.0.0:8080'
      'webpack/hot/dev-server'
      'react'
    ]
    main: [
      './src/main'
    ]
  output:
    path: 'build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/build/'
  resolve: extensions: ['.js', '.coffee', '']
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'react-hot!coffee'}
      {test: /\.less$/, loader: 'style!css!less'}
      {test: /\.css$/, loader: 'style!css!autoprefixer'}
      {test: /\.(eot|woff|woff2|ttf|svg)((\?|\#)[\?\#\w\d_-]+)?$/, loader: "url", query: {limit: 100, name: fontName}}
    ]
  plugins: [
    new webpack.optimize.CommonsChunkPlugin('vendor', 'vendor.js')
  ]
