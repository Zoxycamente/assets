var bounce = false;
var intensity = 10;

function onEvent(boop) {
   if (boop.event.name == "Bouncy_HUD") {
     bounce = boop.event.params[0];
     intensity = boop.event.params[1];
   }
}

function beatHit() {
    if (bounce){
      if (curBeat % 2 == 0) {
          camHUD.angle = -intensity;
          FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.circOut});
      }
      if (curBeat % 2 == 2) {
        camHUD.angle = intensity;
          FlxTween.tween(camHUD, {angle: 0}, 1, {ease: FlxEase.sineIn});
      }
    }
}