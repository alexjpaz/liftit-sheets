require('./month.tag');
require('./bottom.tag');
require('./week.tag');
require('./lift.tag');


<app>
  <section each={l, i in lifts} name={l.name}>
    <lift name={l.name}></lift>
  </section>
  <script>
    var self = this;
    this.api = opts;

    this.liftOrder = [
      'press',
      'deadlift',
      'bench',
      'squat'
    ];
    this.lifts = [
      {'name': 'press'},
      {'name': 'deadlift'},
      {'name': 'bench'},
      {'name': 'squat'},
    ];

    this.lifts.forEach(function(lift) {
      lift.weight = opts.getURLParameter(lift.name);
    });

    this.api.mobile(this);
  </script>
  <style>
    app  section {
      width: 100%;
      height: 100%;
      position: fixed;
      top: -100%;
      left: 0;
      display: none
      border: 1px solid red;
      transition:.6s all;
    }

    app  section:target {
      display: block;
      top: 0;
    }

    app {
      display: block;
      position: absolute;
      background: #ffaaaa;
      width: 100%;
      height: 100%;
    }
  </style>
</app>
