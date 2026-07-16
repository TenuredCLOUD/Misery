#include "script_component.hpp"


if (isServer) then {
    call FUNC(inArea);
    call FUNC(updateDetector);
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    [QGVAR(chemicalAreaEvent), FUNC(process)] call CBA_fnc_addEventHandler;

    call FUNC(gas);
    call FUNC(detectorAlert);
    call FUNC(managePower);

    private _chemicalDetectorBatteries = [
        QGVAR(chemicalDetector_menu),
        localize LSTRING(AddBatteries),
        QPATHTOEF(icons,data\battery_charging_ca.paa),
        {
            call FUNC(batteries);
        },
        {
            [["ChemicalDetector_01_black_F"]] call EFUNC(common,hasItem) && ([QCLASS(9vBattery)] call EFUNC(common,countItem) > 1)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _chemicalDetectorBatteries] call ACEFUNC(interact_menu,addActionToObject);
}] call CBA_fnc_addEventHandler;



