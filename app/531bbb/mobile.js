function mobile(context) {
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

    if ( Math.abs( xDiff ) > Math.abs( yDiff ) ) {/*most significant*/
      if ( xDiff > 0 ) {
        screenX = --screenX % 4;
        /* left swipe */
      } else {
        screenX = ++screenX % 4;
        /* right swipe */
      }
    } else {
      if ( yDiff > 0 ) {
        screenY = --screenY % context.liftOrder.length;
        screenX = 0;
      } else {
        screenY = ++screenY % context.liftOrder.length;
        screenX = 0;
      }
    }
    /* reset values */
    xDown = null;
    yDown = null;
  };

  function handleTouchEnd(e) {
    console.log(screenX);
    location.href = '#'+context.liftOrder[screenY] + '' + screenX;

  }

  function jump(h){
    var url = location.href;               //Save down the URL without hash.
    location.href = "#"+h;                 //Go to the target element.
    history.replaceState(null,null,url);   //Don't like hashes. Changing it back.
  }
}

module.exports = mobile;
