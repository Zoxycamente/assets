import flixel.text.FlxTextBorderStyle;

var warningTxt:FlxText;
var iconWarning:FlxSprite;
var angel = new CustomShader("angel");

function postCreate() {
    angel.data.pixel.value = [0.1, 0.1];
    angel.data.stronk.value = [1, 1];
    camGame.addShader(angel);
    camHUD.addShader(angel);
}

function update(elapsed:Float) {
    if (angel != null) {
        angel.data.stronk.value[0] = FlxMath.lerp(angel.data.stronk.value[0], 0, FlxMath.bound(elapsed * 7, 0, 1));
        angel.data.pixel.value[0] = FlxMath.lerp(angel.data.pixel.value[0], 1, FlxMath.bound(elapsed * 9, 0, 1));
        angel.data.iTime.value = [Conductor.songPosition / 1000];
    }
    
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

    warningTxt = new FlxText(1190, 500, FlxG.width, "DON'T MISS.");
    warningTxt.setFormat(Paths.font("impact.ttf"), 50, FlxColor.YELLOW, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    warningTxt.borderSize = 2.3;
    warningTxt.antialiasing = true;
    warningTxt.alpha = 0;
    warningTxt.screenCenter(FlxAxes.X);
    warningTxt.cameras = [camHUD];
    add(warningTxt);
}

function onSongStart() {
    //barSongLength = 92250;

    for (h in [warningTxt, iconWarning]) {
        FlxTween.tween(h, {alpha: 1, y: 300}, 1, {ease: FlxEase.cubeInOut});

    new FlxTimer().start(3, function(timer:FlxTimer) {
        for (i in [warningTxt, iconWarning]) {
            FlxTween.tween(i, {alpha: 0, y: -1000}, 1.5, {ease: FlxEase.cubeInOut, onComplete: function(delAssets:FlxTween) {
                remove(i);
            }});
        }
    });
}}

function stepHit(curStep:Int) {
    switch(curStep) {
        case 15, 33, 64, 80, 96, 129, 144, 161, 209: angel.data.stronk.value[0] = 0.1;
        case 208:
            /*FlxTween.num(96250, 2000004, 3, {ease: FlxEase.quadInOut, onUpdate: function(v:FlxTween){
            barSongLength = v.value;
        }});*/
    }
}

function onDadHit(hit) if (health > 1.2) hit.healthGain += 0.03; 

function onPlayerMiss() health -= 123456789;