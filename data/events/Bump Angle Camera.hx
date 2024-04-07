var activade = false;

function onEvent(e) {
    if (e.event.name == "Bump Angle Camera") {
        if (e.event.params[0] == true) activade = true; 
        if (e.event.params[0] == false) activade = false;
    }
}

function bumpRight() {
    camHUD.angle = 7;
    camGame.angle = 7;
    camGame.zoom += 0.015;
    camHUD.zoom += 0.03;
    for (cameras in [camGame, camHUD]) FlxTween.tween(cameras, {angle: 0}, 1, {ease: FlxEase.cubeOut});
}

function bumpLeft() {
    for (cameras in [camGame, camHUD]) cameras.angle = -50;
    camGame.zoom += 0.015;
    camHUD.zoom += 0.03;
    for (cameras in [camGame, camHUD]) FlxTween.tween(cameras, {angle: 0}, 1, {ease: FlxEase.cubeOut});
}

function beatHit() {
      if (curBeat % 2 == 0) bumpRight();
      if (curStep % 2 == 2) bumpLeft();
}