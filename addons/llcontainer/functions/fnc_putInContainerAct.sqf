/*
Misery Artifact storage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (alive player) then {
    private _artifact = "";
    private _artifacts = [
        "Misery_artifact01",
        "Misery_artifact02",
        "Misery_artifact03",
        "Misery_artifact04",
        "Misery_artifact05",
        "Misery_artifact06",
        "Misery_artifact07",
        "Misery_artifact08",
        "Misery_artifact09",
        "Misery_artifact10"
    ];

    {
        if (_x in items player && "Misery_leadcontaineropen" in items player) exitWith {
            _artifact = _x;
        };
    } forEach _artifacts;

    if (_artifact != "") then {
        player removeItem _artifact; 
        player removeItem "Misery_leadcontaineropen";
        player addItem "Misery_leadcontainerclosed";
        titleText ["You put the artifact in your lead lined container", "PLAIN DOWN"];
    };
};

