/*
Misery Kill handle for persistence
Executes script on local player that is killed
Designed specifically for Misery mod
by TenuredCLOUD
*/

if (isServer) then {

if (isNil {missionNamespace getVariable "ServerKillhandleCustom"}) then {
        missionNamespace setVariable ["ServerKillhandleCustom", true];

addMissionEventHandler ["EntityKilled", {
  params ["_killed", "_killer", "_instigator"];
  if (_killed == player) then {
   if !(MiserysurvivalKillhandleScript=="") then {
            private _killedscript = [_this select 0] execVM MiserysurvivalKillhandleScript;
            if(MiseryDebug)then{systemChat "Killed handle script executed...";};
                };
              };
        }];
    };
};