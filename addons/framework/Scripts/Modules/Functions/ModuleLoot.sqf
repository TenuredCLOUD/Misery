/*
Misery Loot framework startup
Code concepts from Drongo edited by TenuredCLOUD
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if(_activated)then{
[
(_module getVariable "MiseryBaseWeapons"),
(_module getVariable "MiseryBISmedical"),
(_module getVariable "MiseryBISweapons"),
(_module getVariable "MiseryBISitems"),
(_module getVariable "MiseryBISuniforms"),
(_module getVariable "MiseryBISvests"),
(_module getVariable "MiseryBISheadgear"),
(_module getVariable "MiseryBISgoggles"),
(_module getVariable "MiseryBISpacks"),
(_module getVariable "MiseryFood"),
(_module getVariable "MiseryMedical"),
(_module getVariable "MiseryItems"),
(_module getVariable "MiseryChanceHouse"),
(_module getVariable "MiseryChanceFood"),
(_module getVariable "MiseryChanceMedical"),
(_module getVariable "MiseryChanceMisc"),
(_module getVariable "MiseryChanceWeapon"),
(_module getVariable "MiseryChanceAttachment"),
(_module getVariable "MiseryChanceMagazine"),
(_module getVariable "MiseryChanceUniform"),
(_module getVariable "MiseryChanceVest"),
(_module getVariable "MiseryChanceHeadgear"),
(_module getVariable "MiseryChancePack"),
(_module getVariable "MiseryChanceGoggle"),
(_module getVariable "MiseryChanceMagazineRandom"),
(_module getVariable "MiseryChanceGrenade"),
(_module getVariable "MiseryChanceExplosive"),
(_module getVariable "MiseryChanceHouseM"),
(_module getVariable "MiseryChanceFoodM"),
(_module getVariable "MiseryChanceMedicalM"),
(_module getVariable "MiseryChanceMiscM"),
(_module getVariable "MiseryChanceWeaponM"),
(_module getVariable "MiseryChanceAttachmentM"),
(_module getVariable "MiseryChanceMagazineM"),
(_module getVariable "MiseryChanceUniformM"),
(_module getVariable "MiseryChanceVestM"),
(_module getVariable "MiseryChanceHeadgearM"),
(_module getVariable "MiseryChancePackM"),
(_module getVariable "MiseryChanceGoggleM"),
(_module getVariable "MiseryChanceMagazineRandomM"),
(_module getVariable "MiseryChanceGrenadeM"),
(_module getVariable "MiseryChanceExplosiveM"),
(_module getVariable "MiseryCustomArrays"),
(_module getVariable "MiseryLootItemsFood"),
(_module getVariable "MiseryLootItemsFoodM"),
(_module getVariable "MiseryLootItemsMedical"),
(_module getVariable "MiseryLootItemsMedicalM"),
(_module getVariable "MiseryLootItemsMisc"),
(_module getVariable "MiseryLootItemsMiscM"),
(_module getVariable "MiseryLootWeapons"),
(_module getVariable "MiseryLootWeaponsM"),
(_module getVariable "MiseryLootWeaponattachments"),
(_module getVariable "MiseryLootWeaponattachmentsM"),
(_module getVariable "MiseryLootUniforms"),
(_module getVariable "MiseryLootUniformsM"),
(_module getVariable "MiseryLootVests"),
(_module getVariable "MiseryLootVestsM"),
(_module getVariable "MiseryLootHeadgear"),
(_module getVariable "MiseryLootHeadgearM"),
(_module getVariable "MiseryLootPacks"),
(_module getVariable "MiseryLootPacksM"),
(_module getVariable "MiseryLootGoggles"),
(_module getVariable "MiseryLootGogglesM"),
(_module getVariable "MiseryLootGrenades"),
(_module getVariable "MiseryLootExplosives"),
(_module getVariable "MiseryLootItemsBlacklist"),
(_module getVariable "MiseryLootBldgBlacklist"),
(_module getVariable "MiseryLoottimer"),
(_module getVariable "MiseryLootrefreshtimer"),
(_module getVariable "MiseryLootspawnDist"),
(_module getVariable "MiseryLootDeleteDist")
] execVM "\z\misery\addons\framework\scripts\Modules\Loot\Start.sqf";
};
TRUE