/* -----------------------------------
Misery Vehicle Mechanic Repair Shop UI List populater
Defines the selected purchase option, and passes current pricing values
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

    private _selected = _list lbCurSel;
    if (_selected == -1) exitWith {}; 

    private _hitpoint = _list lbData _selected;
    private _requiredItem;
    private _hitpointLower = toLower _hitpoint; 

    if (_hitpointLower find 'optic' > -1) then {
        _requiredItem = 'glass';
    };
    if (_hitpointLower find 'track' > -1) then {
        _requiredItem = 'spare_track';
    };

    if (_requiredItem isEqualTo '') exitWith {}; 

    private _player = ...; 
    if (_player canAddItemToUniform _requiredItem) then {
        _vehicle setHitPointDamage [_hitpoint, 0]; 
    } else {
        // The player does not have the required item
        // Show a message or something
    };



