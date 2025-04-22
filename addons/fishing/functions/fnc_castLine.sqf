#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initiates the fishing cast, checks gear, and starts the fishing loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_castLine
 *
*/

if !([] call FUNC(canFish)) exitWith {
    ctrlSetText [1001, "You need to be near water or on a watercraft to cast!"];
};

if !([] call FUNC(hasGear)) exitWith {
    ctrlSetText [1001, "You need a fishing pole, spool, hook, and bait to cast!"];
};

// Put fishing rod in players hand:
[] call FUNC(actionLogic);

// Hide cast line button & exit button:
{
    findDisplay 982387 displayCtrl _x ctrlShow false;
} forEach [1600, 1602];

// Show progress bars:
{
    findDisplay 982387 displayCtrl _x ctrlShow true;
} forEach [1010, 1011, 1012, 1013];

// Starting values with casted line
GVAR(lineOut) = 0.2;
GVAR(lineTension) = 0;
GVAR(isSnagged) = false;
GVAR(fishOn) = false;
GVAR(fishStrength) = 0;

ctrlSetText [1001, "Line cast!"];

[{
    params ["_args", "_handle"];

    private _display = findDisplay 982387;
    private _lineTensionBar = _display displayCtrl 1011;
    private _lineOutBar = _display displayCtrl 1013;

    if (isNull _display) exitWith {
        [] call FUNC(exit);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if !([] call FUNC(hasGear)) exitWith {
        private _lostFishingGearStr = format ["<t font='PuristaMedium' size='0.7'>You lost some gear! Fishing stopped...</t>"];
        [QEGVAR(common,tileText), _lostFishingGearStr] call CBA_fnc_localEvent;
        [] call FUNC(exit);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if !([] call FUNC(canFish)) exitWith {
        private _noWaterStr = format ["<t font='PuristaMedium' size='0.7'>You moved away from the water! Fishing stopped...</t>"];
        [QEGVAR(common,tileText), _noWaterStr] call CBA_fnc_localEvent;
        [] call FUNC(exit);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _tensionChange = 0;

    switch (true) do {
            case (GVAR(isSnagged)): {
                _tensionChange = _tensionChange + (random [0.05, 0.1, 0.15]);
            };
            case (GVAR(fishOn)): {
                _tensionChange = _tensionChange + (GVAR(fishStrength) * random [0.05, 0.1, 0.2]);
            };
            default {
                _tensionChange = _tensionChange + (random [-0.02, 0, 0.001]);
            };
        };

    GVAR(lineTension) = (GVAR(lineTension) + _tensionChange) max 0 min 1;

    if (GVAR(lineTension) > 0.95) then {
        private _lineSnappedStr = format ["<t font='PuristaMedium' size='0.7'>Something broke or flew off the line!</t>"];
        [QEGVAR(common,tileText), _lineSnappedStr] call CBA_fnc_localEvent;
        private _randomGearLoss = round selectRandom [1, 2, 3];
        switch (true) do {
            case (_randomGearLoss isEqualTo 1): {
                [player, QCLASS(worms)] call CBA_fnc_removeItem;
            };
            case (_randomGearLoss isEqualTo 2): {
                {
                [player, _x] call CBA_fnc_removeItem;
                } forEach [QCLASS(fishhook), QCLASS(worms)];
            };
            case (_randomGearLoss isEqualTo 3): {
                {
                [player, _x] call CBA_fnc_removeItem;
                } forEach [QCLASS(fishingSpool), QCLASS(fishhook), QCLASS(worms)];
            };
        };
        [] call FUNC(exit);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    // Random chance for snag or fish bite
    if (!GVAR(isSnagged) && !GVAR(fishOn)) then {
        private _randomHookEvent = round random 100;
        switch (true) do {
            case (_randomHookEvent < 1): {
                GVAR(isSnagged) = true;
            };
            case (_randomHookEvent > 98): {
                GVAR(fishOn) = true;
                GVAR(fishStrength) = random [0.3, 0.5, 0.7];
            };
        };
    };

    _lineTensionBar progressSetPosition GVAR(lineTension);
    _lineOutBar progressSetPosition GVAR(lineOut);

    private _noteText = "";

    switch (true) do {
            case (GVAR(isSnagged)): {
                _noteText = "The line is snagged. Try pulling the rod or reeling out.";
            };
            case (GVAR(fishOn)): {
                _noteText = "A fish is on! Reel in carefully and pull the rod to tire it.";
            };
            default {
                _noteText = "Waiting for a bite...";
            };
        };

    ctrlSetText [1001, format ["%1", _noteText]];

}, 1, []] call CBA_fnc_addPerFrameHandler;

