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
import flash.net.FileFilter;
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
import flixel.addons.ui.FlxButtonPlus;
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
   public var description:Alphabet;*/
   public var image:AttachedSprite;
   var imageInputText:FlxUIInputText;

   var buttonsArray:Array<FlxButton> = [];
// var awardFile:WeekFile = null;

// var buttonToggle:FlxButton;

	var _file:FileReference = null;
	function saveAward() {
		var data:String = Json.stringify("awardtesting");
		if (data.length > 0)
		{
			_file = new FileReference();
			_file.save(data, "testachivement" + ".json");
		}
	}
	function addUI() {
		var reloadImage:FlxButton = new FlxButton(imageInputText.x + 210, imageInputText.y - 3, "Reload Image", function()
		{
		        imageInputText = new FlxUIInputText(15, 30, 200, 'customawardimgs/fullcombo', 8);
//			imageFile = imageInputText.text;
		});
         }

   override function create() {
		var tipText:FlxText = new FlxText(0, 540, FlxG.width,
			"Left - Mute Music
			\nSpace - Save Json", 16);
		tipText.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, CENTER);
		tipText.scrollFactor.set();
		tipText.screenCenter();
		add(tipText);
                FlxG.mouse.visible = true;
                addUI();
 }
}
