#include "script_component.hpp"

GVAR(bankName) = "New World Bank";

["CBA_settingsInitialized", {
    [] call FUNC(loop);
}] call CBA_fnc_addEventHandler;

[QGVAR(registerBankGlobal), FUNC(createBanks)] call CBA_fnc_addEventHandler;
