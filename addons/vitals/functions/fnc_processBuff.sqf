#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Buff Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_vitals_fnc_processBuff;
 *
*/

params ["_control", "_selectedIndex"];
private _selectedAilmentinlist = _control lbData _selectedIndex;
private _selectedAilment = [];
private _playerBuffs = player getVariable "buffs";

{
    if (_x select 0 isEqualTo _selectedAilmentinlist) then {
        _selectedAilment = _x;
    };
} forEach _playerBuffs;

if (count _selectedAilment > 0) then {
    _namedata = _selectedAilment select 0;
    _descriptiondata = _selectedAilment select 2;

    [parseText format ["<t font='PuristaMedium' size='1'>%1</t><br/><t font='PuristaMedium' size='0.8'>%2</t>", _namedata, _descriptiondata], true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
};








