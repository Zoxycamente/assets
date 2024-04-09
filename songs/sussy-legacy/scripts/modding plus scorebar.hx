import flixel.text.FlxTextBorderStyle;

public var hudTxt:FlxText;

var ratingFC:String = "FC";
var ratingStuff:Array<Dynamic> = [
    ['seriously dude stop playing', 0.1], //From 0% to 19%['FUCK IT', 0.2], //From 0% to 19%
    //['ERROR', 0.4], From 20% to 39%
    ['(Clear) E', 0.5], //From 40% to 49%['Bad', 0.5],
    ['(Clear) D', 0.6], //From 50% to 59%['Uhh', 0.6],
    ['(Clear) C', 0.69], //From 60% to 68%['Okay', 0.69]
    ['(Clear) B', 0.7], //69%['Funny', 0.7],
    ['(SDCB) A', 0.8], //From 70% to 79%['Good', 0.8],
    ['(FC) AA', 0.9], //From 80% to 89%['Pog', 0.9],
    ['(GFC) AAA', 1], //From 90% to 99%['Poggers!', 1],
    ['(MFC) AAAA', 1] //The value on this one isn't used actually, since Perfect is always "1"['MEGA POGGERS!!!', 1]
];

function getRating(accuracy:Float):String {
    if (accuracy < 0) return "?";
    for (rating in ratingStuff) if (accuracy < rating[1]) return rating[0];
    return ratingStuff[ratingStuff.length - 1][0];
}

function getRatingFC(accuracy:Float, misses:Int):String {
    // this sucks but idk how to make it better lol
    if (misses == 0) {
        if (accuracy == 1.0) ratingFC = "SFC";
        else if (accuracy >= 0.99) ratingFC = "GFC";
        else ratingFC = "FC";
    }
    if (misses > 0) {
        if (misses < 2) ratingFC = "Missed";
        else if (misses >= 2) ratingFC = "Missed";
    }
}

function create() {	
    hudTxt = new FlxText(0, 685, FlxG.width, hudTxt);
    hudTxt.setFormat(Paths.font("vcr.ttf"), 18, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    hudTxt.borderSize = 2;
    hudTxt.antialiasing = true;
    hudTxt.screenCenter(FlxAxes.X);
    hudTxt.cameras = [camHUD];
    add(hudTxt);
}

function update(elapsed:Float) {
    var acc = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
    var rating:String = getRating(accuracy);
    getRatingFC(accuracy, misses);
    //  hudTxt.text = "- Score: " + songScore + " // Combo: " + combo + " // Misses: " + misses +  " // Accuracy: " + acc + "%" + " [" + ratingFC + "] -";
        hudTxt.text = "Score: " + songScore + " | Combo Breaks: " + misses +  " | Accuracy: " + acc + "%" + " | " + rating;
    }

function postCreate(){
    for (i in [missesTxt, accuracyTxt, scoreTxt]) i.visible = false;

    if (Options.downscroll) hudTxt.y = 605;
}