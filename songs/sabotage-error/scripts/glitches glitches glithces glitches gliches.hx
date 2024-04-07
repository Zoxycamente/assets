public var glitch = new CustomShader("individualGlitches Missingno");

var healthBorder2:FlxSprite;

function postCreate() {	
    healthBorder2 = new FlxSprite(500, 0).loadGraphic(Paths.image('game/healthSabotage')); 
    healthBorder2.antialiasing = true;
    healthBorder2.scale.set(0.8, 0.8);
    healthBorder2.cameras = [camHUD];
    insert(members.indexOf(healthBar) + 1, healthBorder2);
    add(healthBorder2);
    if (Options.downscroll) {
        healthBorder2.y = 594;
    } else {
        healthBorder2.y = 557;
    }
}

function onSongStart() camGame.flash(0xFF000000, 7);

function update(elapsed:Float) {
    if (!FlxG.save.data.shaderShit){
        tweenchrom = FlxTween.num(5, 1, 0.015, {ease: FlxEase.bounceInOut}, function(val:Float) {
            glitch.binaryIntensity = val;
        });
    }
    window.title = "Friday Night Funkin': Vs. Hankus | Sabotage Error | What's that dark cum?";
}

function postUpdate() {
    window.borderless = true;

    if (dad.curCharacter == "corrupted") if (!FlxG.save.data.shaderShit) for (h in cpuStrums.members) h.shader = glitch; 
    
    for (i in [healthBorder2, healthBar, timeTxt, timeBarBG, missesTxt, accuracyTxt, scoreTxt, icon, coolSongText]) i.shader = glitch;

    if (!FlxG.save.data.shaderShit){
    if (health < 0.4) boyfriend.shader = iconP1.shader = glitch;
    else boyfriend.shader = iconP1.shader = null;
    
    if (health > 1.6) dad.shader = corruptedIcon.shader = glitch;
    else dad.shader = corruptedIcon.shader = null;
    }
}

function onDadHit(hit) {
    camGame.shake(0.010, .1, null, true);
    camHUD.shake(0.006, .1, null, true);
    if (health > 0.1) hit.healthGain += 0.04;
}

function beatHit(curBeat) {
    if (camZooming && FlxG.camera.zoom < 1.35 && curBeat % 1 == 0) {
        FlxG.camera.zoom += 0.017;
        camHUD.zoom += 0.02;
    }
}