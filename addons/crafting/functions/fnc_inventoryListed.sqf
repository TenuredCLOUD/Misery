/*
Misery Crafting Framework List populater
Scans Player's inventory and populates the GUI
Designed specifically for Misery mod
by TenuredCLOUD
*/

/*OBSOLETE*/

// waitUntil {sleep 1; !isNull findDisplay 982376 };

// if (!isNull findDisplay 982376) exitWith { //Double make sure script exits after loot lists are populated

//     private _dialog = findDisplay 982376;
//     private _items = items player;

//     for [{_i = 0}, {_i < 8}, {_i = _i + 1}] do {
//         private _list = _dialog displayCtrl (1500 + _i);
//         lbClear _list;
//         {
//             private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
//             if (_displayName == "") then {
//                 _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
//             };
//             private _index = _list lbAdd _displayName;
//             _list lbSetData [_index, _x];
//         } forEach _items;
//     };

//     private _STRinput = [1400,1401,1402,1403,1404,1405,1406,1407];
//     {
//         ctrlSetText [_x, "0"];
//     } forEach _STRinput;
// };


