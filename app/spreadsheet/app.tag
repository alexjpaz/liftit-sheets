var liftit = require('liftit-common');

<app>
  <div class='col'>
    <table>
      <thead>
        <tr>
          <th>W</tth>
          <th each={ lb in liftit.config.plates }>
            {lb}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr each={w in weights}>
          <td>{ w.weight }</td>
          <td each={ lb in liftit.config.plates }>
            {w.map[lb] }
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class='col'>
    <table>
      <thead>
        <tr>
          <th>W</tth>
          <th each={ lb in [0.6,0.65,0.7,0.75,0.80,0.85,0.9,0.95] }>
            {lb*100}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr each={f in fractions}>
          <td>{ f.weight }</td>
          <td each={ p,v in f.percent }>
            { v }
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

    .col {
      float: left;
      margin-left: 10px;
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
    }
  </style>
  <script>
    var self = this;
    this.liftit = liftit;

    this.weights = [];

    this.fractions = [];

    function pushWeight(weight) {
      var w = liftit.plates(weight);
      w.weight = weight;
      self.weights.push(w);
    }

    function pushFraction(weight) {
      var f = {};
      f.weight = weight;
      f.percent = {};

      [0.6,0.65,0.7,0.75,0.80,0.85,0.9,0.95].forEach(function(w) {
        f.percent[w] = liftit.roundTo(weight*w, 5);
      });

      console.log(f.percent)

      self.fractions.push(f);
    }

    for(var i=100; i<450; i+=5) {
      pushWeight(i);
      pushFraction(i);
    }
  </script>
</app>
