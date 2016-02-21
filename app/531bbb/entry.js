require('file?name=dist/531bbb/[name].[ext]!./index.html')
require('./app.tag');

var api = {};
api.version = '1',
api.liftit = require('liftit-common');
api.getURLParameter = function(name) {
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
};

riot.mount('*', api);
