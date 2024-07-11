/*
Misery Radio Objects static loop (immersion)
Runs strictly on Server for GLOBAL effect
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

while {true} do {

{
if (typeOf _x in RadioObjectArray) then { 
[_x,["StaticRADIO"]] remoteExec ["say3D", 2]; 
}; 
} forEach allMissionObjects "All"; 

sleep 59;
};





	