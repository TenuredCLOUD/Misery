/*
Misery PMC Raid alert startup & Raid identifier
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_pos","_marker","_raidID"];

_pos = parseSimpleArray (_this select 0);
_raidID = _this select 1;

_markerName = format ["PMC Raid %1", _raidID];
_marker = createMarkerLocal [_markerName, _pos];
_marker setMarkerType "Military";
_marker setMarkerColor "ColorRed"; 
_marker setMarkerSize [0.5, 0.5]; 
_marker setMarkerAlpha 0;
_marker setMarkerText "PMC Raid";

missionNamespace setVariable [format ["PMC_Raid_Marker_%1", _raidID], _marker];

if ("Misery_PDA" in items player) then {

_marker setMarkerAlpha 1;

playSound3D ["STALKERsounds\sounds\pda\pda_objective.ogg", player, false, getPosASL player, 4, 1, 10];

private _posStr = str _pos;

private _PDA = format ["[PRIORITY BROADCAST]: PMC Personnel have set up camp at %1, active survivors are advised to avoid the area...", _posStr];

private _PDAimage = format ["<img shadow='0.1' size='1.5' image='%1'/>", "\assets\data\PDA.paa"];

hintSilent parseText format ["
<t size='1.15' align='center'> [PDA] %2</t><br/><br/>
<t>%1</t><br/>
<br/>
%2
",
_PDA,
_PDAimage
];
sleep 10;
hintSilent ""; 
};


