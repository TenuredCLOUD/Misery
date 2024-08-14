
private ["_deadzed"];

_deadzed=false;

private _target = cursortarget;

if ((_target iskindof "zombie") && (damage _target) >= 1) then {

    _deadzed = true;

    if (_deadzed)exitwith{};
};
        _deadzed //return
