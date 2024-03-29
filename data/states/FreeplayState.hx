import flixel.text.FlxText;
import flixel.util.FlxColor;
import funkin.savedata.FunkinSave;
import funkin.backend.system.Controls;
import flixel.text.FlxTextBorderStyle;
import flixel.addons.display.FlxBackdrop;

var e:Float = 0;

function postCreate() {
	canSelect = false;
	bg.alpha = 0;

	bg1 = new FlxSprite(0,0).loadGraphic(Paths.image('menus/freeplay/purple-alert'));
	bg2 = new FlxSprite(0,0).loadGraphic(Paths.image('menus/freeplay/dead-memories'));
	bg3 = new FlxSprite(0,0).loadGraphic(Paths.image('menus/freeplay/legacy'));
	for (bgs in [bg1, bg2, bg3]) {
		bgs.alpha = 0;
		bgs.antialiasing = true;
	    add(bgs); }

	dropThing = new FlxBackdrop(Paths.image('editors/bgs/charter'));
    dropThing.antialiasing = true;
	dropThing.alpha = 0.3;
    add(dropThing);
	
	coisa = new FlxBackdrop(Paths.image('menus/freeplay/coisa'));
    add(coisa);

	setinha = new FlxSprite(970, 80).loadGraphic(Paths.image('menus/freeplay/setinha'));
	add(setinha);

	setinhaBaixo = new FlxSprite(980, 650).loadGraphic(Paths.image('menus/freeplay/setinha'));
	setinhaBaixo.angle = 180;
	add(setinhaBaixo);
    
	posters = new FlxSprite(780, 155);
    posters.frames = Paths.getSparrowAtlas('menus/freeplay/freeplay');
	posters.animation.addByIndices('purple', 'poster', [0], null, 24, true);
    posters.animation.addByIndices('void', 'poster', [2], null, 24, true);
    posters.animation.addByIndices('legacy', 'poster', [1], null, 24, true);
    posters.antialiasing = true;
	add(posters);

	songName = new FlxText(190, 170);
    songName.setFormat(Paths.font("impact.ttf"), 80, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songName.borderSize = 2;
    songName.antialiasing = true;
	songName.scrollFactor.set();
	add(songName);

	songStuff = new FlxText(-30, 250);
    songStuff.setFormat(Paths.font("impact.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songStuff.borderSize = 2;
    songStuff.antialiasing = true;
	songStuff.scrollFactor.set();
	add(songStuff);

	for (item in grpSongs.members) item.alpha = 0;
	for (i in 0...iconArray.length)	iconArray[i].alpha = 0;
	
	curSelected = 0;
}

function postUpdate(){
    switch(songs[curSelected].name) {
		case "purple-alert": 
			FlxTween.tween(bg1, {alpha: 1}, 0.5, {ease: FlxEase.Linear});
			FlxTween.tween(bg2, {alpha: 0}, 0.5, {ease: FlxEase.Linear});
			FlxTween.tween(bg3, {alpha: 0}, 0.5, {ease: FlxEase.Linear});
			window.title = "Friday Night Funkin': Vs. Hankus | RenkWuz sprite was made in 2022";
			posters.animation.play('purple');
			posters.y = 165;
			posters.x = 780;
			songName.text = "Purple Alert";
			songName.x = 190;
			songStuff.x = -10;
			songStuff.text = "______________________________
			        In a TV Channel, 
		        BfWuz watch a alert
			                about ''RenkWuz'', a purple hitman
			            After this, BfWuz go around to try found
				                RenkWuz (AND HE FOUND)
			            After found RenkWuz, they start a rap battle.";
        case "void-mind": 
			FlxTween.tween(bg1, {alpha: 0}, 0.5, {ease: FlxEase.Linear});
			FlxTween.tween(bg2, {alpha: 1}, 0.5, {ease: FlxEase.Linear});
			FlxTween.tween(bg3, {alpha: 0}, 0.5, {ease: FlxEase.Linear});
			window.title = "Friday Night Funkin': Vs. Hankus | Formerly known as ''Dead Memories''";
			posters.animation.play('void');
			songName.text = "Void Mind";
			posters.y = 80;
			posters.x = 800;
			songName.x = 200;
			songStuff.x = -60;
			songStuff.text = "________________________________
			         Bf is teleported by Dad 
		        for a world called ''Nevolus''.
			                After some hours walking around,
			                    he found Hankus. A mutation version of Hank.
				                        He follow Hankus to a older Audito's base.
			                    After Hankus try to kill Bf, they start a rap battle.";
		case "sussy-legacy": 
			FlxTween.tween(bg1, {alpha: 0}, 0.5, {ease: FlxEase.Linear});
			FlxTween.tween(bg2, {alpha: 0}, 0.5, {ease: FlxEase.Linear});
			FlxTween.tween(bg3, {alpha: 1}, 0.5, {ease: FlxEase.Linear});
			window.title = "Friday Night Funkin': Vs. Hankus | This song have the modding plus hud because i the time that this hankus was the canon hankus the mod uses modding plus";
			posters.animation.play('legacy');
			posters.y = 165;
			posters.x = 780;
			songName.x = 140;
			songName.text = "sussy-legacy";
			songStuff.x = 10;
			songStuff.text = "______________________________
			        Basically same thing of Void Mind, 
		        but Hankus didn't invade Auditor's base yet.";
    }
}

function update(elapsed:Float) {
	if (controls.UP_P) changeSelection(-1);
	if (controls.DOWN_P) changeSelection(1);

    e += 50 * elapsed;
    setinha.y = ((4 - Math.sin((Math.PI * e) / 240)) * 20) - 20;
	setinhaBaixo.y = ((33 - Math.sin((Math.PI * e) / 240)) * 20) - 20;

	for (i in [songName, songStuff, coisa, setinha, setinhaBaixo]) i.color = interpColor.color;
	coisa.y -= elapsed * 100;
	dropThing.x += elapsed * 100;
    dropThing.y += elapsed * 100;
}