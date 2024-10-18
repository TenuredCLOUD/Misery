#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Resupply Vehicle Shop UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_vehiclerearm_fnc_rearmListed;
 *
 * Public: No
*/

waitUntil {!isNull findDisplay 982383};

if (!isNull findDisplay 982383) exitWith {

    private ["_list","_PurchaseB","_Vehiclename","_resupplyPrice","_formattedPrice","_Found","_index"];

    _list = findDisplay 982383 displayCtrl 1500;
    _PurchaseB = findDisplay 982383 displayCtrl 1600;

    if (MiseryTarget_VehName isEqualTo "") exitWith {
        _PurchaseB ctrlShow false;
    };

    _Vehiclename = getText (configFile >> "CfgVehicles" >> MiseryTarget_VehName >> "displayName");

    lbClear _list;

    if (isNil "_Vehiclename") exitWith {};

    _resupplyPrice = 0;
    _Found = false;

    {
        if ((_x select 0) == MiseryTarget_VehName) then {
            _Array=_x;
            _Found = true;
            _resupplyPrice = _x select 4;
        };
    } forEach Misery_Veh_Type;

    if !(_Found) exitWith {};

    _formattedPrice = _resupplyPrice;
    if (!isNil "Misery_dyneconomy_display" && {Misery_dyneconomy_display}) then {
        _formattedPrice = format ["%1 %2", HALs_store_currencySymbol, _resupplyPrice];
    };

    if (_resupplyPrice == -1) then {
    _index = _list lbAdd "This vehicle cannot be resupplied...";
    _PurchaseB ctrlShow false;
} else {
    _index = _list lbAdd format ["Resupply (%1)", _formattedPrice];
};
};





