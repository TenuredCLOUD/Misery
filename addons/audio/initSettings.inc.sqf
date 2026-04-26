private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

// Enhanced Character Effects
[
    QGVAR(enhancedCharacterEffects),
    "CHECKBOX",
    [LSTRING(EnhancedCharEffects), LSTRING(EnhancedCharEffects_Desc)],
    _category,
    true, 1, {}, true
] call CBA_fnc_addSetting;

// Enhanced Inventory Sounds
[
    QGVAR(enhancedInventorySounds),
    "CHECKBOX",
    [LSTRING(EnhancedInvSounds), LSTRING(EnhancedInvSounds_Desc)],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Ambient Sound Scape
[
    QGVAR(ambientSoundScape),
    "CHECKBOX",
    [LSTRING(AmbientSoundscape), LSTRING(AmbientSoundscape_Desc)],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Forge Ambience
[
    QGVAR(forgeAmbience),
    "CHECKBOX",
    [LSTRING(ForgeAmbience), LSTRING(ForgeAmbience_Desc)],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

// Additional ambient soundscape sounds
[
    QGVAR(ambientSoundScapeExtras),
    "EDITBOX",
    [LSTRING(AmbientSoundscapeArray), LSTRING(AmbientSoundscapeArrayDesc)],
    _category,
    "[]", 1,
    {
        params ["_value"];
        GVAR(ambientSoundScapeExtras) = parseSimpleArray _value;
    }
] call CBA_fnc_addSetting;

// Ambient Music
[
    QGVAR(ambientMusicEnabled),
    "CHECKBOX",
    [LSTRING(AmbientMusic), LSTRING(AmbientMusicDesc)],
    _category,
    false, 1, {}, true
] call CBA_fnc_addSetting;

[
    QGVAR(ambientMusicExtras),
    "EDITBOX",
    [LSTRING(AmbientMusicArray), LSTRING(AmbientMusicArrayDesc)],
    _category,
    "[]", 1,
    {
        params ["_value"];
        GVAR(ambientMusicExtras) = parseSimpleArray _value;
    }
] call CBA_fnc_addSetting;
