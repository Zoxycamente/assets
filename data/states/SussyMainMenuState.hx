import funkin.menus.MainMenuState;
import funkin.backend.scripting.events.MenuChangeEvent;
import funkin.backend.scripting.events.NameEvent;
import funkin.backend.scripting.EventManager;
import funkin.menus.credits.CreditsMain;
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import flixel.math.FlxPoint;
import flixel.effects.FlxFlicker;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.CoolUtil;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.system.framerate.Framerate;

var optionShit:Array<String> = ["Play", "Options", "Credits", "Gallery"];
var curSelected:Int = 0;
var menuItems:FlxTypedGroup<FlxSprite>;
var menuItems = new FlxTypedGroup();

public var canAccessDebugMenus:Bool = true;

FlxG.mouseControls = true;
FlxG.mouse.enabled = true;
FlxG.mouse.visible = true;

function create() {
    CoolUtil.playMenuSong();
    FlxTween.tween(Framerate.offset, {x: 0}, .5, {ease: FlxEase.cubeOut});
    window.title = "Friday Night Funkin': Vs. Hankus | Just the main menu, what do you expect?";

    bg = new FlxBackdrop(Paths.image("menus/mainmenu/nevada"));
    bg.velocity.set(-50, 0);
    bg.antialiasing = true;
    add(bg);

    fundao = new FlxSprite(-80, -80).loadGraphic(Paths.image('menus/mainmenu/bg'));
    fundao.antialiasing = true;
    fundao.scrollFactor.set();
    add(fundao);

    janela = new FlxSprite(480, 56).loadGraphic(Paths.image('menus/mainmenu/janela'));
    janela.antialiasing = true;
    janela.scrollFactor.set();
    add(janela);

    behind = new FlxSprite(22, 187).loadGraphic(Paths.image('menus/mainmenu/behind'));
    behind.antialiasing = true;
    behind.scrollFactor.set();
    add(behind);

    hankusLogo = new FlxSprite(22, 60).loadGraphic(Paths.image('menus/mainmenu/hankus'));
    hankusLogo.scrollFactor.set();
    hankusLogo.antialiasing = true;
    hankusLogo.scale.set(0.8, 0.8);
    add(hankusLogo);

    add(menuItems);
    for (i in 0...optionShit.length) {
        var menuItem = new FlxSprite(50, 220 + (i * 120));
        menuItem.frames = Paths.getFrames('menus/mainmenu/buttons_assets');
        menuItem.animation.addByPrefix("idle", optionShit[i] + " normal", 24, false);
        menuItem.animation.addByPrefix("selected", optionShit[i] + " press", 24, false);
        menuItem.animation.play("idle");
        menuItem.ID = i;
        menuItems.add(menuItem);
        menuItem.scrollFactor.set();
        menuItem.antialiasing = true;
        menuItem.updateHitbox();
    }
   
    changeItem();
}

var selectedSomethin:Bool = false;

function update(elapsed:Float) {
    if (FlxG.mouse.justPressed) {
        if (FlxG.mouse.overlaps(hankusLogo)) {
            PlayState.loadSong("hanksus", "hard");
                    FlxG.switchState(new PlayState()); }}

    FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, (FlxG.mouse.screenX-(FlxG.width/2)) * 0.015, (1/30)*240*elapsed);
	FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, (FlxG.mouse.screenY-6-(FlxG.height/2)) * 0.015, (1/30)*240*elapsed);

    if (FlxG.sound.music.volume < 0.8) FlxG.sound.music.volume += 0.5 * elapsed;

    if (!selectedSomethin) {
        if (canAccessDebugMenus) {
            if (FlxG.keys.justPressed.SEVEN) {
                persistentUpdate = false;
                persistentDraw = true; 
                openSubState(new EditorPicker());
            }
        }
        if (controls.SWITCHMOD) {
            openSubState(new ModSwitchMenu());
            persistentUpdate = false;
            persistentDraw = true;
        }
    }

	if (!selectedSomethin) {
		for (i in menuItems.members) {
			if (FlxG.mouse.overlaps(i)) {
				curSelected = menuItems.members.indexOf(i);
				changeItem();

                if (FlxG.mouse.justPressed) selectItem();
			}
		}
    }
}

function selectItem() {
    selectedSomethin = true;

	FlxG.sound.play(Paths.sound('menu/confirm'));

    FlxFlicker.flicker(menuItems.members[curSelected], 1, Options.flashingMenu ? 0.06 : 0.15, false, false, function(flick:FlxFlicker)
    {
        var daChoice:String = optionShit[curSelected];

        var event = event("onSelectItem", EventManager.get(NameEvent).recycle(daChoice));
        if (event.cancelled) return;
        switch (daChoice)
        {
            case 'Play': FlxG.switchState(new FreeplayState()); //freePLAY lol yeah im  funn
            case 'Options': FlxG.switchState(new OptionsMenu());
            case 'Credits': FlxG.switchState(new CreditsMain());
            case 'Gallery': FlxG.switchState(new ModState('GalleryState')); 
        }
    });
}

function changeItem(huh:Int = 0) {
    var event = event("onChangeItem", EventManager.get(MenuChangeEvent).recycle(curSelected, FlxMath.wrap(curSelected + huh, 0, menuItems.length-1), huh, huh != 0));
    if (event.cancelled) return;

    curSelected = event.value;

    menuItems.forEach(function(spr:FlxSprite) { spr.animation.play('idle');
        
    if (spr.ID == curSelected) { spr.animation.play('selected'); }

    spr.updateHitbox();
    spr.centerOffsets();
    });
}