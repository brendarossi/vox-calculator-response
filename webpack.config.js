var path = require('path');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var ExtractTextPlugin = require('extract-text-webpack-plugin');


var PATHS = {
  app: path.join(__dirname, 'app'),
  build: path.join(__dirname, 'build')
};

module.exports = {
    context: PATHS.app,
    entry: "./main",
    output: {
        path: PATHS.build,
        filename: "main.js"
    },
    module: {
        loaders: [
            { test: /\.css$/, loader: ExtractTextPlugin.extract("style-loader", "css-loader") },
            { test: /\.scss$/, loader: ExtractTextPlugin.extract("style", "css!sass") },
            { test: /\.coffee$/, loader: "coffee" },
            //{ test: /\.babylon$/, loader: "file" },
            { test: /\.(png|jpg|jpeg|gif|svg|woff|woff2|ttf|eot)$/, loader: "file" }
        ]
        
    },
    plugins: [
        new HtmlWebpackPlugin({
        title: "Tax Plan Calculator 2016",
        template: path.join(PATHS.app, "index.html"),
        inject: "body"
      }),
      new ExtractTextPlugin("style.css")
    ],
    resolve: {
        extensions: ['', '.js', '.coffee'/*, '.babylon'*/]
    }
};