#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(inArea);
        call FUNC(updateDetector);
        [
            "chemicalDetector_menu",
            "Add 9v batteries to chemical detector",
            {
                [["ChemicalDetector_01_black_F"]] call EFUNC(common,hasItem) && ([QCLASS(9vBattery)] call EFUNC(common,countItem) > 1)
            },
            {
                [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
                call FUNC(batteries);
            },
            "",
            QPATHTOEF(icons,data\battery_charging_ca.paa),
            ""
        ] call EFUNC(actions,addAction);
    };

    if (hasInterface) then {
        [QGVAR(chemicalAreaEvent), FUNC(process)] call CBA_fnc_addEventHandler;
        call FUNC(gas);
        call FUNC(detectorAlert);
        call FUNC(managePower);
    };

}] call CBA_fnc_addEventHandler;
