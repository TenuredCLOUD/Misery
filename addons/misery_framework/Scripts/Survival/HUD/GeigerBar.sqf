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
			[] execVM "Misery\Scripts\Survival\HUD\GeigerBar.sqf";
		};

		"MiseryGeiger_UI" cutRsc ["MiseryGeiger_UI","PLAIN",1,false];

		private _display = uiNamespace getVariable "MiseryGeiger_UI";
		private _textControl = _display displayCtrl 1000;
		private _radReading = format ["%1 mSv", round (player getVariable ["radiation",0])];
		_textControl ctrlSetText _radReading;

	}, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
