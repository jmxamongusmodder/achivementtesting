package editors;

#if desktop
import Discord.DiscordClient;
#end
import animateatlas.AtlasFrameMaker;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.graphics.FlxGraphic;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUITooltip.FlxUITooltipStyle;
import flixel.ui.FlxButton;
import flixel.ui.FlxSpriteButton;
import openfl.net.FileReference;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import haxe.Json;
import Character;
import flixel.system.debug.interaction.tools.Pointer.GraphicCursorCross;
import lime.system.Clipboard;
import flixel.animation.FlxAnimation;

#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

/**
	*DEBUG MODE
 */
class AchivementsEditorState extends MusicBeatState
{
   var StartsUnlocked:Bool = false;
   var CanUnlock:Bool = false;

   var UI_box:FlxUITabMenu;
   var UI_awardsbox:FlxUITabMenu;

   bgLayer = new FlxTypedGroup<FlxSprite>();
   add(bgLayer);
   achLayer = new FlxTypedGroup<Character>();
   add(achLayer);

		var tabs = [
			//{name: 'Offsets', label: 'Offsets'},
			{name: 'Settings', label: 'Editor'},
		];

		UI_box = new FlxUITabMenu(null, tabs, true);

		UI_box.resize(250, 120);
		UI_box.x = FlxG.width - 275;
		UI_box.y = 25;
		UI_box.scrollFactor.set();
		add(UI_box);

		FlxG.mouse.visible = true;
}
