import flixel.text.FlxTextBorderStyle;

var warningTxt:FlxText;
var iconWarning:FlxSprite;

function update(elapsed:Float) {
    window.title = "Friday Night Funkin': Vs. Hankus | Consternation | Why all that consternation?"; 
    accuracyTxt.x = 200;
    missesTxt.visible = false; 
}

function create() {
    iconWarning = new FlxSprite(1190, 500).loadGraphic(Paths.image('game/warning')); 
    iconWarning.antialiasing = true;
    iconWarning.alpha = 0;
    iconWarning.cameras = [camHUD];
    add(iconWarning);

    warningTxt = new FlxText(2000, 500, FlxG.width, "DON'T MISS.");
    warningTxt.setFormat(Paths.font("impact.ttf"), 50, FlxColor.YELLOW, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    warningTxt.borderSize = 2.3;
    warningTxt.antialiasing = true;
    warningTxt.alpha = 0;
    warningTxt.screenCenter(FlxAxes.X);
    warningTxt.cameras = [camHUD];
    add(warningTxt);
}

function onSongStart() {
    for (h in [warningTxt, iconWarning]) FlxTween.tween(h, {alpha: 1, y: 300}, 1, {ease: FlxEase.cubeInOut});

    new FlxTimer().start(3, function(timer:FlxTimer) {
        for (i in [warningTxt, iconWarning]) {
            FlxTween.tween(i, {alpha: 0, y: -1000}, 1.5, {ease: FlxEase.cubeInOut, onComplete: function(delAssets:FlxTween) {
                remove(i);
            }});
        }
    });
}

function onDadHit(hit) if (health > 1.2) hit.healthGain += 0.03; 

//function onPlayerMiss() health -= 123456789;