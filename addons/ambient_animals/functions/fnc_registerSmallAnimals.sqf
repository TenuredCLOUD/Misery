#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Adds eventhandlers to small animals for unsafe ammo
 * Uses standard kinetic energy calculation (with static ammo data, energy data isn't 100% accurate)
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_animals_fnc_registerSmallAnimals;
 *
*/

{
    [_x, "init", {
        params ["_object"];

        _object addEventHandler ["HandleDamage", {

            params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitPartIndex", "_instigator", "_hitPoint", "_directHit"];

            if (!_directHit || {isNull _instigator} || {!alive _unit}) exitWith {};

            [_projectile] call ACEFUNC(advanced_ballistics,readAmmoDataFromConfig) params [
            "_airFriction",
            "_caliber",
            "_bulletLength",
            "_bulletMass",
            "_transonicStabilityCoef",
            "_dragModel",
            "_ballisticCoefficients",
            "_velocityBoundaries",
            "_atmosphereModel",
            "_ammoTempMuzzleVelocityShifts",
            "_muzzleVelocityTable",
            "_barrelLengthTable",
            "_muzzleVelocityVariationSD"];

            private _massKg = _bulletMass / 1000;

            private _energy = 0.5 * _massKg * ((_muzzleVelocityTable select 0) ^ 2);

            private _unsafeAmmo = [false, true] select (_energy > 250);

            // Vaporize animal or simply kill it (some smaller rounds don't kill with one shot)
            if (_unsafeAmmo) then {
                [_unit] call EFUNC(common,bloodPool);
            } else {
                _unit setDamage 1;
            };
        }];

        if (isClass (configFile >> "CfgPatches" >> "WBK_MeleeMechanics")) then {
            [_object, "WBK_IMS_Hit", {
                params ["_unit","_damage","_enemy"];

                if (currentWeapon _enemy isNotEqualTo "") exitWith {
                    if (!isNull _unit) then {
                        [_unit] call EFUNC(common,bloodPool);
                    };
                };

                _unit setDamage 1;
            }] call BIS_fnc_addScriptedEventHandler;
        };
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [MACRO_FIELDDRESS_SMALLANIMALTYPES];
