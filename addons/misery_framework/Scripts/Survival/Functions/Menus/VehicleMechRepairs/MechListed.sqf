/*
Misery Mechanic Shop UI List populater
Defines the selected purchase option, and passes current pricing values
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {!isNull findDisplay 982382};

if (!isNull findDisplay 982382) exitWith { 

    private ["_list","_PurchaseB","_Vehiclename","_repairPrice","_Found","_index"];
    
    _list = findDisplay 982382 displayCtrl 1500; 
    _PurchaseB = findDisplay 982382 displayCtrl 1600;

    if (MiseryTarget_VehName isEqualTo "") exitWith {
        _PurchaseB ctrlShow false;
    };

    _Vehiclename = getText (configFile >> "CfgVehicles" >> MiseryTarget_VehName >> "displayName");

    lbClear _list;

    if (isNil "_Vehiclename") exitWith {};

    _repairPrice = 0;
    _Found = false; 

    {
        if ((_x select 0) == MiseryTarget_VehName) then {
            _Array=_x;
            _Found = true;
            _repairPrice = _x select 3; 
        };
    } forEach Misery_Veh_Type;

    if !(_Found) exitWith {};

    if (!isNil "Misery_dyneconomy_display" && {Misery_dyneconomy_display}) then {
        _repairPrice = format ["%1 %2", HALs_store_currencySymbol, _repairPrice];
    };

    _index = _list lbAdd format ["Repair (%1)", _repairPrice]; 
};



