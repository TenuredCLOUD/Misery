#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Defines what inventory items do
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_useItem
 *
*/

private ["_selectedItem","_debuffs","_entry","_MHunger","_MThirst","_ailments","_MExposure","_hunger","_thirst","_debuffAdd","_debuffRemove","_script","_replaceWith","_playaudio","_checkforGmask","_checkforCopener","_waittill","_radsremoved","_radsadd","_feverremoved","_coldremoved"];

_selectedItem = (toUpper _this);
_debuffs = [] + GVAR(itemEffects);
_entry = [];

{
if (_selectedItem isEqualTo (toUpper(_x select 0))) exitWith {_entry=_x};
}forEach _debuffs;

if ((count _entry)<1) exitWith {};

_MHunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
_MThirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
_MExposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
_ailments = player getVariable QCLASS(ailments);
_rads = player getVariable ["radiation", 0];
_hunger=_entry select 1;
_thirst=_entry select 2;
_debuffAdd=_entry select 3;
_debuffRemove=_entry select 4;
_script=_entry select 5;
_replaceWith="";

if ((count _entry)>6) then {_replaceWith=_entry select 6};

_playaudio=_entry select 7;
_checkforGmask= _entry select 8;
_checkforCopener= _entry select 9;
_waittill= _entry select 10;
_radval= _entry select 11;
_exposureval= _entry select 12;

//Gasmask check for items, check RVG goggle array
    // if (_checkforGmask && {((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0)}) exitWith { //Needs to be tweaked to filter through protective masks etc...
    // titleText ["You cannot eat or drink while wearing a mask...", "PLAIN DOWN"]
    // };

//Can opener / tool check for RVG canned foods:
//Default RVG mod checker for can opener / tools edited for WBK knife melee weapons:
private _WBKKnives = ["Weap_melee_knife", "Knife_kukri","Knife_m3","UNSC_Knife","UNSC_Knife_reversed","WBK_survival_weapon_4","WBK_survival_weapon_4_r","WBK_survival_weapon_3","WBK_survival_weapon_3_r"];

if (_checkforCopener && {!("rvg_canOpener" in magazines player) && !("rvg_toolkit" in magazines player) && !("rvg_guttingKnife" in magazines player) && {!(MiseryWBKIMS && {currentWeapon player in _WBKKnives})}}) exitWith {
    titleText ["You need a can opener or tools to open this.", "PLAIN DOWN"];
};

    //Item replacer
    if (_replaceWith isNotEqualTo "KEEP") then {
    player removeItem _selectedItem;
    if (_replaceWith isNotEqualTo "") then {
        player addItem _replaceWith
    };
};

//Audio
if (_playaudio isNotEqualTo "") then {player say3D [_playaudio,10,1,2,0];}; //[sound, maxDistance, pitch, isSpeech, offset]

//Waittimer
if (_waittill isNotEqualTo 0) then {sleep _waittill}; //delayed effect (good for medication simulation)

//Radiation
if (_radval isNotEqualTo 0) then {player setVariable ["radiation", (_rads + _radval)]};

//Exposure
if (_exposureval isNotEqualTo 0) then {player setVariable [QCLASS(exposure), (_MExposure + _exposureval)];};

//Hunger / Thirst
if (_hunger isNotEqualTo 0) then {player setVariable [QEGVAR(survival,hunger), (_MHunger + _hunger)];};
if (_thirst isNotEqualTo 0) then {player setVariable [QEGVAR(survival,thirst), (_MThirst + _thirst)];};

//Reset to 0 if less than 0:
if (_MHunger < 0) then {player setVariable [QEGVAR(survival,hunger), 0]};
if (_MThirst < 0) then {player setVariable [QEGVAR(survival,thirst), 0]};

//Reset to 100 if greater than 100:
if (_MHunger > 100) then {player setVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH]};
if (_MThirst > 100) then {player setVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH]};

//Ailment add
if ((count _debuffAdd) > 0) then {
    {
    _ailments pushBackUnique (toUpper _x);
    player setVariable [QCLASS(ailments), _ailments];
    }forEach _debuffAdd;
};

//Ailment remove
if ((count _debuffRemove) > 0) then {
    {
    _ailments deleteAt (_ailments find (toUpper _x));
    player setVariable [QCLASS(ailments), _ailments];
    }forEach _debuffRemove;
};

//Custom script execution
if (_script isNotEqualTo "") then {
    selectedItem call _script
};
