#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * treatment UI List populater
 * Defines the selected purchase option, and passes current pricing values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_treatment_fnc_treatListed;
 *
 * Public: No
*/

waitUntil {!isNull findDisplay 982381};

if (!isNull findDisplay 982381) exitWith {
    private _list = findDisplay 982381 displayCtrl 1500;
    private _TreatmentList = ["Treat Wounds","Treat Radiation (25%)","Treat Radiation (50%)","Treat Radiation (75%)","Treat Radiation (ALL)"];

    lbClear _list;

    {
        private _price = 0;
        switch (_x) do {
            case "Treat Wounds": {
                _price = Mis_Medpriceheal;
            };
            case "Treat Radiation (25%)": {
                _price = parseNumber (((((player getVariable ["radiation",0]) * 0.25) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
            case "Treat Radiation (50%)": {
                _price = parseNumber (((((player getVariable ["radiation",0]) * 0.5) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
            case "Treat Radiation (75%)": {
                _price = parseNumber (((((player getVariable ["radiation",0]) * 0.75) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
            case "Treat Radiation (ALL)": {
                _price = parseNumber ((((player getVariable ["radiation",0]) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
        };
        private _index = _list lbAdd format ["%1 (%2)", _x, _price];
    //    _list lbSetData [_index, str(_price)];  // Associate price with the item
    } forEach _TreatmentList;
};


