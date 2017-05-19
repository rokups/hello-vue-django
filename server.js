var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var config = require('./webpack.config');

// Dev server address specified in webpack.config.js
var listen_addr = 'localhost';
// Dev server port specified in webpack.config.js
var listen_port = 8001;

new WebpackDevServer(webpack(config), {
    publicPath: config.output.publicPath,
    hot: true,
    inline: true,
    headers: { "Access-Control-Allow-Origin": "*" },
    historyApiFallback: true
}).listen(listen_port, listen_addr, function (err, result)
{
    if (err)
    {
        console.log(err);
    }

    console.log('Listening at ' + listen_addr + ':' + listen_port);
});
