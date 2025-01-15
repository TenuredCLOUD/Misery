private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Misery Fear framework", "Enable Misery Fear Framework? (Enables Fear / Sanity simulation to the player) *Fear Framework Module is required*"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(healingVal),
    "SLIDER",
    ["Fear reduction", "Fear decrease every cycle *Requires Fear Framework module* (low decimal values recommended, NOT SCALED - Full value input applies)"],
    _category,
    [0.01, 10, 0.05, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ravage),
    "CHECKBOX",
    ["Ravage Zombies", "Enable Fear from Ravage zombies?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ravageVal),
    "SLIDER",
    ["Ravage zombies Fear amount", "Added fear value from zombies (calculates each survival cycle)"],
    _category,
    [1, 500, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(remnant),
    "CHECKBOX",
    ["Remnant Phantoms", "Enable Fear from Remnant mod phantoms?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(remnantVal),
    "SLIDER",
    ["Remnant Phantoms Fear amount", "Added fear value from phantoms (calculates each survival cycle)"],
    _category,
    [1, 500, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dsa),
    "CHECKBOX",
    ["DSA - Drongo's Spooks & Anomalies", "Enable Fear from Spooks?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dsaVal),
    "SLIDER",
    ["DSA Spooks Fear amount", "Added fear value from Spooks (calculates each survival cycle)"],
    _category,
    [1, 500, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(night),
    "CHECKBOX",
    ["Night time", "Enable Fear from Darkness - being outside during night fall? (Changes Fear healing conditions - Must be daylight, or being near a fire, or in a building at night aids sanity / reduces fear)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nightVal),
    "SLIDER",
    ["Night fall Fear amount", "Added fear value from Night time (calculates each survival cycle)"],
    _category,
    [1, 500, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(psy),
    "CHECKBOX",
    ["PsyField", "Enable Fear from Psyfields?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(psyVal),
    "SLIDER",
    ["Psyfield Fear amount", "Added fear value from Psyfield (calculates each survival cycle)"],
    _category,
    [1, 500, 50, 0],
    1
] call CBA_fnc_addSetting;
