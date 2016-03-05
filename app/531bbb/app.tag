require('./month.tag');
require('./bottom.tag');
require('./week.tag');
require('./lift.tag');


<app class='swipe-direction--{ swipeDirection || "up" }'>
  <row each={l, i in lifts} name={l.name}>
    <lift name={l.name} weight={l.weight} api={parent.api}></lift>
  </row>
  <nav class='default'>
    <ul each={l in lifts} class='{ l.name }'>
      <li>
        <strong>{ l. name }</strong>
        <a href='#{ l.name }3x5'>3x5</a>
        <a href='#{ l.name }3x3'>3x3</a>
        <a href='#{ l.name }531'>531</a>
      </li>
    </ul>
  </nav>
  <script>
    var self = this;
    var api = this.api = opts;

    this.liftOrder = api.liftOrder;

    this.weekOrder = api.weekOrder;

    this.lifts = api.lifts;

    this.lifts.forEach(function(lift) {
      lift.weight = opts.getURLParameter(lift.name);
      console.log(lift.weight)
    });

    this.api.mobile(this);
  </script>
  <style >
    @media (min-width: 992px), print {
      row {
        display: block;
        overflow: hidden;
      }

      * {
        box-sizing: border-box;
      }

      app.nav.default {
        display: none;
      }
    }
    @media screen and (max-width: 992px) {
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
        background: white;
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


      app nav.default ul li strong {
        display: inline-block;
          width: 100px;
      }

      app nav.default ul li a {
        text-align: center;
        height: 40px;
        line-height: 40px;
        width: 40px;
        display: inline-block;
        text-decoration: none;
        color: white;
      }



      app nav.default ul {
        overflow: hidden;
        color: white;
      }
      app nav.default ul.press { background: red; }
      app nav.default ul.deadlift { background: green; }
      app nav.default ul.bench { background: blue; }
      app nav.default ul.squat { background: orange; }

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
        width: 100%;
        height: 100%;
      }
    }
  </style>
</app>
