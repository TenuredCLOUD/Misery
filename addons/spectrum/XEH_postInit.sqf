#include "script_component.hpp"

["CBA_settingsInitialized", {

    [QGVAR(setSpectrumValues), {
        params ["_frequency", "_strength"];
        [_frequency, _strength] call FUNC(updateReadings);
    }] call CBA_fnc_addEventHandler;

    if (isServer) then {
        call FUNC(updateDetector);
        [
            "chemicalDetector_menu",
            "Add lithium batteries to spectrum device",
            {
                [["hgun_esd_01_dummy_F"]] call EFUNC(common,hasItem) && ([QCLASS(lithiumBattery)] call EFUNC(common,countItem) > 1)
            },
            {
                [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
                call FUNC(batteries);
            },
            "",
            "",
            ""
        ] call EFUNC(actions,addAction);
    };

    if (hasInterface) then {
        call FUNC(detectorAudio);
        call FUNC(entityDetection);
        call FUNC(managePower);
    };

    // Set Spectrum device frequency allowance to 1MHz - 1GHz:
    missionNamespace setVariable ["#EM_FMin", 1];
    missionNamespace setVariable ["#EM_FMax", 1000];

    // Set Spectrum device sensitivity to 1MHz - 1Ghz:
    missionNamespace setVariable ["#EM_SMin", 1];
    missionNamespace setVariable ["#EM_SMax", 1000];
}] call CBA_fnc_addEventHandler;
