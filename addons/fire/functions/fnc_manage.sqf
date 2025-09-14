#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Manages fire burn time and rain effects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_manage
 */

[{
    private _newActiveFires = [];

    {
        private _fire = _x select 0;
        private _type = _x select 1;
        private _burnTimeLeft = _x select 2;

        if (isNull _fire || !alive _fire) then {
            [QUOTE(COMPONENT_BEAUTIFIED), format ["Removed invalid fire entry at %1 from activeFires.", getPosATL _fire]] call EFUNC(common,debugMessage);
            continue;
        };

        private _rainThreshold = [0.3, 0.7, 0.9] select (["small", "big", "barrel"] find _type);
        private _rainChance = [25, 15, 15] select (["small", "big", "barrel"] find _type);

        switch (true) do {
            case (inflamed _fire && _burnTimeLeft <= 0): {
                _fire inflame false;
                _x set [2, 0];
                _newActiveFires pushBack _x; // Keep for reignition
                [QUOTE(COMPONENT_BEAUTIFIED), format ["%1 fire at %2 extinguished due to no fuel.", _type, getPosATL _fire]] call EFUNC(common,debugMessage);
            };
            case (rain > _rainThreshold && [_rainChance] call EFUNC(common,rollChance) && !([_fire] call FUNC(rainSafe))): {
                _fire inflame false;
                _x set [2, 0];
                _newActiveFires pushBack _x;
                [QUOTE(COMPONENT_BEAUTIFIED), format ["%1 fire at %2 was extinguished from the rain.", _type, getPosATL _fire]] call EFUNC(common,debugMessage);
            };
            case (inflamed _fire): {
                _burnTimeLeft = _burnTimeLeft - 5;
                _x set [2, _burnTimeLeft];
                _newActiveFires pushBack _x;
                [QUOTE(COMPONENT_BEAUTIFIED), format ["%1 fire at %2 is burning, time left: %3(s)", _type, getPosATL _fire, _burnTimeLeft]] call EFUNC(common,debugMessage);
            };
            default {
                _newActiveFires pushBack _x;
            };
        };
    } forEach GVAR(activeFires);

    GVAR(activeFires) = _newActiveFires;
    publicVariable QGVAR(activeFires);
}, 5] call CBA_fnc_addPerFrameHandler;
