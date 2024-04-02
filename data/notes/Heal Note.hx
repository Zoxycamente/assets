var healTween:FlxTween;

function onPlayerHit(e) {
    if (e.noteType == "Heal Note"){
        health += .125;
        boyfriend.color = FlxColor.GREEN;
        healTween = FlxTween.color(boyfriend, 1, FlxColor.GREEN, FlxColor.WHITE, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween){bfHurtTween = null;}});
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Heal Note"){
		e.cancel();
		deleteNote(e.note);
	}
}

function onDadHit(e) {
    if (e.noteType == "Heal Note"){
        health -= .125;
        dad.color = FlxColor.GREEN;
        healTween = FlxTween.color(dad, 1, FlxColor.GREEN, FlxColor.WHITE, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween){bfHurtTween = null;}});
    }
}

function postCreate()
    if (healTween != null)
        healTween.cancel();