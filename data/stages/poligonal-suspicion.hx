import funkin.backend.shaders.WiggleEffect;

var wiggleEffect:WiggleEffect;
var bg:FlxSprite;

function update(elapsed:Float) {
	FlxTween.num(1, 0, 0.8, { ease: FlxEase.circOut }, function(val:Float) {
		wiggleEffect.waveAmplitude = val;
		
	});
}

function create(){
	defaultCamZoom = 0.5;
	wiggleEffect = new WiggleEffect();
	wiggleEffect.waveFrequency = 1;
	wiggleEffect.waveSpeed = 0.5;
	wiggleEffect.shader.uTime.value = 1;

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