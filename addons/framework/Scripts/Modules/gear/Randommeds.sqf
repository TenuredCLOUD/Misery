/*
Misery Random medication function (adds random meds to units)
Code concepts from Haleks equipment func 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _module = _this select 0;
private _units= _this select 1;

private _input1 =_module getvariable "Misery_Randmed";
private _input2 =_module getvariable "Misery_RandmedACE";
private _randomized =_module getvariable "Misery_Randmedrandom";

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

private _randommed = [
"Misery_antibiotic",
"Misery_antibioticpill",
"Misery_antiparasitic",
"Misery_antiparasiticpill",
"Misery_Clozapinebox",
"Misery_ClozapinePill",
"Misery_caffetin",
"Misery_caffetincaps",
"Misery_caffeine",
"Misery_pain",
"Misery_painpill",
"Misery_cocaine",
"Misery_Thrombomodulin",
"Misery_ThrombomodulinStimpack",
"Misery_Cenestin",
"Misery_Cenestinbottle",
"Misery_randommedication"
];

private _randomACE = [
"ACE_fieldDressing",
"ACE_packingBandage",
"ACE_elasticBandage",
"ACE_tourniquet",
"ACE_splint",
"ACE_morphine",
"ACE_adenosine",
"ACE_epinephrine",
"ACE_plasmaIV",
"ACE_plasmaIV_500",
"ACE_plasmaIV_250",
"ACE_bloodIV",
"ACE_bloodIV_500",
"ACE_bloodIV_250",
"ACE_salineIV",
"ACE_salineIV_500",
"ACE_salineIV_250",
"ACE_quikclot",
"ACE_personalAidKit",
"ACE_surgicalKit"
]; 

{
private _syncedunit= _x;

if (_randomized) then {
for "_i" from 1 to random _input1 do {_syncedunit addItem (selectRandom _randommed);};
if (MiseryACE) then {
for "_i" from 1 to random _input2 do {_syncedunit addItem (selectRandom _randomACE);};
};
};

if !(_randomized) then {
for "_i" from 1 to _input1 do {_syncedunit addItem (selectRandom _randommed);};
if (MiseryACE) then {
for "_i" from 1 to _input2 do {_syncedunit addItem (selectRandom _randomACE);};
};
};

} forEach _units;
