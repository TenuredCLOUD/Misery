#include "script_component.hpp"

if !(isServer) exitWith {};

//If GRAD persistence is active, push Remnant ODRA object holders to blacklister, so they won't save / reload (This will execute only once)
if (!isNil QGRADGVAR(persistence,blacklist)) then {
    private _RemnantODRA = [
        "Sign_Sphere10cm_F",
        "Land_HandyCam_F",
        "Reflector_Cone_01_narrow_blue_F",
        "Reflector_Cone_01_narrow_red_F",
        "Reflector_Cone_01_wide_blue_F",
        "Reflector_Cone_01_wide_orange_F",
        "odra_l_alert",
        "odra_lamp_p",
        "odra_l_idle",
        "odra"
    ];
    {
        [_x] call GRADFUNC(persistence,blacklistClasses);
    } forEach _RemnantODRA;
};

if (GVAR(enabled)) then {
    call FUNC(drops)
};
