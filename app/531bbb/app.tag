require('./month.tag');
require('./bottom.tag');
require('./week.tag');
require('./lift.tag');


<app class='swipe-direction--{ swipeDirection }'>
  <nav class='default'>
    <ul>
      <li><a href='#press3x5'>P</a></li>
      <li><a href='#deadlift3x5'>D</a></li>
      <li><a href='#bench3x5'>B</a></li>
      <li><a href='#squat3x5'>S</a></li>
    </ul>
  </nav>
  <div each={l, i in lifts} name={l.name}>
    <lift name={l.name} api={parent.api}></lift>
  </div>
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
        position: fixed;
        left: 0;
        transition: .6s all;
        visibility: hidden;
      }

      app nav.default {
        bottom: 0;
        position: absolute;
      }

      app nav.default ul {
        margin: 0;
        padding: 0;
        list-style: none;
      }

      app nav.default ul li {
        margin: 0;
        padding: 0;
        float: left;

      }

      app nav.default ul li a {
        height: 40px;
        background: white;
        display: block;
        width: 40px;
      }

      app.swipe-direction--left section {
        transform: translate(-300%,0);
      }

      app.swipe-direction--right section {
        transform: translate(300%,0);
      }

      app.swipe-direction--up section {
        transform: translate(0,300%);
      }

      app.swipe-direction--down section {
        transform: translate(0,-300%);
      }

      app section:target {
        display: block !important;
        visibility: visible;
        transform: translate(0,0);
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
