#include "script_component.hpp"

["CBA_loadingScreenDone", {

    [QGVAR(setSpectrumValues), {
        params ["_frequency", "_strength"];
        [_frequency, _strength] call FUNC(updateReadings);
    }] call CBA_fnc_addEventHandler;

    if (isServer) then {
        call FUNC(updateDetector);
    };

    if (hasInterface) then {
        call FUNC(detectorAudio);
        call FUNC(entityDetection);
        call FUNC(managePower);

        private _spectrumBatteries = [
            QGVAR(spectrumDetector_menu),
            localize LSTRING(Action),
            QPATHTOEF(icons,data\battery_charging_ca.paa),
            {
                call FUNC(batteries);
            },
            {
                [["hgun_esd_01_dummy_F"]] call EFUNC(common,hasItem) && ([QCLASS(lithiumBattery)] call EFUNC(common,countItem) > 1)
            }
        ] call ACEFUNC(interact_menu,createAction);

        [player, 1, [QUOTE(ACE_SelfActions)], _spectrumBatteries] call ACEFUNC(interact_menu,addActionToObject);
    };

    // Set Spectrum device frequency allowance to 1MHz - 1GHz:
    missionNamespace setVariable ["#EM_FMin", 1];
    missionNamespace setVariable ["#EM_FMax", 1000];

    // Set Spectrum device sensitivity to 1MHz - 1Ghz:
    missionNamespace setVariable ["#EM_SMin", 1];
    missionNamespace setVariable ["#EM_SMax", 1000];
}] call CBA_fnc_addEventHandler;
