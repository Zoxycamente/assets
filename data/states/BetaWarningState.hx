function create() {
    var bg:FlxSprite = new FlxSprite().makeSolid(FlxG.width, FlxG.height, 0xFF250D0D);
		bg.updateHitbox();
		bg.scrollFactor.set();
		add(bg);
}

function postCreate() {
    window.title = "Friday Night Funkin': Vs. Hankus - Read the warning and be careful!";

    titleAlphabet.y = disclaimer.y - 120;
    disclaimer.screenCenter();
    disclaimer.text = "This mod and been made on Codename engine, an unfinished engine.\n\nAlso, this mod have *Flashing lights, cameras rotation, screen shake and shaders [just on Sabotage Error]*\nBut all these thing can be disabled on options.\n\n[ALSO, THIS IS AN ''FIXED'' VERSION OF THE MOD'S CANCELLED BUILD.]";
}