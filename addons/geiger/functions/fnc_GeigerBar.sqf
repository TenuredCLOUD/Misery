/*
Geiger UI
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

disableSerialization;

[{"Misery_personalgeiger" in magazines player},
{
	[{
		params ["_args", "_handle"];
		if (!("Misery_personalgeiger" in magazines player) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			("MiseryGeiger_UI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
			[] execVM "\z\misery\addons\geiger\funcitons\fnc_GeigerBar.sqf";
		};

		"MiseryGeiger_UI" cutRsc ["MiseryGeiger_UI","PLAIN",1,false];

		private _display = uiNamespace getVariable "MiseryGeiger_UI";
		private _textControl = _display displayCtrl 1000;
		private _radReading = format ["%1 mSv", round (player getVariable ["MiseryRadiation",0])];
		_textControl ctrlSetText _radReading;

		private _randomGeiger = selectRandom ["\z\misery\addons\audio\sounds\inventory\Items\Geiger001.ogg",
		"\z\misery\addons\audio\sounds\inventory\Items\Geiger002.ogg",
		"\z\misery\addons\audio\sounds\inventory\Items\Geiger006.ogg",
		"\z\misery\addons\audio\sounds\inventory\Items\Geiger007.ogg",
		"\z\misery\addons\audio\sounds\inventory\Items\Geiger008.ogg"
		];

		if (!isNil "MiseryinRadZone" && MiseryinRadZone == true) then {
		playSound3D [_randomGeiger, player, false, getPosASL player, 5, 1, 10];
		};

	}, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;