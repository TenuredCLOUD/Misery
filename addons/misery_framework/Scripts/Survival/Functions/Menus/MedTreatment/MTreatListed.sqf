/* -----------------------------------
Misery MedTreatment UI List populater
Defines the selected purchase option, and passes current pricing values
Designed specifically for Misery mod 
by TenuredCLOUD 
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
                _price = parseNumber (((((player getvariable ["radiation",0]) * 0.25) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
            case "Treat Radiation (50%)": {
                _price = parseNumber (((((player getvariable ["radiation",0]) * 0.5) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
            case "Treat Radiation (75%)": {
                _price = parseNumber (((((player getvariable ["radiation",0]) * 0.75) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
            case "Treat Radiation (ALL)": {
                _price = parseNumber ((((player getvariable ["radiation",0]) / 50) * Mis_Medpriceradheal) toFixed 1);
            };
        };
        if (!isNil "Misery_dyneconomy_display" && {Misery_dyneconomy_display}) then {
            _price = format ["%1 %2", HALs_store_currencySymbol, _price];
        };
        private _index = _list lbAdd format ["%1 (%2)", _x, _price]; 
    //    _list lbSetData [_index, str(_price)];  // Associate price with the item
    } forEach _TreatmentList; 
};


