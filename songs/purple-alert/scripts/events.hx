function update() {
	boyfriend.forceIsOnScreen = true;
	window.title = "Friday Night Funkin': Vs. Hankus | Purple Alert | And why he purple";
}

function onSongStart() {
	for (stage in [stage.getSprite("bg"),stage.getSprite("a")])	FlxTween.tween(stage, {alpha: 0.3}, 3, {ease: FlxEase.circOut});
	defaultCamZoom += 0.3;
}

function onPlayerMiss(curBeat:Int) {
    FlxTween.color(boyfriend, 2, FlxColor.PURPLE, FlxColor.WHITE, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween){hurtTween = null;}});
	if (curBeat == 288) {
		FlxTween.color(boyfriend, 2, FlxColor.RED, FlxColor.PURPLE, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween){hurtTween = null;}});
	}
}

function beatHit(curBeat:Int) {
	switch (curBeat)
					{
					case 16:
						defaultCamZoom = 0.9;
					case 29:
						FlxTween.tween(camGame, {zoom: 1.1}, 1.8);
					case 32:
						defaultCamZoom += 0.5;
						camGame.flash(FlxColor.WHITE, 1);
					case 64:
						for (stage in [stage.getSprite("bg"),stage.getSprite("a")])	FlxTween.tween(stage, {alpha: 1}, 1, {ease: FlxEase.circOut});
						defaultCamZoom = 0.6;
						camGame.flash(FlxColor.WHITE, 1);
					case 128:
						defaultCamZoom += 0.4;
						camGame.flash(FlxColor.WHITE, 1);
					case 192:
						defaultCamZoom = 0.6;
						camGame.flash(FlxColor.WHITE, 1);
					case 256:
						camHUD.alpha = 0;
						defaultCamZoom += 0.5;
						camGame.flash(FlxColor.BLACK, 10);
					case 288:
						for (i in [dad, boyfriend, iconP1, iconP2, healthBar, healthBorder, timeBarBG, missesTxt, accuracyTxt, scoreTxt, timeTxt]) i.color = 0xFFA30CE9; 
						for (i in playerStrums.members) i.color = 0xFFA30CE9; 
                        for (i in cpuStrums.members) i.color = 0xFFA30CE9; 
						timeBar.createFilledBar(0xff410f41, 0xFF910CE9);
						for (stage in [stage.getSprite("bg"),stage.getSprite("a")])	stage.color = 0xFFA30CE9; 
						camHUD.alpha = 1;
						defaultCamZoom = 0.6;
					    camGame.flash(FlxColor.WHITE, 1);
					case 352:
						for (i in [dad, boyfriend, iconP1, iconP2, healthBar, healthBorder, timeBarBG, timeTxt]) i.color = FlxColor.WHITE; 
						for (i in playerStrums.members) i.color = FlxColor.WHITE; 
                        for (i in cpuStrums.members) i.color = FlxColor.WHITE; 
						for (i in [missesTxt, accuracyTxt, scoreTxt]) i.color = 0xFFE90C31; 
						timeBar.createFilledBar(0xff410f20, 0xFFE90C31);
						for (stage in [stage.getSprite("bg"),stage.getSprite("a")]) stage.color = FlxColor.WHITE; 
						defaultCamZoom = 0.8;
						camGame.flash(FlxColor.WHITE, 1);
					}
				if ((curBeat >= 64 && curBeat < 128) || (curBeat >= 192 && curBeat < 256) || (curBeat >= 288 && curBeat < 352))
					health = FlxG.random.float(0.06, 2);
				for (cameras in [camGame, camHUD]) cameras.zoom += 0.045;
			}