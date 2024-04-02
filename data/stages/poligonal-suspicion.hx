import funkin.backend.shaders.WiggleEffect;

var wiggleEffect:WiggleEffect;
var bg:FlxSprite;

function update(elapsed:Float) {
	tweenchrom = FlxTween.num(1, 0, 0.04, {ease: FlxEase.circOut}, function(val:Float) {
		wiggleEffect.waveAmplitude = val;
		
	});
window.title = "Friday Night Funkin': Vs. Hankus | Sabotage Error | What's that dark cum?";
}

function create(){
	defaultCamZoom = 0.5;
	wiggleEffect = new WiggleEffect();
	wiggleEffect.waveFrequency = 1;
	wiggleEffect.waveSpeed = -52;

	bg = new FlxSprite(-80, -80).loadGraphic(Paths.image('stages/suspeita-poligonal/bg1'));
	bg.scale.set(1.7, 1.7);
    bg.antialiasing = true;
	bg.shader = wiggleEffect.shader;
	insert(members.indexOf(dad), bg);
    add(bg);

	piso = new FlxSprite(100, 800).loadGraphic(Paths.image('stages/suspeita-poligonal/piso'));
	piso.scale.set(1.8, 1.8);
	piso.antialiasing = true;
	insert(members.indexOf(dad), piso);
	add(piso);
}