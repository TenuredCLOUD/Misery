#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI recruit option
 * Adds recruitment interaction to spawned units matching players side SP only
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_addRecruitOption;
 *
 * Public: No
*/

params ["_unit"];

if (side _unit isEqualTo side player) then {
    private _equipmentMass = loadAbs _unit / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
    private _recruitmentCost = 500 * round (_equipmentMass * 100);
    private _unitIdentity = name _unit;

    private _recruitAction = [
        QGVAR(recruit_menu),
        format [localize LSTRING(RecruitUnit), _unitIdentity, EGVAR(currency,symbol), [_recruitmentCost, 1, 2, true] call CBA_fnc_formatNumber],
        QPATHTOEF(markers,data\hand_coins_ca.paa),
        {
            params ["_target", "_player", "_params"];
            _params params ["_recruitmentCost", "_unitIdentity"];
            call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];
            if (_funds >= _recruitmentCost) then {
                [-_recruitmentCost] call EFUNC(currency,modifyMoney);
                [_target] joinSilent _player;
                [QEGVAR(common,tileText), format [localize LSTRING(RecruitUnit_Success), name _target, EGVAR(currency,symbol), [_recruitmentCost, 1, 2, true] call CBA_fnc_formatNumber]] call CBA_fnc_localEvent;
            } else {
                [QEGVAR(common,tileText), format [localize LSTRING(RecruitUnit_Fail), name _target]] call CBA_fnc_localEvent;
            };
        },
        {
            params ["_target", "_player"];
            alive _target && (group _target isNotEqualTo group _player);
        },
        {},
        [_recruitmentCost, _unitIdentity],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    [_unit, 0, [QUOTE(ACE_MainActions)], _recruitAction] call ACEFUNC(interact_menu,addActionToObject);
};
