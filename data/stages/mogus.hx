function update() window.title = "Friday Night Funkin': Vs. Hankus | HankSus Poggers | THIS SONG'S GOES HARD";

function create() {
    dad.y += 55;
    defaultCamZoom = 0.9;

    whiteBG = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 1), Std.int(FlxG.height * 1), FlxColor.WHITE);
	whiteBG.scale.set(5, 5);
	insert(members.indexOf(dad), whiteBG);
    add(whiteBG);
}