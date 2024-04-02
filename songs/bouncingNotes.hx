// real codes lmao
// also use direction to do it since noteData is broken, FUCK!
function onPlayerHit(e) {
    if (notSL) {
    if (e.isSustainNote) return;
        playerStrums.members[e.direction].y = 50 + -22;
        FlxTween.tween(playerStrums.members[e.direction], {y: 50}, 0.125, {ease: FlxEase.sineInOut});
    } if (boyfriend.curCharacter == "bf-shading") { 
        notSL = false; 
    }
}

function onDadHit(e) {
    if (notSL) {
    if (e.isSustainNote) return;
        cpuStrums.members[e.direction].y = 50 + -22;
        FlxTween.tween(cpuStrums.members[e.direction], {y: 50}, 0.125, {ease: FlxEase.sineInOut});
    } if (dad.curCharacter == "legacy") { 
        notSL = false; 
    }
}