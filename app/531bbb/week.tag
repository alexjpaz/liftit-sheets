<week class={opts.type}>
  <table>
    <tr>
      <td>{ opts.type }</td>
      <td>{ opts.weight }</td>
    </tr>
    <tr>
      <td each={ lb in liftit.config.plates }>
        {lb}
      </td>
    </tr>
    <tr each={ row in rows}>
      <td each={ lb in liftit.config.plates }>
        {row.map[lb] }
      </td>
    </tr>
  <table>
  <style>
    week
  </styl>
  <script>
    var self = this;
   var liftit = this.liftit = require('liftit-common');

    this.rows = [];

    liftit.config.weekMap[opts.type].forEach(function(w) {
      self.rows.push(liftit.plates(opts.weight * w));
    });
  </script>
</week>
