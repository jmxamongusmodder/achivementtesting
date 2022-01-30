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
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUITooltip.FlxUITooltipStyle;
import flixel.ui.FlxSpriteButton;
import openfl.net.FileReference;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import haxe.Json;
import flixel.system.debug.interaction.tools.Pointer.GraphicCursorCross;
import lime.system.Clipboard;
import flixel.animation.FlxAnimation;
import flixel.FlxBasic;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flash.text.TextField;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class AchivementsEditorState extends MusicBeatState
{
   var StartsUnlocked:Bool = false;
   var CanUnlock:Bool = false;
   var UnlockByWeek:Bool = false;
   var UnlockBySong:Bool = false;
   var IsThisAnError:Bool = false;
   var needaReset = false;
/* public var alphabet:Alphabet;
   public var description:Alphabet;
   public var image:AttachedSprite;*/

   var buttonsArray:Array<FlxButton> = [];

   var buttonToggle:FlxButton;

   var startX:Int = 1120;

		buttonToggle = new FlxButton(startX, 0, "Save", function()
		{
                   saveAward();
		});
		buttonToggle.setGraphicSize(50, 50);
		buttonToggle.updateHitbox();
		add(buttonToggle);

	var _file:FileReference = null;
	function saveAward() {
		var data:String = Json.stringify("amongusaward");
		if (data.length > 0)
		{
			_file = new FileReference();
			_file.addEventListener(Event.COMPLETE, onSaveComplete);
			_file.addEventListener(Event.CANCEL, onSaveCancel);
			_file.addEventListener(IOErrorEvent.IO_ERROR, onSaveError);
			_file.save(data, "testweek" + ".json");
		}
	}

   override function create() {
		var tipText:FlxText = new FlxText(0, 540, FlxG.width,
			"Theres no tips yet!", 16);
		tipText.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, CENTER);
		tipText.scrollFactor.set();
		tipText.screenCenter();
		add(tipText);
                FlxG.mouse.visible = true;
 }
}
