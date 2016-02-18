var riot = require('riot');
var month = require('../app/month.tag');
var expect = require('chai').expect;

var jsdom = require('jsdom').jsdom;

describe('month.tag', function() {
  it('should render html', function() {
    var html = riot.render(month);
    expect(html).equal("<month><h3>Tag layout 5</h3></month>");
  });

  it('should haz javascripts', function() {
    var tag = riot.render.dom(month)._tag;
    expect(tag.foo).equal(5);
  });
});
