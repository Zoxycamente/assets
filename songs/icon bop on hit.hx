if (!FlxG.save.data.iconBop) disableScript(); 

var iconTween:FlxTween; //pibby apocalypse be like

function beatHit() {
    if (curSong == "sussy-legacy") {
        iconP1.scale.set(1.2, 1.2);
		iconP2.scale.set(1.2, 1.2);
    } else {
        iconP1.scale.set(1, 1);
	    iconP2.scale.set(1, 1);
    }
}

function onPlayerHit(){
    if (notSL) {
    if(iconTween != null) iconTween.cancel();
    iconP1.scale.x = 1.1;
    iconP1.scale.y = 1.1;
    iconTween = FlxTween.tween(iconP1.scale, {x: 1, y: 1}, 0.2, {
        onComplete: function(twn:FlxTween) {
            iconTween = null;
        }
    });
} if (curSong == "sussy-legacy") notSL = false; 
}

function onDadHit(event){
    if (notSL) {
    if(iconTween != null) iconTween.cancel();
    iconP2.scale.x = 1.1;
    iconP2.scale.y = 1.1;
    iconTween = FlxTween.tween(iconP2.scale, {x: 1, y: 1}, 0.2, {
        onComplete: function(twn:FlxTween) {
            iconTween = null;
        }
    });
} if (curSong == "sussy-legacy") notSL = false; 

}