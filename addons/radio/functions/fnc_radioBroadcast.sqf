#include "..\script_component.hpp"
/*
    Misery Radio audio looper / Broadcaster
    Synces to all players that possess a radio (NOT JIP COMPAT)
    Runs strictly on Server for GLOBAL effect
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

/*
private["_module","_SoundfileArray","_SoundClassArray","RadioObjectArray","_timeafter","_TimeA","_timeafter2","_TimeB"];

_module = _this select 0;

_SoundfileArray = (_this select 1) call EFUNC(common,parseArray);
_SoundClassArray = (_this select 2) call EFUNC(common,parseArray);
RadioObjectArray = (_this select 3) call EFUNC(common,parseArray);
MiseryRadioTimer = _this select 4;

MiseryRadioBroadcastsystem = true; //Sync bootup

[] call Radio\RadioObjectsStatic); //Immersive static loop

while {true} do {

if(MiseryDebug)then{systemChat "Misery Radio Broadcast starting..."};

//sync indexed classname of sound + filepathing:
_index = floor (random (count _SoundfileArray)); get a random index
_soundFile = _SoundfileArray select _index; select a sound file
_soundClass = _SoundClassArray select _index; select a sound class

//Brodcast sound synchronizer:
//Portable radios:
MiseryRadioBroadcast = _soundClass;
publicVariable "MiseryRadioBroadcast";
//Radio objects:
MiseryRadioObjectBroadcast = _soundFile;
publicVariable "MiseryRadioObjectBroadcast";
if(MiseryDebug)then{systemChat "Misery Radio Broadcasting to clients..."};

Gather all radio objects
_RadioSources = [];
{
    if (typeOf _x in RadioObjectArray) then {
        _RadioSources pushBackUnique _x;
    };
} forEach allMissionObjects "ALL";

Radio object looper:
{
    _object = _x;
    playSound3D [MiseryRadioObjectBroadcast, _object, false, getPosASL _object, 1, 1, 100];
} forEach _RadioSources;

if(MiseryDebug)then{systemChat "Misery Radio Broadcasting to Radio objects..."};

//Unsync sound played until next radio broadcast:
_timeafter = time + 0.5;
[_timeafter] spawn {

_TimeA=_this select 0;
waitUntil {(time > _TimeA)};

//Reset audio:
MiseryRadioBroadcast = "";
publicVariable "MiseryRadioBroadcast";

MiseryRadioObjectBroadcast = "";
publicVariable "MiseryRadioObjectBroadcast";

if(MiseryDebug)then{systemChat "Misery Radio Broadcast ended..."};
};

sleep MiseryRadioTimer;
};
*/
