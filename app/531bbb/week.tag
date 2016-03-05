<week class={opts.type}>
  <table>
    <thead>
      <tr>
        <td>{ opts.weight }</td>
        <td>{ opts.type }</td>
      </tr>
    </thead>
    <tbody>
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
    </tbody>
  <table>
  <style>
    week table {
      width: 100%;
      font-family: sans-serif;
      font-size: 11px;
      font-weight: bold;
      text-align: center;
      border-collapse: collapse;
    }

    week thead {
      color: white;
    }

    week tbody td {
      background: #fff;
      border: 1px solid #aaa;
    }


    @media screen and (max-width: 992px) {
      week td {
      font-size: 2em;
      }
    }
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
