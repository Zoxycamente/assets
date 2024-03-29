function onEvent(e) {
	if (e.event.name == "Tween Zoom") {
        FlxTween.tween(FlxG.camera, {zoom: e.event.params[0]},  e.event.params[1]);
    }
}