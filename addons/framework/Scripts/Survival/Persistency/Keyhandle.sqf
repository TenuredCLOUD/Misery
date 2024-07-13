/*
Misery Keyhandler for persistence
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if !(hasInterface) exitWith {};

#include "\a3\ui_f\hpp\definedikcodes.inc"

[] spawn {
    waitUntil {sleep 1; !isNull(findDisplay 46)};
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
		
		if (_key isEqualTo DIK_ESCAPE) then {
			if !(MiserySurvivalKeyhandleScript=="") then {
			private _scriptDone = [player] execVM MiserySurvivalKeyhandleScript;
			};

			if (MiseryCombatlog > 0) then {
			execVM "Misery\Scripts\Survival\Persistency\Combatlogg.sqf";
			};

			if(MiseryDebug)then{systemChat "ESC pressed";};
		};
		
		if (_key isEqualTo DIK_F4 && _alt) then {
		if!(MiserySurvivalKeyhandleScript=="")then{
		private _scriptDone = [player] execVM MiserySurvivalKeyhandleScript;
		};

		if (MiseryCombatlog > 0) then {
			execVM "Misery\Scripts\Survival\Persistency\Combatlogg.sqf";
			};

		if(MiseryDebug)then{systemChat "ALT + F4 pressed";};

		};

		if (_ctrl && _alt && _key isEqualto DIK_DELETE) then {

		if!(MiserySurvivalKeyhandleScript=="")then{
		private _scriptDone = [player] execVM MiserySurvivalKeyhandleScript;
		};

		if (MiseryCombatlog > 0) then {
			execVM "Misery\Scripts\Survival\Persistency\Combatlogg.sqf";
			};
			
		if(MiseryDebug)then{systemChat "CTRL + ALT + DEL pressed";};
        	};
    }];
};
