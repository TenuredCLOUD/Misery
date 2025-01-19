#include "script_component.hpp"

// Keybind is bound to "K"
["Misery", QGVAR(power), "Toggle Geiger", {
        call FUNC(keybind);
}, {}, [37, [false, false, false]]] call CBA_fnc_addKeybind;
