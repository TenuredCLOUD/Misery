#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Enables players to craft fires - Also checks environment
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_lightFire
 *
*/

/*
Again, with the fire crafting Will most likely rewrite to new UI based framework
*/

if (!hasInterface) exitWith {};

//Force close inv:
(findDisplay 602) closeDisplay 2;

//In vehicle:
if !(isNull objectParent player) exitWith {titleText ["You cannot build a fire while inside a vehicle...", "PLAIN DOWN"];};

//Inside:
if (insideBuilding player == 1) exitWith {titleText ["You cannot build a fire inside, it's too dangerous...", "PLAIN DOWN"];};

//No firewood or sticks:
if (!("Misery_firewood" in items player) && !("Misery_woodensticks" in items player)) exitWith {titleText ["You need firewood or sticks...", "PLAIN DOWN"];};

//Exit from not enough mats:
if !("Misery_tinder" in items player || "acex_intelitems_notepad" in magazines player || "rvg_money" in magazines player || "rvg_notepad" in magazines player || "rvg_docFolder" in magazines player) exitWith {titleText ["You don't have the required materials to craft a fire...", "PLAIN DOWN"];};

[
    player,
    "Craft Fire",
    QPATHTOEF(icons,data\firecraft_ca.paa),
    QPATHTOEF(icons,data\firecraft_ca.paa),
    "'Misery_firewood' in items player || 'Misery_woodensticks' in items player",
    "'Misery_lighter' in items player || 'rvg_matches' in magazines player",
    {
  //Sound generation:
  if ("Misery_lighter" in items player) then {
  playSound3D ["\z\misery\addons\audio\sounds\immersion\Lighter.ogg", player, false, getPosASL player, 4, 1, 10];
  }else{
  if ("rvg_matches" in magazines player) then {
  playSound3D ["\z\misery\addons\audio\sounds\immersion\Match.ogg", player, false, getPosASL player, 4, 1, 10];
  };
  };

    //Starting variables:
    (_this select 1) setVariable ["MiseryCanCraftFire", true];

    player playAction "Gear";
    },
    {
    private _actionID = (_this select 2);
    private _random = [1, 10] call BIS_fnc_randomInt; //RNG for success rates
    private _rainlevel = rain;

    //Raining too hard: (Chances fire extinguishing if player isn't under an awning or "roof like" structure for rain coverage)
    if (_rainlevel > 0.3 && !(([player] call Misery_fnc_Isinside) select 0)) then {
  private _rainkillfire = [1, 50] call BIS_fnc_randomInt;
  if (_rainkillfire > 25) exitWith {
    _random = 0; //Set RNG to 0 avoiding 10 and pushing for a failure since rain extinguished flame
        };
    };

    if ((((_this select 1) getVariable "MiseryCanCraftFire") isEqualTo true) && "Misery_firewood" in items player) then {
    titleText ["Crafting fire with firewood...", "PLAIN DOWN"];
    }else{
    if ((((_this select 1) getVariable "MiseryCanCraftFire") isEqualTo true) && "Misery_woodensticks" in items player) then {
    titleText ["Crafting fire with wooden sticks...", "PLAIN DOWN"];
    };
    };

    if (_random == 10) exitWith {
    titleText ["You successfully crafted a fire...", "PLAIN DOWN"];
    (_this select 1) setVariable ["MiseryCanCraftFire", false];

    if ("Misery_firewood" in items player) then {
        player removeItem "Misery_firewood";
        call EFUNC(fire,CampfireBig);
    }else{
    if ("Misery_woodensticks" in items player) then {
        player removeItem "Misery_woodensticks";
        call EFUNC(fire,Campfiresmall);
    };
};
    [player,_actionID] call BIS_fnc_holdActionRemove;
};
    },
    {
//On completion / Fire failure
titleText ["You failed to craft a fire...", "PLAIN DOWN"];
(_this select 1) setVariable ["MiseryCanCraftFire", false];
private _items = ["Misery_tinder"];
private _mags = ["acex_intelitems_notepad","rvg_money", "rvg_notepad", "rvg_docFolder"];

private _index = _items findIf { _x in items player };
if (_index != -1) then {
    private _item = _items select _index;
    player removeItem _item;
} else {
    _index = _mags findIf { _x in magazines player };
    if (_index != -1) then {
        private _mag = _mags select _index;
        player removeMagazine _mag;
    };
};

    if ("Misery_lighter" in items player) then {
        // If lighter is available, do not consume a match
    }else{
    if ("rvg_matches" in magazines player) then {

    };
  };
  private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    },
    {
//On complete / On interruption
(_this select 1) setVariable ["MiseryCanCraftFire", false];
private _items = ["Misery_tinder"];
private _mags = ["acex_intelitems_notepad","rvg_money", "rvg_notepad", "rvg_docFolder"];

private _index = _items findIf { _x in items player };
if (_index != -1) then {
    private _item = _items select _index;
    player removeItem _item;
} else {
    _index = _mags findIf { _x in magazines player };
    if (_index != -1) then {
        private _mag = _mags select _index;
        player removeMagazine _mag;
    };
};

    if ("Misery_lighter" in items player) then {
        // If lighter is available, do not consume a match
    }else{
    if ("rvg_matches" in magazines player) then {

    };
  };
    private _actionID = (_this select 2);
    [player,_actionID] call BIS_fnc_holdActionRemove;
    },
    [],
    10,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
