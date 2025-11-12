#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cleans radio object array and scrubs "dead sound sources" when a source is removed from the tracker
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radio_fnc_cleamData;
 *
*/

[{
    params ["_args", "_handle"];

    if (GVAR(allRadios) isEqualTo []) exitWith {};

    private _index = GVAR(allRadios) findIf { _x isEqualTo objNull };

    if (_index isNotEqualTo -1) then {

        GVAR(allRadios) deleteAt _index;

        private _soundSource = GVAR(allRadioSounds) select _index;

        GVAR(allRadioSounds) deleteAt _index;

        deleteVehicle _soundSource;

        publicVariable QGVAR(allRadios);
        publicVariable QGVAR(allRadioSounds);
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;
