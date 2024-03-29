function update() window.title = "Friday Night Funkin': Vs. Hankus";

function new() {
if (FlxG.save.data.camMove == null) camMove == true;
if (FlxG.save.data.timebar == null) timebar == true;
if (FlxG.save.data.iconBop == null) iconBop == true;
}

function update(elapsed) {
    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();
}

var redirectStates:Map<FlxState, String> = [
    MainMenuState => "SussyMainMenuState",
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys()) 
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) 
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}