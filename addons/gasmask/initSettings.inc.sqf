private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enhanced),
    "CHECKBOX",
    ["Enhanced gasmasks", "Enable enhanced gasmasks? (Makes all gasmasks vulnerable to cartridge failure, while gasmasks are worn cartridges deplete. If a rebreather is equipped, this isn't active due to using a rebreather for supplied air)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(defaultMask),
    "EDITBOX",
    ["Default swapped mask", "The default mask that is returned when a player uses cartridges on a gasmask without cartridges (use when not using contact DLC gasmasks)"],
    _category,
    "G_AirPurifyingRespirator_01_F",
    1
] call CBA_fnc_addSetting;
