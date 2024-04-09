public var angel = new CustomShader("angel");

function postCreate() {
    angel.data.pixel.value = [0.1, 0.1];
    angel.data.stronk.value = [0.1, 0.1];
    camGame.addShader(angel);
    camHUD.addShader(angel);
}

function update(elapsed:Float) {
    if (angel != null) {
        angel.data.stronk.value[0] = FlxMath.lerp(angel.data.stronk.value[0], 0, FlxMath.bound(elapsed * 2, 0, 1));
        angel.data.pixel.value[0] = FlxMath.lerp(angel.data.pixel.value[0], 1, FlxMath.bound(elapsed * 5, 0, 1));
        angel.data.iTime.value = [Conductor.songPosition / 1000];
    }
}

function onDadHit() angel.data.stronk.value[0] = 0.05;