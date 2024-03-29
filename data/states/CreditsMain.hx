import funkin.backend.system.framerate.Framerate;

function create() {
    FlxTween.tween(Framerate.offset, {x: 2000}, .5, {ease: FlxEase.cubeOut});

    window.title = "Friday Night Funkin': Vs. Hankus | The credits! This is important, so dont ignore it!";
}