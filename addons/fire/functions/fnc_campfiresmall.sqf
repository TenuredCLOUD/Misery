#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Generates Small campfire variant
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_campfiresmall
 *
*/

/*
Will most likely rewrite to new UI based use
*/

private _pos = player getRelPos [1.5, 0];
private _object = createVehicle ["FirePlace_burning_F", _pos, [], 0, "CAN_COLLIDE"];
_pos = [_pos select 0, _pos select 1, ((getPosATL player) select 2) + 1];
_object setPos _pos;
_pos = (_object call EFUNC(common,surfacePos)) select 0;
_object setPosASL _pos;
_object setDir (getDir player);

//Track fire fuel source
_object setVariable ["Mis_Woodstickfuel", 100, true];

//Fire flame timer start: (kills fire after 45 minutes)
[_object] spawn {
    params ["_object"];
    while {inflamed _object && _object getVariable "Mis_Woodstickfuel" > 0} do {
        sleep 27;
        _object setVariable ["Mis_Woodstickfuel", (_object getVariable "Mis_Woodstickfuel") - 1, true];
        //Rain exposure to fireplace, extinguish if conditions are met:
        if (rain > 0.3 && random 1 < 0.25 && !(_object call Misery_fnc_FireRainSafe)) then {
        _object inflame false;
        if (EGVAR(common,debug)) then {systemChat format["Small fire at %1 was extinguished from the rain...",getPosATL _object];};
        };
        if (EGVAR(common,debug)) then {systemChat format["Small fire at %1 is burning, current fuel: %2",getPosATL _object, (_object getVariable "Mis_Woodstickfuel")];};
    };
    _object inflame false;
};

[
    _object,
    "Reignite Fire",
    QPATHTOEF(icons,data\harvestwoodfuel_ca.paa),
    QPATHTOEF(icons,data\harvestwoodfuel_ca.paa),
    "_this distance _target < 2.5 && !(inflamed _target) && ('Misery_lighter' in items player || 'rvg_matches' in magazines player)",
    "_caller distance _target < 2.5 && !(inflamed _target) && ('Misery_tinder' in items player || 'rvg_money' in magazines player || 'rvg_notepad' in magazines player || 'rvg_docFolder' in magazines player)",
    {
    //Starting variables:
    (_this select 1) setVariable ["MiseryCanRIFire", true];

    //Upgrade Fire if player has Firewood:
    if ((((_this select 0) getVariable ["Mis_Woodstickfuel", 100]) <= 0) && (QCLASS(firewood) in items player)) then {
    (_this select 0) setVariable ["Mis_FireUpgrade", true, true];
    };

    //Check if fire needs more wood:
    if ((((_this select 0) getVariable ["Mis_Woodstickfuel", 100]) <= 0) && !(QCLASS(woodensticks) in items player || QCLASS(firewood) in items player)) exitWith {titleText ["This fire needs more wood...", "PLAIN DOWN"];};

    //Exit from not enough mats:
    if !(QCLASS(tinder) in items player || "acex_intelitems_notepad" in magazines player || "rvg_money" in magazines player || "rvg_notepad" in magazines player || "rvg_docFolder" in magazines player) exitWith {titleText ["You don't have the required materials to craft a fire...", "PLAIN DOWN"];};

    if !(QCLASS(lighter) in magazines player || "rvg_matches" in magazines player) exitWith {titleText ["You need a lighter or matches to reignite this fire...", "PLAIN DOWN"];};

  //Sound generation:
  if (QCLASS(lighter) in magazines player) then {
  playSound3D [QPATHTOEF(audio,sounds\immersion\Lighter.ogg), player, false, getPosASL player, 4, 1, 10];
  } else {
  if ("rvg_matches" in magazines player) then {
  playSound3D [QPATHTOEF(audio,sounds\immersion\Match.ogg), player, false, getPosASL player, 4, 1, 10];
  };
  };

    player playAction "Gear";
    },
    {
    private _random = [1, 10] call BIS_fnc_randomInt; //RNG for success rates
    private _rainlevel = rain;

    //Raining too hard: (Chances fire extinguishing if player isn't under an awning or "roof like" structure for rain coverage)
    if (_rainlevel > 0.3 && !(([player] call Misery_fnc_Isinside) select 0)) then {
  private _rainkillfire = [1, 50] call BIS_fnc_randomInt;
  if (_rainkillfire > 25) exitWith {
    _random = 0; //Set RNG to 0 avoiding 10 and pushing for a failure since rain extinguished flame
    };
};
    if (((_this select 1) getVariable "MiseryCanRIFire") isEqualTo true) then {
    titleText ["Attempting to reignite unlit fire...", "PLAIN DOWN"];
    };

    if (_random isEqualTo 10) exitWith {
    //If fire upgrade is needed, upgrade fire type:
    if (((_this select 0) getVariable "Mis_FireUpgrade") isEqualTo true) exitWith {
    deleteVehicle (_this select 0); //delete old small fire
    //remove Firewood & upgrade fire:
    if (QCLASS(firewood) in items player) then {
        player removeItem QCLASS(firewood);
        call EFUNC(fire,CampfireBig);
        };
    };
    // reignite fire
    (_this select 0) inflame true;
    titleText ["You successfully reignited the fire...", "PLAIN DOWN"];
    (_this select 1) setVariable ["MiseryCanRIFire", false];

    //Reset flame timer variable if needed: (+ remove wood used) // If no wood sticks used Fire fuel will not reset
    if ((((_this select 0) getVariable ["Mis_Woodstickfuel", 100]) <= 0) && (QCLASS(woodensticks) in items player)) then {
    (_this select 0) setVariable ["Mis_Woodstickfuel", 100, true];
    player removeItem QCLASS(woodensticks);
    };

    //Check if fuel variable was never reset: (someone attempted fuel exploit):
    if (((_this select 0) getVariable ["Mis_Woodstickfuel", 100]) <= 0) exitWith {
    (_this select 0) inflame false;
    titleText ["You didn't add any wood fuel...", "PLAIN DOWN"];
    };

    //Fire flame timer start: (kills fire after 45 minutes)
    [_this select 0] spawn {
    while {inflamed (_this select 0) && (_this select 0) getVariable "Mis_Woodstickfuel" > 0} do {
        sleep 27;
        (_this select 0) setVariable ["Mis_Woodstickfuel", ((_this select 0) getVariable "Mis_Woodstickfuel") - 1, true];
        //Rain exposure to fireplace, extinguish if conditions are met:
        if (rain > 0.3 && random 1 < 0.25 && !((_this select 0) call Misery_fnc_FireRainSafe)) then {
        (_this select 0) inflame false;
        if (EGVAR(common,debug)) then {systemChat format["Small fire at %1 was extinguished from the rain...",getPosATL (_this select 0)];};
        };
        if (EGVAR(common,debug)) then {systemChat format["Small fire at %1 is burning, current fuel: %2",getPosATL (_this select 0), ((_this select 0) getVariable "Mis_Woodstickfuel")];};
    };
    (_this select 0) inflame false;
    };

    };
    },
    {
    //On failure of reignition:
titleText ["You failed to reignite the fire...", "PLAIN DOWN"];
(_this select 1) setVariable ["MiseryCanRIFire", false];
private _items = [QCLASS(tinder)];
private _mags = ["acex_intelitems_notepad","rvg_money", "rvg_notepad", "rvg_docFolder"];

private _index = _items findIf { _x in items player };
if (_index isNotEqualTo -1) then {
    private _item = _items select _index;
    player removeItem _item;
} else {
    _index = _mags findIf { _x in magazines player };
    if (_index isNotEqualTo -1) then {
        private _mag = _mags select _index;
        player removeMagazine _mag;
    };
};

    if (QCLASS(lighter) in magazines player) then {
        // If lighter is available, do not consume a match
    } else {
        // Need Misery matches code
  };
    },
    {
    //On interrupt / Success
(_this select 1) setVariable ["MiseryCanRIFire", false];
private _items = [QCLASS(tinder)];
private _mags = ["acex_intelitems_notepad","rvg_money", "rvg_notepad", "rvg_docFolder"];

private _index = _items findIf { _x in items player };
if (_index isNotEqualTo -1) then {
    private _item = _items select _index;
    player removeItem _item;
} else {
    _index = _mags findIf { _x in magazines player };
    if (_index isNotEqualTo -1) then {
        private _mag = _mags select _index;
        player removeMagazine _mag;
    };
};

    if (QCLASS(lighter) in magazines player) then {
        // If lighter is available, do not consume a match
    } else {
     //need Misery matches code
  };
    },
    [],
    10,
    nil,
    false, //keep action active but hidden until fire is no longer lit
    false
] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];
