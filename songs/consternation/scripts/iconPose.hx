var timer = 0;
public var iconPose = FlxSprite();

function postCreate() {
    iconP2.visible = false;

    iconPose = new FlxSprite(0,0);
    iconPose.frames = Paths.getSparrowAtlas('icons/hankus_icon');
    iconPose.animation.addByIndices('idle', 'icon idle dance', [0,1,2,3], "", 24, true);
    iconPose.animation.addByIndices('left', 'icon sing left', [0,1,2,3], "", 24, false);
    iconPose.animation.addByIndices('right', 'icon sing right', [0,1,2,3], "", 24, false);
    iconPose.animation.addByIndices('up', 'icon sing up', [0,1,2,3], "", 24, false);
    iconPose.animation.addByIndices('down', 'icon sing down', [0,1,2,3], "", 24, false);
    iconPose.animation.play('idle');
    iconPose.cameras = [camHUD];
    add(iconPose);
}

function update() {
    iconPose.x = iconP2.x;
    iconPose.y = iconP2.y + 40;

    if (timer == 0) iconPose.animation.play('idle');
	if (timer > 0) timer -= 1;
}

function onDadHit(note) {
    if (note.direction == 0) iconPose.animation.play('left');
    if (note.direction == 1) iconPose.animation.play('down');
    if (note.direction == 2) iconPose.animation.play('up');
    if (note.direction == 3) iconPose.animation.play('right');
    timer = 70;
}