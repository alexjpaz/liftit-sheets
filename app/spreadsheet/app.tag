var liftit = require('liftit-common');

<app>
  <div class='col' each={cols}>
      <table>
        <thead>
          <tr class='thick--bottom'>
            <th>W</tth>
            <th each={ lb in liftit.config.plates }>
              {lb}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr each={w in weights}>
            <td class='thick--right'>{ w.weight }</td>
            <td each={ lb in liftit.config.plates }>
              {w.map[lb] }
            </td>
          </tr>
        </tbody>
      </table>
    </div>


  <pre>{ JSON.stringify(vm, null, 4) }</pre>
  <style>
    body {
      font-size: 11px;
    }

    .row {
      overflow: hidden;
    }

    .col {
      float: left;
      margin-left: 10px;
        margin-bottom: 10px;

    }

    table {
      border-collapse: collapse;
      border: 2px solid #aaa;
      border-radius: 4px;
    }
    td, th {
      text-align: center;
      border: 1px solid #eee;
      padding: 4px;
      width: 18px;
    }

    .thick--bottom {
      border-bottom: 2px solid #aaa;
    }

    .thick--right {
      border-right: 2px solid #aaa;
    }
  </style>
  <script>
    var self = this;
    this.liftit = liftit;

    this.cols = [];

    function Data() {
      this.weights = [];
      this.fractions = [];
    }

    function pushWeight(col, weight) {
      var w = liftit.plates(weight);
      w.weight = weight;

      if(!self.cols[col]) {
        self.cols[col] = new Data();
      }

      console.log(self.cols[col])

      self.cols[col].weights.push(w);
    }

    function pushFraction(col, weight) {
      var f = {};
      f.weight = weight;
      f.percent = {};

      [0.6,0.65,0.7,0.75,0.80,0.85,0.9,0.95].forEach(function(w) {
        f.percent[w] = liftit.roundTo(weight*w, 5);
      });

      if(!self.cols[col]) {
        self.cols[col] = new Data();
      }

      self.cols[col].fractions.push(f);
    }

    function range(start, end, step, cb) {
      var i=start;
      for(i=start;i<end;i+=step) {
        cb(i);
      }
    }

    var colcount = 0;
    range(45, 475, 45, function(inc) {

      console.log(inc)
      range(inc, inc + (5*10), 5, function(i) {
        pushWeight(colcount, i);
        pushFraction(colcount, i);
      });

      colcount ++;
    });
  </script>
</app>
