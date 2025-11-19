#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI recruit option
 * Adds recruitment hold interaction to spawned units matching players side SP only
 *
 * Arguments:
 * None
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
    private _recruitmentCost = 500 * round(_equipmentMass * 100);
    private _unitIdentity = name _unit;

    [
        _unit,
        format [localize "STR_MISERY_RECRUITUNIT", _unitIdentity, EGVAR(money,symbol), [_recruitmentCost, 1, 2, true] call CBA_fnc_formatNumber],
        "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
        "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
        "_this distance _target < 3",
        "_caller distance _target < 3",
        {},
        {},
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            private _recruitmentCost = _arguments select 0;
            private _unitIdentity = _arguments select 1;
            private _playerMoney = _caller getVariable QCLASS(currency);
            if (_playerMoney >= _recruitmentCost) then {
                [-_recruitmentCost] call EFUNC(currency,modifyMoney);
                [_target] joinSilent _caller;
                [_target,_actionId] call BIS_fnc_holdActionRemove;
                [QEGVAR(common,tileText), format [localize "STR_MISERY_RECRUITUNIT_SUCCESS", _unitIdentity, EGVAR(money,symbol), [_recruitmentCost, 1, 2, true] call CBA_fnc_formatNumber]] call CBA_fnc_localEvent;
            } else {
                [QEGVAR(common,tileText), format [localize "STR_MISERY_RECRUITUNIT_FAIL",_unitIdentity]] call CBA_fnc_localEvent;
            };
        },
        {},
        [_recruitmentCost, _unitIdentity],
        0.1,
        nil,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
};
