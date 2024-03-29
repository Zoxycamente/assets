override function beatHit(curBeat:Int)
	{
		if (camZoomingInterval < 1) camZoomingInterval = 1;
		if (Options.camZoomOnBeat && camZooming && FlxG.camera.zoom < maxCamZoom && curBeat % camZoomingInterval == 0)
		{
			camHUD.zoom += 0;
		}

		iconP1.scale.set(1, 1);
		iconP2.scale.set(1, 1);

		iconP1.updateHitbox();
		iconP2.updateHitbox();
	}