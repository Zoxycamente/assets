function onEvent(e:EventGameEvent){
    if (e.event.name == "Change Scroll Type"){
        if (e.event.params[0] == true) // left scroll
            pinto();
	    if (e.event.params[1] == true) // down scroll
			jeba();
		if (e.event.params[2] == true) // up scroll
            pingola();
		if (e.event.params[3] == true) // right scroll
			bilau();
	    //if (e.event.params[4] == true) // undyne
			//pipi();
	    if (e.event.params[4] == true) // back normal
			piroca();
    }
}

function pinto() { // left scroll
	for(i in 0...4) {
		if (Options.downscroll) {
        FlxTween.tween(playerStrums.members[i], {angle: 90}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 480, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 360, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[2], {y: 200, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 50, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 0}, 0.5, {ease: FlxEase.quartInOut});
		} else {
			FlxTween.tween(playerStrums.members[i], {angle: -90}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 480, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 360, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[2], {y: 200, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 50, x: 300}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 0}, 0.5, {ease: FlxEase.quartInOut});
		}
	}
}

function jeba() { // down scroll
	for(i in 0...4) {
		if (Options.downscroll) {
		FlxTween.tween(playerStrums.members[i], {angle: 0}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 50, x: 680}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 50, x: 800}, 1, {ease: FlxEase.quartInOut});
        FlxTween.tween(playerStrums.members[2], {y: 50, x: 920}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 50, x: 1040}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
		} else {
			FlxTween.tween(playerStrums.members[i], {angle: 180}, 1, {ease: FlxEase.quartInOut});
			FlxTween.tween(playerStrums.members[0], {y: 500, x: 680}, 1, {ease: FlxEase.quartInOut});
		    FlxTween.tween(playerStrums.members[1], {y: 500, x: 800}, 1, {ease: FlxEase.quartInOut});
            FlxTween.tween(playerStrums.members[2], {y: 500, x: 920}, 1, {ease: FlxEase.quartInOut});
		    FlxTween.tween(playerStrums.members[3], {y: 500, x: 1040}, 1, {ease: FlxEase.quartInOut});
			FlxTween.tween(cpuStrums.members[i], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
		}
	}
}

function pingola() { // up scroll scroll
	for(i in 0...4) {
		if (Options.downscroll) {
		FlxTween.tween(playerStrums.members[i], {angle: 180}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 500, x: 680}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 500, x: 800}, 1, {ease: FlxEase.quartInOut});
        FlxTween.tween(playerStrums.members[2], {y: 500, x: 920}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 500, x: 1040}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
		} else {
			FlxTween.tween(playerStrums.members[i], {angle: 0}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 50, x: 680}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 50, x: 800}, 1, {ease: FlxEase.quartInOut});
        FlxTween.tween(playerStrums.members[2], {y: 50, x: 920}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 50, x: 1040}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
		}
	}
}

function bilau() { // right scroll
	for(i in 0...4) {
		if (Options.downscroll) {
        FlxTween.tween(playerStrums.members[i], {angle: -90}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 480, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 360, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[2], {y: 200, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 50, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 0}, 0.5, {ease: FlxEase.quartInOut});

		} else {
			FlxTween.tween(playerStrums.members[i], {angle: 90}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 480, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 360, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[2], {y: 200, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 50, x: 800}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 0}, 0.5, {ease: FlxEase.quartInOut});
		}
	}
}

/*function pipi() { // undyne
	for(i in 0...4) {
		FlxTween.tween(playerStrums.members[i], {y: 317}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 305, x: 478}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 245, x: 586}, 1, {ease: FlxEase.quartInOut});
        FlxTween.tween(playerStrums.members[2], {y: 440, x: 586}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 305, x: 680}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
	}
}*/

function piroca() { // nomral scroll
	for(i in 0...4) {
		if (Options.downscroll) {
		FlxTween.tween(playerStrums.members[i], {angle: 0}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[0], {y: 50, x: 680}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[1], {y: 50, x: 800}, 1, {ease: FlxEase.quartInOut});
        FlxTween.tween(playerStrums.members[2], {y: 50, x: 920}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(playerStrums.members[3], {y: 50, x: 1040}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(cpuStrums.members[i], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
		} else {
			FlxTween.tween(playerStrums.members[i], {angle: 180}, 1, {ease: FlxEase.quartInOut});
			FlxTween.tween(playerStrums.members[0], {y: 500, x: 680}, 1, {ease: FlxEase.quartInOut});
		    FlxTween.tween(playerStrums.members[1], {y: 500, x: 800}, 1, {ease: FlxEase.quartInOut});
            FlxTween.tween(playerStrums.members[2], {y: 500, x: 920}, 1, {ease: FlxEase.quartInOut});
		    FlxTween.tween(playerStrums.members[3], {y: 500, x: 1040}, 1, {ease: FlxEase.quartInOut});
			FlxTween.tween(cpuStrums.members[i], {alpha: 1}, 1, {ease: FlxEase.quartInOut});
		}
	}
}