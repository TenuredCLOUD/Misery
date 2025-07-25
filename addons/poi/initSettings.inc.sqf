private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(spawnCheckDistance),
    "SLIDER",
    ["Spawn check distance", "Distance to check for POI's to be able to spawn"],
    _category,
    [250, 15000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deleteCheckDistance),
    "SLIDER",
    ["Deletion check distance", "Distance to check for POI's being out of this range for deletion"],
    _category,
    [250, 15000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnRandomDistance),
    "SLIDER",
    ["Random spawn distance", "Distance to spawn randomly generated POI's with no set spawn position"],
    _category,
    [250, 15000, 250, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(checkInterval),
    "SLIDER",
    ["Generating check interval", "Interval at which the system runs it's checks"],
    _category,
    [1, 3600, 60, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(checkIntervalShore),
    "SLIDER",
    ["Shoreline check interval", "Interval at which the system runs it's checks for shoreline POI's"],
    _category,
    [1, 3600, 60, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxActive),
    "SLIDER",
    ["Maximum allowed", "Maximum POI's allowed to be active on the map at any given time"],
    _category,
    [1, 15, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(wrecksSmoke),
    "CHECKBOX",
    ["Wrecks smoke", "Wrecks in POI's will smoke, making them more easier to spot from greater distances"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
