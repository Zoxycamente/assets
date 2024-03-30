import openfl.geom.ColorTransform;

function update() window.title = "Friday Night Funkin': Vs. Hankus | Void Mind | My memories are death";

function beatHit(curBeat:Int) {
switch (curBeat) {
					case 4 | 20 | 36 | 52: 
						FlxTween.tween(camHUD, {zoom: 1.1}, 1.1);
						FlxTween.tween(FlxG.camera, {zoom: 1.1}, 1.1);
				    case 63: FlxTween.tween(camHUD, {zoom: 0.3}, 0.5);
					case 64: FlxG.camera.flash(FlxColor.WHITE, 1);
					case 128:
						for (i in [iconP2, iconP1, timeTxt, timeBar, timeBarBG, missesTxt, accuracyTxt, scoreTxt, healthBar])
						FlxTween.tween(i, {alpha: 0}, 0.5, {ease: FlxEase.linear});
						for(h in 0...4) {
							FlxTween.tween(playerStrums.members[h], {alpha: 0.5}, 1, {ease: FlxEase.quartInOut});
						    FlxTween.tween(cpuStrums.members[h], {alpha: 0}, 1, {ease: FlxEase.quartInOut}); }
						FlxTween.tween(camHUD, {alpha: 0.3}, 0.5, {ease: FlxEase.linear});
					    boyfriend.colorTransform.color = 0xFF0C86E9; 
                        dad.colorTransform.color = 0xFFE90C31;
						FlxG.camera.flash(FlxColor.RED, 1);
					case 192:
						for (o in [iconP2, iconP1, timeTxt, timeBar, timeBarBG, missesTxt, accuracyTxt, scoreTxt, healthBar]) 
						FlxTween.tween(o, {alpha: 1}, 0.5, {ease: FlxEase.linear});
						for(t in 0...4) {
							FlxTween.tween(playerStrums.members[t], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
						    FlxTween.tween(cpuStrums.members[t], {alpha: 1}, 1, {ease: FlxEase.quartInOut}); }
						boyfriend.colorTransform = new ColorTransform();
                        dad.colorTransform = new ColorTransform();
						FlxG.camera.flash(FlxColor.WHITE, 1);
				}
	if(curBeat >= 64 && curBeat < 128 || curBeat >= 192 && curBeat < 256)
		{
			FlxG.camera.zoom += 0.015;
			camHUD.zoom += 0.03;
		}
	}
