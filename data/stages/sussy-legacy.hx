function postCreate() {
	camGame.flash(FlxColor.BLACK, 5);
    camHUD.visible = false;
}

function update() {
	window.title = "Friday Night Funkin': Modding Plus";
	healthBar.x = 340;
	healthBarBG.visible = true;
}

function onDadHit(event) {
	event.strumGlowCancelled = true;
	event.showSplash = false;}

function beatHit(curBeat:Int) {
	if (curSong == "sussy-legacy") {
        switch(curBeat) {
			            case 1: FlxTween.tween(camGame, {zoom: 1.1}, 5.2, {ease: FlxEase.cubeOut});
					    case 16:
							camHUD.visible = true;
						    defaultCamZoom = 0.8;
                            camGame.flash(FlxColor.WHITE, 1);
			            case 64:
							for (cameras in [camGame, camHUD]) FlxTween.tween(cameras, {zoom: 1.1}, 5.2, {ease: FlxEase.cubeOut});
							FlxTween.tween(escuridao, {alpha: 1}, 5, {ease: FlxEase.cubeOut});
							FlxTween.tween(snow, {alpha: 0}, 5, {ease: FlxEase.cubeOut});
							for (hud in [healthBar, healthBarBG, iconP1, iconP2, hudTxt, timeTxt, timeBarBG, timeBar]) FlxTween.tween(hud, {alpha: 0}, 5, {ease: FlxEase.cubeOut});
							for (strum in cpuStrums.members) FlxTween.tween(strum, {alpha: 0}, 5, {ease: FlxEase.cubeOut});
						case 48 | 128 | 192 | 208 | 256 | 320 | 352: camGame.flash(FlxColor.WHITE, 1);
						case 112 | 160 | 176 | 224 | 240 | 304: camGame.flash(FlxColor.BLACK, 1);
						case 80:
							for (hud in [healthBar, healthBarBG, iconP1, iconP2, hudTxt, timeTxt, timeBarBG, timeBar]) FlxTween.tween(hud, {alpha: 1}, 0.1, {ease: FlxEase.cubeOut});
							for (strum in cpuStrums.members) FlxTween.tween(strum, {alpha: 1}, 0.1, {ease: FlxEase.cubeOut});
							FlxTween.tween(escuridao, {alpha: 0}, 0.1, {ease: FlxEase.cubeOut});
							FlxTween.tween(snow, {alpha: 1}, 0.1, {ease: FlxEase.cubeOut});
							camGame.flash(FlxColor.WHITE, 1);
							remove(escuridao);
						case 384:
							camGame.flash(FlxColor.BLACK, 4);
							add(escuridao);
							FlxTween.tween(snow, {alpha: 0.6}, 0.1, {ease: FlxEase.cubeOut});
							FlxTween.tween(escuridao, {alpha: 1}, 0.1, {ease: FlxEase.cubeOut});
							FlxTween.tween(boyfriend, {alpha: 0}, 0.1, {ease: FlxEase.cubeOut});
							FlxTween.tween(camHUD, {alpha: 0}, 0.1, {ease: FlxEase.cubeOut});
		    }
}	if(curBeat >= 64 && curBeat < 128 || curBeat >= 192 && curBeat < 256) for (cameras in [camGame, camHUD]) cameras.zoom += 0.015;     }