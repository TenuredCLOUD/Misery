// #include "\z\misery\addons\main\script_macros.hpp"

// /*
// Misery Radio startup
// Designed specifically for Misery mod 
// by TenuredCLOUD 
// */

// private["_module","_units","_activated"];
// _module=_this select 0;
// _units = _this select 1;
// _activated=_this select 2;
// waitUntil{sleep 1; !isNil "MiseryReady"};

// if (_activated && isServer) then {
// [
// _module,
// (_module getVariable "Misery_Radiosoundfilearray"),
// (_module getVariable "Misery_Radiosoundclassarray"),
// (_module getVariable "Misery_Radioobjectarray"),
// (_module getVariable "Misery_Radiosoundmaintimer")
// ] execVM Radio\Radiobroadcast);
// };
// TRUE