require('./month.tag');
require('./bottom.tag');
require('./week.tag');
require('./lift.tag');


<app>
  <section class='default'>
    <ul>
      <li><a href='#press0'>P</a></li>
      <li><a href='#deadlift0'>D</a></li>
      <li><a href='#bench0'>B</a></li>
      <li><a href='#squat0'>S</a></li>
    </ul>  </section>
  </section>
  <section each={l, i in lifts} name={l.name}>
    <lift name={l.name} api={parent.api}></lift>
  </section>
  <script>
    var self = this;
    var api = this.api = opts;

    this.liftOrder = api.liftOrder;

    this.weekOrder = api.weekOrder;

    this.lifts = api.lifts;

    this.lifts.forEach(function(lift) {
      lift.weight = opts.getURLParameter(lift.name);
    });

    this.api.mobile(this);
  </script>
  <style>
    @media (max-width: 600px) {
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



      app section.default {
        top: 0;
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
    }
  </style>
</app>
