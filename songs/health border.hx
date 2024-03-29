public var healthBorder:FlxSprite;

function postCreate() {
    healthBorder = new FlxSprite(624, 648).loadGraphic(Paths.image('game/healthBorder')); 
    healthBorder.cameras = [camHUD];
    insert(members.indexOf(healthBar) + 1, healthBorder);
    healthBorder.scale.set(1.01, 1);
    if (curSong == "sussy-legacy") remove(healthBorder);
    else add(healthBorder);

    for (i in [missesTxt, accuracyTxt, scoreTxt]) {
        i.color = 0xFFE90C31; 
        i.font = Paths.font("impact.ttf");
        i.y = 648;
    }
    accuracyTxt.x = missesTxt.x = 101; 
    scoreTxt.x = 19;

    healthBar.x = 626;
    healthBarBG.visible = false;
}