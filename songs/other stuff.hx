public var notSL:Bool = true;

function postUpdate(elapsed) {
    if (notSL) {
        /*iconP1.x = 886;
        iconP2.x = 790;
        iconP1.y = iconP2.y = 584;*/
        for (i in playerStrums.members) i.alpha = 0.6; 
        for (i in cpuStrums.members) i.alpha = 0.6;  }
    if (curSong == "sussy-legacy") notSL = false;
}

function onCountdown(event:CountdownEvent) {
    if (FlxG.save.data.middlescroll) {
        if (event.swagCounter == 0) {
	        for (i in playerStrums.members) i.x -= 310;
	        for (i in cpuStrums.members) i.x -= 5000;
    }
}}
