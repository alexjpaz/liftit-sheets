function mobile(context) {

  var liftOrderLength = context.liftOrder.length;
  var weekOrderLength = context.weekOrder.length;

  document.addEventListener('touchstart', handleTouchStart, false);
  document.addEventListener('touchmove', handleTouchMove, false);
  document.addEventListener('touchend', handleTouchEnd, false);

  var xDown = null;
  var yDown = null;
  var direction = null;
  var screenX = 0;
  var screenY = 0;

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

    var handler = function(){ /* noop */ };

    if ( Math.abs( xDiff ) > Math.abs( yDiff ) ) {/*most significant*/
      if ( xDiff > 0 ) {
        handler = handleLeft;
      } else {
        handler = handleRight;
      }
    } else {
      if ( yDiff > 0 ) {
        handler = handleUp;
      } else {
        handler = handleDown;
      }
    }
    /* invoke */
    handler(evt, xUp, yUp, xDiff, yDiff);
    /* reset values */
    xDown = null;
    yDown = null;
  };

  function handleTouchEnd(e) {
    console.log('handleTouchEnd', screenX, screenY);
    location.href = '#'+context.liftOrder[screenY] + '' + context.weekOrder[screenX];
  }

  function jump(h){
    var url = location.href;               //Save down the URL without hash.
    location.href = "#"+h;                 //Go to the target element.
    history.replaceState(null,null,url);   //Don't like hashes. Changing it back.
  }

  function handleUp() {
    screenY = screenY - 1;
    if(screenY < 0) {
      screenY = 0;
    }
    screenY = screenY % liftOrderLength;
  }

  function handleDown() {
    screenY = screenY + 1;
    screenY = screenY % liftOrderLength;

  }

  function handleLeft() {
    console.log('right', arguments);
    screenX = screenX - 1;
    if(screenX < 0) {
      screenX = 0;
    }
    screenX = screenX % weekOrderLength;
  }

  function handleRight() {
    console.log('right', arguments);
    screenX = screenX + 1;
    screenX = screenX % weekOrderLength;
  }
}

module.exports = mobile;
