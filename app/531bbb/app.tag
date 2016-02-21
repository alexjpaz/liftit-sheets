require('./month.tag');
require('./bottom.tag');
require('./week.tag');
require('./lift.tag');

<app>
<section each={l, i in lifts} name={l.name} id='{ l.name }'>
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


document.addEventListener('touchstart', handleTouchStart, false);
document.addEventListener('touchmove', handleTouchMove, false);
document.addEventListener('touchend', handleTouchEnd, false);

var xDown = null;
var yDown = null;
var direction = null;
var liftPos = 0;

function handleTouchStart(evt) {
    xDown = evt.touches[0].clientX;
    yDown = evt.touches[0].clientY;
};

function handleTouchMove(evt) {
    if ( ! xDown || ! yDown ) {
        return;
    }

    var xUp = evt.touches[0].clientX;
    var yUp = evt.touches[0].clientY;

    var xDiff = xDown - xUp;
    var yDiff = yDown - yUp;

    if ( Math.abs( xDiff ) > Math.abs( yDiff ) ) {/*most significant*/
        if ( xDiff > 0 ) {
            /* left swipe */
        } else {
            /* right swipe */
        }
    } else {
        if ( yDiff > 0 ) {
          liftPos = liftPos++ % self.liftOrder.length;
        } else {
          liftPos = liftPos-- % self.liftOrder.length;
        }
    }
    /* reset values */
    xDown = null;
    yDown = null;
};

function handleTouchEnd(e) {
    location.href = '#'+self.liftOrder[liftPos];
}

function jump(h){
  var url = location.href;               //Save down the URL without hash.
  location.href = "#"+h;                 //Go to the target element.
  history.replaceState(null,null,url);   //Don't like hashes. Changing it back.
}

  </script>
  <style>
    app > section {
      width: 100%;
      height: 100%;
      position: absolute;
      top: -100%;
      left: 0;
      display: none
      border: 1px solid red;
      transition:.6s all;
    }

    app > section:target {
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
