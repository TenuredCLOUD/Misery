/* -----------------------------------
Misery Value to Bar conversion 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

    params ["_value"];
    private _bar = "";
    private _length = round(_value / 5);
    for "_i" from 1 to _length do {
        _bar = _bar + "-";
    };
    _bar

