function beatHit(curBeat:Int) {
	if (curSong == "dead-memories") {
        switch(curBeat) {
			            case 128:
							PlayState.instance.comboGroup.visible = false;
							frente.visible = false;
							FlxTween.tween(fundo, {alpha: 0}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(zumbid, {alpha: 0}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(luz, {alpha: 0}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(somsonador1, {alpha: 0}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(somsonador2, {alpha: 0}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(frente, {alpha: 0}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(boyfriend, {y: 160}, 1, {ease: FlxEase.linear});
						case 192:
							PlayState.instance.comboGroup.visible = true;
							frente.visible = true;
							FlxTween.tween(fundo, {alpha: 1}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(zumbid, {alpha: 1}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(luz, {alpha: 1}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(somsonador1, {alpha: 1}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(somsonador2, {alpha: 1}, 0.5, {ease: FlxEase.linear});
							FlxTween.tween(frente, {alpha: 0.8}, 0.5, {ease: FlxEase.linear});
		                }
					}
				}
				
function postUpdate(elapsed:Float) {
    switch(curCameraTarget) {
        case 0: FlxTween.tween(frente, {alpha: 0.4}, 0.2, {ease: FlxEase.linear});
        case 1:	FlxTween.tween(frente, {alpha: 0.8}, 0.2, {ease: FlxEase.linear}); }
}