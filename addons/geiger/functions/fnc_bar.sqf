#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Geiger UI (readings)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_geigerBar
 *
*/

disableSerialization;

[{QCLASS(geiger_On) in magazines player},
{
    [{
        params ["_args", "_handle"];
        if (!(QCLASS(geiger_On) in magazines player) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            ("MiseryGeiger_UI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
            [] call FUNC(bar);
        };

        "MiseryGeiger_UI" cutRsc ["MiseryGeiger_UI","PLAIN",1,false];

        private _display = uiNamespace getVariable "MiseryGeiger_UI";
        private _textControl = _display displayCtrl 1000;
        private _radReading = format ["%1 mSv", round (player getVariable [QEGVAR(survival,radiation),0])];
        _textControl ctrlSetText _radReading;

        private _randomGeiger = selectRandom [QPATHTOEF(audio,sounds\inventory\Items\Geiger001.ogg),
        QPATHTOEF(audio,sounds\inventory\Items\Geiger002.ogg),
        QPATHTOEF(audio,sounds\inventory\Items\Geiger006.ogg),
        QPATHTOEF(audio,sounds\inventory\Items\Geiger007.ogg),
        QPATHTOEF(audio,sounds\inventory\Items\Geiger008.ogg)
        ];

        if (!isNil "MiseryinRadZone" && MiseryinRadZone) then {
        playSound3D [_randomGeiger, player, false, getPosASL player, 5, 1, 10];
        };

    }, 0.25, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
