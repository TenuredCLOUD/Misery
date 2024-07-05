 /* -----------------------------------
Misery Crafting Framework Listboc index value checker
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

params ["_ctrl", "_str"];
private _count = lbSize _ctrl;
for "_i" from 0 to (_count - 1) do {
if ((lbText [_ctrl, _i]) isEqualTo _str) exitWith {_i};
};
-1