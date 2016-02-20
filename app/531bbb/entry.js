require('file?name=dist/531bbb/[name].[ext]!./index.html')
require('./app.tag');

var api = {
  version: '1',
  liftit: require('liftit-common')
};

riot.mount('*', api);
