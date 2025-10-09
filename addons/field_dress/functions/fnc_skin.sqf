#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Animal skinning
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_field_dress_fnc_skin;
 *
*/

[player, [MACRO_FIELDDRESS_ANIMALTYPES], 2] call EFUNC(common,nearCorpse) params ["_isNear", "_animal"];

private _audioSource = playSound selectRandom [MACRO_FIELDDRESS_SKINSOUNDS];

if (_animal getVariable [QGVAR(processingSkin), false]) exitWith {
    [QEGVAR(common,tileText), "This animal is being processed already..."] call CBA_fnc_localEvent;
};

if (isNil {_animal getVariable QGVAR(processingSkin)}) then {
    _animal setVariable [QGVAR(processingSkin), true, true];
};

switch (true) do {
    case (_animal isKindOf "Sheep_random_F"): {
        GVAR(meatCount) = 4;
    };
    case (_animal isKindOf "Goat_random_F"): {
        GVAR(meatCount) = 4;
    };
    case (_animal isKindOf "Cock_random_F"): {
        GVAR(meatCount) = 1;
    };
    case (_animal isKindOf "Hen_random_F"): {
        GVAR(meatCount) = 1;
    };
    case (_animal isKindOf "Rabbit_F"): {
        GVAR(meatCount) = 1;
    };
    default {
        GVAR(meatCount) = 1;
    };
};

player playAction "Gear";

["You start to field dress the animal...",
15,
{_isNear},
{
    params ["_args"];
    _args params ["_animal", "_audioSource"];

    player playAction "";

    if !(isNull _audioSource) then {
        deleteVehicle _audioSource;
    };

    for "_i" from 1 to (GVAR(meatCount) + round(random 1)) do {
        [player, QCLASS(rawMeat), true] call CBA_fnc_addItem;
    };

    [_animal] call EFUNC(ballistics,destroy);

    [QEGVAR(common,tileText), "You got some raw meat..."] call CBA_fnc_localEvent;
},
{
    params ["_args"];
    _args params ["_animal", "_audioSource"];

    player playAction "";

    if !(isNull _audioSource) then {
        deleteVehicle _audioSource;
    };

    [QEGVAR(common,tileText), "You stop field dressing the animal..."] call CBA_fnc_localEvent;

    // Reset processing
    _animal setVariable [QGVAR(fieldDressing), nil, true];
},
[_animal, _audioSource],
true,
true,
true
] call CBA_fnc_progressBar;

