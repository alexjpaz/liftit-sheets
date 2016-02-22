require('file?name=dist/531bbb/[name].[ext]!./index.html')
require('./app.tag');

var mobile = require('./mobile');

var api = {};
api.version = '1',
api.liftit = require('liftit-common');
api.getURLParameter = function(name) {
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
};

api.mobile = mobile;

api.liftOrder = [
  'press',
  'deadlift',
  'bench',
  'squat'
];

api.weekOrder = [
  '3x5',
  '3x3',
  '531',
  'DL'
];

api.lifts = [
  {'name': 'press'},
  {'name': 'deadlift'},
  {'name': 'bench'},
  {'name': 'squat'},
];


riot.mount('*', api);
