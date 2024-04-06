if (!FlxG.save.data.timebar) disableScript();

import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;

public var timeTxt:FlxText;
public var timeBarBG:FlxSprite;
public var timeBar:FlxBar;

function create() {	
    timeTxt = new FlxText(42 + (FlxG.width / 2) - 585, 20, 400, PlayState.SONG.meta.name, 32); 
    timeTxt.setFormat(Paths.font("impact.ttf"), 16, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.borderSize = 2;
    if (curSong == "sussy-legacy") timeTxt.font = Paths.font("vcr.ttf");

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x;
	timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    timeBarBG.scrollFactor.set();
    timeBarBG.scale.set(1, 1.5);
    timeBarBG.loadGraphic(Paths.image("game/timeBar"));
    if (curSong == "sussy-legacy") timeBarBG.loadGraphic(Paths.image("game/healthSus"));

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xff410f20, 0xFFE90C31);
    if (curSong == "sussy-legacy") timeBar.createFilledBar(0xFF5E5E5E, 0xFF187A00);
    timeBar.numDivisions = 800;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;

    timeTxt.x = 830;
    timeTxt.y = 27;
    timeBar.x = 805;
    timeBarBG.x = 800;

    for (times in [timeBar, timeBarBG, timeTxt]) {
        times.cameras = [camHUD];
        add(times);
    }
}
	
function update(elapsed:Float) {
    if (inst != null && timeBar != null && timeBar.max != inst.length)  timeBar.setRange(0, Math.max(1, inst.length));
    
    if (inst != null && timeTxt != null) {
        var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
        var minutes = Std.int(timeRemaining / 60);
        timeTxt.text = PlayState.SONG.meta.displayName + " - " + minutes + ":" + seconds;
        if (curSong == "sussy-legacy") {
            timeTxt.text = "sussy-legacy";
            timeBarBG.scale.set(1, 1);
            timeTxt.x = 550;
            timeBar.x = 360;
            timeBarBG.x = 360;
        }
    }
}