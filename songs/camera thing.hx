if (!FlxG.save.data.camMove) disableScript();

var cammove = 24; // how much the camera will move
var angleMoveSpeed = 0.09; // the speed of the camera rotating
var angleVar = 1; // how much it will rotate

function postUpdate() {
    if (notSL) {
    switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT": 
            camFollow.x -= cammove;
            camGame.angle = (lerp(camGame.angle, -angleVar, angleMoveSpeed));
        case "singDOWN": 
            camFollow.y += cammove;
            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
        case "singUP": 
            camFollow.y -= cammove;
            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
        case "singRIGHT": 
            camFollow.x += cammove;
            camGame.angle = (lerp(camGame.angle, angleVar, angleMoveSpeed));
        case "idle", "hey":
            camGame.angle = (lerp(camGame.angle, 0, angleMoveSpeed));
            } if (dad.curCharacter == "legacy") { 
                notSL = false; 
        }
    }
}