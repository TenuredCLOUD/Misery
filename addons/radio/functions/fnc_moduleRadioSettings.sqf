#include "..\script_component.hpp"

/*
 * Author: TenuredCLOUD
 * Radio startup
 *
 * Arguments:
 * 0: Module the logic is attached to <OBJECT>
 * 1: Sound sources <ARRAY>
 * 2: Class of radio objects <STRING>
 * 3: Timer loop <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radio_fnc_moduleRadioSettings;
 *
*/

/*
private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if (_activated && isServer) then {
    [
    _module,
    (_module getVariable QCLASS(Radiosoundfilearray"),
    (_module getVariable QCLASS(Radiosoundclassarray"),
    (_module getVariable QCLASS(Radioobjectarray"),
    (_module getVariable QCLASS(Radiosoundmaintimer")
    ] call Radio\Radiobroadcast);
};
true
*/
