var activade = false;
var whiteBG:FlxSprite;

function create() {
    whiteBG = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 1), Std.int(FlxG.height * 1), FlxColor.WHITE);
	whiteBG.scale.set(5, 5);
	insert(members.indexOf(dad), whiteBG);
	whiteBG.alpha = 0;
}

function fadeWhiteFlash()	{
  whiteBG.alpha = 0.6;
  FlxTween.tween(whiteBG, {alpha: 0}, 0.3, {ease: FlxEase.linear});
}

function onEvent(e) {
   if (e.event.name == "Fade White") {
        activade = e.event.params[0];
    }
}

function stepHit() {
    if (activade){
        if (curBeat % 2 == 0) {
            fadeWhiteFlash();
        }
    }
}
