/*
Misery Heliwreck alert startup 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_pos","_marker","_WreckID","_WreckType","_WreckTypeName"];

_pos = parseSimpleArray (_this select 0);
_WreckID = _this select 1;

_markerName = format ["Wreck %1", _WreckID];
_marker = createMarkerLocal [_markerName, _pos];
_marker setMarkerType "HeliWreckMap";
_marker setMarkerColor "ColorWhite"; 
_marker setMarkerSize [1, 1]; 
_marker setMarkerAlpha 0;
_marker setMarkerText "Crash site";

missionNamespace setVariable [format ["Wreck_Marker_%1", _WreckID], _marker];

if ("Misery_ERU" in items player) then {

_marker setMarkerAlpha 1;

playSound3D ["STALKERsounds\sounds\pda\pda_objective.ogg", player, false, getPosASL player, 4, 1, 10];

private _posStr = str _pos;

private _PDA = format ["[EMERGENCY TRANSMISSION]: A crash site has been detected at %1, posing a potential hazard. All survivors are strongly advised to steer clear of the area…", _posStr];

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


