/*
Misery Radio startup
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if (_activated && isServer) then {
[
_module,
(_module getVariable"Misery_Radiosoundfilearray"),
(_module getVariable"Misery_Radiosoundclassarray"),
(_module getVariable"Misery_Radioobjectarray"),
(_module getVariable"Misery_Radiosoundmaintimer")
] execVM MIS_FILESYS(Survival\Radio\Radiobroadcast);
};
TRUE