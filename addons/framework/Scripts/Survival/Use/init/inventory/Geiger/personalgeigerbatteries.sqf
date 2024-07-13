/*
Misery Geiger battery adder
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if ("Misery_lithiumbattery" in items player) then {

player removeitem "Misery_personalgeigernobattery";

titleText ["You add a Lithium battery to your Geiger", "PLAIN DOWN"];

player removeitem "Misery_lithiumbattery";

player additem "Misery_personalgeiger";

playSound3D ["\z\misery\addons\framework\audio\sounds\Geigerenable\GeigerON.ogg", player, false, getPosASL player, 4, 1, 10];

//If bootup successful:
//Ravage geiger var:
if (isNil {player getVariable "GeigerON"}) then {
player setVariable ["GeigerON", true];
};

} else {

titleText ["You don't have any lithium batteries...", "PLAIN DOWN"];

};
