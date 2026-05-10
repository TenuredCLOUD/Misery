#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handle Logic for consuming / using items
 *
 * Arguments:
 * 0: ItemName <CLASSNAME>
 * 1: Category <STRING>
 * 2: Delay <NUMBER>
 * 3: Hunger Value <NUMBER>
 * 4: Thirst Value <NUMBER>
 * 5: Energy Value <NUMBER>
 * 6: Exposure Value <NUMBER>
 * 7: Radiation Value <NUMBER>
 * 8: Infection Value <NUMBER>
 * 9: Parasites Value <NUMBER>
 * 10: Toxicity Value <NUMBER>
 * 11: Psychosis Value <NUMBER>
 * 12: Mask Blocks Use <NUMBER>
 * 13: Can Tools needed <NUMBER>
 * 14: Remove when used <NUMBER>
 * 15: Replacement item <STRING>
 * 16: Audio Feedback <STRING>
 * 17: Text Feedback <STRING>
 * 18: Animation Feedback <STRING>
 * 19: Code to execute <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_interactions_fnc_process;
 *
 * Public: No
*/

params ["_itemName", "_category", "_delay", "_hungerValue", "_thirstValue", "_energyDeficitValue", "_exposureValue", "_radiationValue", "_infectionValue", "_parasitesValue", "_toxicityValue", "_psychosisValue", "_maskBlocksUse", "_requiresCanOpener", "_removeOnUse", "_replacement", "_sound", "_feedback", "_animation", "_code"];

[player] call EFUNC(protection,totalProtection) params ["_gasMask", "_scba"];

if (_maskBlocksUse && {(_gasMask > 0 || _scba > 0)}) exitWith {
    [QEGVAR(common,tileText), ["You cannot use this item with a mask equipped...", 10]] call CBA_fnc_localEvent;
};

if (_requiresCanOpener && {((items player + magazines player) findIf {_x in [MACRO_CANTOOLS]}) isEqualTo -1 && !(currentWeapon player in [MACRO_KNIVES])}) exitWith {
    [QEGVAR(common,tileText), ["You need a can opener or tools to use this...", 10]] call CBA_fnc_localEvent;
};

if (gestureState player in [MACRO_ANIMATION_GESTURES]) exitWith {
    [QEGVAR(common,tileText), ["You are already consuming something else...", 10]] call CBA_fnc_localEvent;
};

if (_removeOnUse) then {
    if ([_itemName, "CfgWeapons"] call EFUNC(common,configCheck)) then {
        [player, _itemName] call CBA_fnc_removeItem;
    } else {
        [_itemName, _replacement] call EFUNC(common,itemDecrement);
    };
};

if (count _feedback >= 2) then {
    private _feedbackTime = _feedback select 1;
    [QEGVAR(common,tileText), [format [_feedback select 0, _feedbackTime]]] call CBA_fnc_localEvent;
};

if (_sound isNotEqualTo "") then {
    playSound3D [_sound, player, false, getPosASL player, 4, 1, 10];
};

if (_animation isNotEqualTo "") then {
    if (isClass (configFile >> "CfgMovesMaleSdr" >> "States" >> _animation)) then {
        player switchMove _animation;
    } else {
        player switchGesture _animation;
    };
};

[{
    params ["_hungerValue", "_thirstValue", "_energyDeficitValue", "_exposureValue", "_radiationValue", "_infectionValue", "_parasitesValue", "_toxicityValue", "_psychosisValue", "_code"];

    if (_hungerValue isNotEqualTo 0) then {
        [_hungerValue, "hunger"] call EFUNC(common,addStatusModifier);
    };
    if (_thirstValue isNotEqualTo 0) then {
        [_thirstValue, "thirst"] call EFUNC(common,addStatusModifier);
    };
    if (_energyDeficitValue isNotEqualTo 0) then {
        [_energyDeficitValue, "energy"] call EFUNC(common,addStatusModifier);
    };
    if (_exposureValue isNotEqualTo 0) then {
        [_exposureValue, "exposure"] call EFUNC(common,addStatusModifier);
    };
    if (_radiationValue isNotEqualTo 0) then {
        [_radiationValue, "radiation"] call EFUNC(common,addStatusModifier);
    };
    if (_infectionValue isNotEqualTo 0) then {
        [_infectionValue, "infection"] call EFUNC(common,addStatusModifier);
    };
    if (_parasitesValue isNotEqualTo 0) then {
        [_parasitesValue, "parasites"] call EFUNC(common,addStatusModifier);
    };
    if (_toxicityValue isNotEqualTo 0) then {
        [_toxicityValue, "toxicity"] call EFUNC(common,addStatusModifier);
    };
    if (_psychosisValue isNotEqualTo 0) then {
        [_psychosisValue, "psychosis"] call EFUNC(common,addStatusModifier);
    };

    if (_code isNotEqualTo "") then {call compile _code};
}, [_hungerValue, _thirstValue, _energyDeficitValue, _exposureValue, _radiationValue, _infectionValue, _parasitesValue, _toxicityValue, _psychosisValue, _code], _delay] call CBA_fnc_waitAndExecute;
