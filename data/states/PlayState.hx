function beatHit(curBeat:Int)
	{
		if (camZoomingInterval < 1) camZoomingInterval = 1;
		if (Options.camZoomOnBeat && camZooming && FlxG.camera.zoom < maxCamZoom && curBeat % camZoomingInterval == 0)
		{
			camHUD.zoom += 0;
		}
	}