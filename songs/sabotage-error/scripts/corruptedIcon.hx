public var corruptedIcon:FlxSprite;

function postCreate() {
    iconP2.visible = false;

    corruptedIcon = new FlxSprite(0,0);
    corruptedIcon.frames = Paths.getSparrowAtlas('icons/corruptedv3');
    corruptedIcon.animation.addByIndices('idle', 'normal icon', [1,2,3,4,5,6,7], "", 24, false);
    corruptedIcon.animation.addByIndices('losing', 'lose icon', [1,2,3,4,5,6,7], "", 24, false);
    corruptedIcon.animation.play('idle');
    corruptedIcon.cameras = [camHUD];
    corruptedIcon.antialiasing = true;
    add(corruptedIcon);
}

function postUpdate() {
    corruptedIcon.x = iconP2.x;
    corruptedIcon.y = iconP2.y + 60;
 
    if (health > 1.6) {
        corruptedIcon.animation.play('losing');
    } else {
        corruptedIcon.animation.play('idle');
    }
}