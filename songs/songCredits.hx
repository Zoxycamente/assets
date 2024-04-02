import flixel.util.FlxColor;
import flixel.text.FlxTextBorderStyle;

public var hankus:FlxText;
var color = 0xFF754B4B;
var camOther:FlxCamera;

function postCreate() {
    Main = new FlxSprite(350, 1).makeGraphic(570, 1300, color);
    Main.alpha = 0;
    Main.cameras = [camOther];
    add(Main);

    BorderRight = new FlxSprite(920, 1).makeGraphic(7, 1300, 0xFF000000);
    BorderRight.alpha = 0;
    BorderRight.cameras = [camOther];
    add(BorderRight);

    BorderLeft = new FlxSprite(350, 1).makeGraphic(7, 1300, 0xFF000000);
    BorderLeft.alpha = 0;
    BorderLeft.cameras = [camOther];
    add(BorderLeft);

    songName = new FlxText(0, 30, FlxG.width, PlayState.SONG.meta.displayName);
    songName.setFormat(Paths.font("impact.ttf"), 50, 0xFFFF0000, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songName.borderSize = 2.3;
    songName.alpha = 0;
    songName.cameras = [camOther];
    add(songName);

    songOp = new FlxText(0, 100, FlxG.width, songOp + "\n_____________");
    songOp.setFormat(Paths.font("impact.ttf"), 25, 0xFFFF0000, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songOp.borderSize = 2.3;
    songOp.alpha = 0;
    songOp.cameras = [camOther];
    add(songOp);
    hankus = new FlxText(-60, 100, FlxG.width, "Alt.Hankus");
    hankus.setFormat(Paths.font("impact.ttf"), 25, 0xFFFF0000, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    hankus.borderSize = 2.3;
    hankus.alpha = 0;
    hankus.cameras = [camOther];
    if (curSong == "sabotage-error") add(hankus);

    Credits = new FlxText(0, 190, FlxG.width, "CREDITS\n_____________");
    Credits.setFormat(Paths.font("impact.ttf"), 40, 0xFFFFE600, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    Credits.borderSize = 2.3;
    Credits.alpha = 0;
    Credits.cameras = [camOther];
    add(Credits);

    Coder = new FlxText(0, 300, FlxG.width, "CODER\npeanut cut\n             ");
    Coder.setFormat(Paths.font("impact.ttf"), 30, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    Coder.borderSize = 2.1;
    Coder.alpha = 0;
    Coder.cameras = [camOther];
    add(Coder);

    Artist = new FlxText(0, 400, FlxG.width, "Artist\npeanut cut\n             ");
    Artist.setFormat(Paths.font("impact.ttf"), 30, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    Artist.borderSize = 2.1;
    Artist.alpha = 0;
    Artist.cameras = [camOther];
    add(Artist);

    Composer = new FlxText(0, 500, FlxG.width, Composer + "\n             ");
    Composer.setFormat(Paths.font("impact.ttf"), 30, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    Composer.borderSize = 2.1;
    Composer.alpha = 0;
    Composer.cameras = [camOther];
    add(Composer);

    Charter = new FlxText(0, 600, FlxG.width, "Charter\npeanut cut");
    Charter.setFormat(Paths.font("impact.ttf"), 30, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    Charter.borderSize = 2.1;
    Charter.alpha = 0;
    Charter.cameras = [camOther];
    add(Charter);
}

function songCredits() {
    for (a in [songName, songOp, Credits, Coder, Artist, Composer, Charter, hankus]) {
        FlxTween.tween(a, {alpha: 1}, 1, {ease: FlxEase.circInOut});
        FlxTween.tween(Main, {alpha: 0.6}, 1, {ease: FlxEase.circInOut});
        for (h in [BorderRight, BorderLeft]) FlxTween.tween(h, {alpha: 0.8}, 0.8, {ease: FlxEase.circInOut});
    }

    new FlxTimer().start(3, function(timer:FlxTimer) {
        for (i in [songName, songOp, Credits, Coder, Artist, Composer, Charter, Main, BorderRight, BorderLeft, hankus]) {
            FlxTween.tween(i, {alpha: 0}, 1.5, {ease: FlxEase.circInOut, onComplete: function(delAssets:FlxTween) {
                remove(i);
            }});
        }
    });
}

function onSongStart() 
    if (notSL) songCredits();
    if (curSong == "sussy-legacy") notSL = false;

function beatHit(curBeat:Int) if (curSong == "sussy-legacy") if (curBeat == 16) songCredits();

function create() {
    FlxG.cameras.remove(camOther, false);
    camOther = new FlxCamera();
    FlxG.cameras.add(camOther, false);
    camOther.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camOther, false);

    switch(curSong) {
        case "consternation":
            Composer = "Composer\ncuddlykitten";
            songOp = "Hankus Vs. Bgrunt";
        case "purple-alert":
            color = 0xFF3B2844;
            Composer = "Composer\nfreshpizza";
            songOp = "RenkWuz Vs. BfWuz";
        case "void-mind":
            Composer = "Composer\nmica";
            songOp = "Incident Hankus Vs. Incident Bf";
        case "sabotage-error":
            Composer = "Composer\ndeko";
            songOp = "                   Vs. Bfus";
        case "sussy-legacy":
            color = 0xFF4E4B75;
            Composer = "Composer\nCH";
            songOp = "Legacy Hankus Vs. Alt.Bf";
        case "hanksus":
            color = 0xFFCCC934;
            Composer = "Composer\nmica";
            songOp = "Mogus Vs. Bf";
        default:
            Composer = "Composer\n?????";
            songOp = "??? Vs. Bf";
    }
}