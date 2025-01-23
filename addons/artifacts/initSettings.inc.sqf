private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(debug),
    "CHECKBOX",
    ["Enable artifact spawns debugging", "Enable or disable artifact debugging"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(areas),
    "EDITBOX",
    ["Artifact spawn Areas", "ELLIPSE or RECTANGLE marker names covering the artifact spawn areas as strings ['Artifact_spawn_1', 'Artifact_spawn_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
