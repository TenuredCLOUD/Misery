#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"misery_main"}; // Include addons from this mod that contain code or assets you depend on. Affects loadorder. Including main as an example here.
        authors[] = {"TenuredCLOUD"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        VERSION_CONFIG;
    };
};

class Cfgsounds
    {
        sounds[] = {};

    //__________________________    Ambiance    __________________________

        class Ambiance_day_1{name = "Ambiance_day_1";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\Ambiance_day_1.ogg", 1, 1};titles[] = {};};
        class Ambiance_night_1{name = "Ambiance_night_1";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\Ambiance_night_1.ogg", 1, 1};titles[] = {};};
        class DTAmbience1{name = "DTAmbience1";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\DTAmbience1.ogg", 1, 1};titles[] = {};};
        class DTAmbience2{name = "DTAmbience2";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\DTAmbience2.ogg", 1, 1};titles[] = {};};
        class DTAmbience3{name = "DTAmbience3";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\DTAmbience3.ogg", 1, 1};titles[] = {};};
        class DTAmbience4{name = "DTAmbience4";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\DTAmbience4.ogg", 1, 1};titles[] = {};};
        class DTAmbience5{name = "DTAmbience5";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\DTAmbience5.ogg", 1, 1};titles[] = {};};
        class NTAmbience1{name = "NTAmbience1";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\NTAmbience1.ogg", 1, 1};titles[] = {};};
        class NTAmbience2{name = "NTAmbience2";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\NTAmbience2.ogg", 1, 1};titles[] = {};};
        class NTAmbience3{name = "NTAmbience3";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\NTAmbience3.ogg", 1, 1};titles[] = {};};
        class NTAmbience4{name = "NTAmbience4";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\NTAmbience4.ogg", 1, 1};titles[] = {};};
        class NTAmbience5{name = "NTAmbience5";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\NTAmbience5.ogg", 1, 1};titles[] = {};};
        class whisper_day{name = "whisper_day";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\whisper_day.ogg", 1, 1};titles[] = {};};
        class whisper_night{name = "whisper_night";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\whisper_night.ogg", 1, 1};titles[] = {};};
        class WanderingSoul{name = "WanderingSoul";sound[] = {"\z\misery\addons\audio\sounds\Ambiance\WanderingSoul.ogg", 1, 1};titles[] = {};};

        //__________________________    Cave    Ambiance    __________________________

        class Cave{name = "Cave";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave.ogg", 1, 1};titles[] = {};};
        class Cave01{name = "Cave01";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave01.ogg", 1, 1};titles[] = {};};
        class Cave02{name = "Cave02";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave02.ogg", 1, 1};titles[] = {};};
        class Cave03{name = "Cave03";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave03.ogg", 1, 1};titles[] = {};};
        class Cave04{name = "Cave04";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave04.ogg", 1, 1};titles[] = {};};
        class Cave05{name = "Cave05";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave05.ogg", 1, 1};titles[] = {};};
        class Cave06{name = "Cave06";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave06.ogg", 1, 1};titles[] = {};};
        class Cave07{name = "Cave07";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave07.ogg", 1, 1};titles[] = {};};
        class Cave08{name = "Cave08";sound[] = {"\z\misery\addons\audio\sounds\Cave\Cave08.ogg", 1, 1};titles[] = {};};

        //__________________________    Items     __________________________
        class CaffetinBoxOpen{name = "CaffetinBoxOpen";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\CaffetinBoxOpen.ogg", 1, 1};titles[] = {};};
        class CrinklingPlastic{name = "CrinklingPlastic";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\CrinklingPlastic.ogg", 1, 1};titles[] = {};};
        class PillBottleOpen{name = "PillBottleOpen";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\PillBottleOpen.ogg", 1, 1};titles[] = {};};
        //class bagopen{name = "bagopen";sound[] = {"\z\misery\addons\audio\sounds\inventory\UnZipping.ogg",  1, 1};titles[]={};};
        //class bagclose{name = "bagclose";sound[] = {"\z\misery\addons\audio\sounds\inventory\Zipping.ogg",  1, 1};titles[]={};};
        class bagopen{name = "bagopen";sound[] = {"\z\misery\addons\audio\sounds\inventory\in_open.ogg", 1, 1};titles[]={};};
        class bagclose{name = "bagclose";sound[] = {"\z\misery\addons\audio\sounds\inventory\in_close.ogg", 1, 1};titles[]={};};
        class pickup{name = "pickup";sound[] = {"\z\misery\addons\audio\sounds\inventory\pickup.ogg", 1, 1};titles[]={};};
        class drop{name = "drop";sound[] = {"\z\misery\addons\audio\sounds\inventory\drop4.ogg", 1, 1};titles[]={};};
        class Sniff01{name = "Sniff01";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Sniff01.ogg", 1, 1};titles[]={};};
        class WoodChop01 {name = "WoodChop01";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\WoodChop01.ogg", 1, 1};titles[]={};};
        class Chain1 {name = "Chain1";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Chain1.ogg", 1, 1};titles[]={};};
        class Chain2 {name = "Chain2";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Chain2.ogg", 1, 1};titles[]={};};
        class Chain3 {name = "Chain3";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Chain3.ogg", 1, 1};titles[]={};};
        class Chainsplit {name = "Chainsplit";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Chainsplit.ogg", 1, 1};titles[]={};};
        class ElectricSaw {name = "ElectricSaw";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\ElectricSaw.ogg", 1, 1};titles[]={};};
        class HammerSound {name = "HammerSound";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\HammerSound.ogg", 1, 1};titles[]={};};
        class SHammerWOOD {name = "SHammerWOOD";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\SHammerWOOD.ogg", 1, 1};titles[]={};};

        //__________________________    Rumbles __________________________
        class Rumble1{name = "Rumble1";sound[] = {"\z\misery\addons\audio\sounds\Rumbles\Rumble1.ogg", 1, 1};titles[] = {};};


        //__________________________    Immersion  __________________________
        class GatheringFirewood{name = "GatheringFirewood";sound[] = {"\z\misery\addons\audio\sounds\immersion\GatheringFirewood.ogg", 1, 1};titles[] = {};};
        class Cauterizing{name = "Cauterizing";sound[] = {"\z\misery\addons\audio\sounds\immersion\Cauterizing.ogg", 1, 1};titles[] = {};};
        class GasMask_Breathing{name = "GasMask_Breathing";sound[] = {"\z\misery\addons\audio\sounds\immersion\GasMask_Breathing.ogg", 1, 1};titles[] = {};};
        class ColdShiver{name = "ColdShiver";sound[] = {"\z\misery\addons\audio\sounds\sickness\ColdShiver.ogg", 1, 1};titles[] = {};};
        class Coughing{name = "Coughing";sound[] = {"\z\misery\addons\audio\sounds\sickness\Coughing.ogg", 1, 1};titles[] = {};};
        class coughMask1{name = "sneezeMask1";sound[] = {"\z\misery\addons\audio\sounds\sickness\coughMask1.ogg", 1, 1};titles[] = {};};
        class coughMask2{name = "sneezeMask2";sound[] = {"\z\misery\addons\audio\sounds\sickness\coughMask2.ogg", 1, 1};titles[] = {};};
        class coughMask3{name = "sneezeMask3";sound[] = {"\z\misery\addons\audio\sounds\sickness\coughMask3.ogg", 1, 1};titles[] = {};};
        class MaskCough01{name = "MaskCough01";sound[] = {"\z\misery\addons\audio\sounds\sickness\MaskCough01.ogg", 1, 1};titles[] = {};};
        class MaskCough02{name = "MaskCough02";sound[] = {"\z\misery\addons\audio\sounds\sickness\MaskCough02.ogg", 1, 1};titles[] = {};};
        class MaskCough03{name = "MaskCough03";sound[] = {"\z\misery\addons\audio\sounds\sickness\MaskCough03.ogg", 1, 1};titles[] = {};};
        class MaskCough04{name = "MaskCough04";sound[] = {"\z\misery\addons\audio\sounds\sickness\MaskCough04.ogg", 1, 1};titles[] = {};};
        class MaskCough05{name = "MaskCough05";sound[] = {"\z\misery\addons\audio\sounds\sickness\MaskCough05.ogg", 1, 1};titles[] = {};};
        class StomachGrowl{name = "StomachGrowl";sound[] = {"\z\misery\addons\audio\sounds\sickness\StomachGrowl.ogg", 1, 1};titles[] = {};};
        class Cough{name = "Cough";sound[] = {"\z\misery\addons\audio\sounds\sickness\Cough.ogg", 1, 1};titles[] = {};};
        class CoughMuffled{name = "CoughMuffled";sound[] = {"\z\misery\addons\audio\sounds\sickness\CoughMuffled.ogg", 1, 1};titles[] = {};};
        class GasPump{name = "GasPump";sound[] = {"\z\misery\addons\audio\sounds\immersion\GasPump.ogg", 1, 1};titles[] = {};};
        class GasPump30{name = "GasPump30";sound[] = {"\z\misery\addons\audio\sounds\immersion\GasPump30.ogg", 1, 1};titles[] = {};};
        class Sneeze{name = "Sneeze";sound[] = {"\z\misery\addons\audio\sounds\sickness\Sneeze.ogg", 1, 1};titles[] = {};};
        class Choking{name = "Choking";sound[] = {"\z\misery\addons\audio\sounds\zones\Choking.ogg", 1, 1};titles[]={};};
        class DryGrass{name = "DryGrass";sound[] = {"\z\misery\addons\audio\sounds\immersion\DryGrass.ogg", 1, 1};titles[] = {};};
        class Shower{name = "Shower";sound[] = {"\z\misery\addons\audio\sounds\immersion\Shower.ogg", 1, 1};titles[] = {};};
        class SawMill2{name = "SawMill2";sound[] = {"\z\misery\addons\audio\sounds\immersion\SawMill2.ogg", 1, 1};titles[] = {};};
        class MeatRoasted{name = "MeatRoasted";sound[] = {"\z\misery\addons\audio\sounds\immersion\MeatRoasted.ogg", 1, 1};titles[] = {};};
        class WaterBoiling{name = "WaterBoiling";sound[] = {"\z\misery\addons\audio\sounds\immersion\WaterBoiling.ogg", 1, 1};titles[] = {};};
        class Lighter{name = "Lighter";sound[] = {"\z\misery\addons\audio\sounds\immersion\Lighter.ogg", 1, 1};titles[] = {};};
        class Match{name = "Match";sound[] = {"\z\misery\addons\audio\sounds\immersion\Match.ogg", 1, 1};titles[] = {};};
        class Lightersmoking{name = "Lightersmoking";sound[] = {"\z\misery\addons\audio\sounds\immersion\Lightersmoking.ogg", 1, 1};titles[] = {};};
        class Matchsmoking{name = "Matchsmoking";sound[] = {"\z\misery\addons\audio\sounds\immersion\Matchsmoking.ogg", 1, 1};titles[] = {};};
        class StaticRADIO{name = "StaticRADIO";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticBASIC.ogg", 1, 1};titles[] = {};};
        class StaticBASIC{name = "StaticBASIC";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticBASIC.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD1{name = "StaticWEIRD1";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD1.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD2{name = "StaticWEIRD2";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD2.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD3{name = "StaticWEIRD3";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD3.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD4{name = "StaticWEIRD4";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD4.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD5{name = "StaticWEIRD5";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD5.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD6{name = "StaticWEIRD6";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD6.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD7{name = "StaticWEIRD7";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD7.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD8{name = "StaticWEIRD8";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD8.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD9{name = "StaticWEIRD9";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD9.ogg", 1, 1};titles[] = {};};
        class StaticWEIRD10{name = "StaticWEIRD10";sound[] = {"\z\misery\addons\audio\sounds\immersion\StaticWEIRD10.ogg", 1, 1};titles[] = {};};
        class 25m{name = "25m";sound[] = {"\z\misery\addons\audio\sounds\immersion\25m.ogg", 1, 1};titles[] = {};};
        class 50m{name = "50m";sound[] = {"\z\misery\addons\audio\sounds\immersion\50m.ogg", 1, 1};titles[] = {};};
        class 150m{name = "150m";sound[] = {"\z\misery\addons\audio\sounds\immersion\150m.ogg", 1, 1};titles[] = {};};
        class 250m{name = "250m";sound[] = {"\z\misery\addons\audio\sounds\immersion\250m.ogg", 1, 1};titles[] = {};};
        class 350m{name = "350m";sound[] = {"\z\misery\addons\audio\sounds\immersion\350m.ogg", 1, 1};titles[] = {};};
        class 500m{name = "500m";sound[] = {"\z\misery\addons\audio\sounds\immersion\500m.ogg", 1, 1};titles[] = {};};
        class ArtifactSOUND{name = "ArtifactSOUND";sound[] = {"\z\misery\addons\audio\sounds\immersion\ArtifactSOUND.ogg", 1, 1};titles[] = {};};

        //__________________________    Contamination Areas __________________________
        class SubmergedShort{name = "SubmergedShort";sound[] = {"\z\misery\addons\audio\sounds\zones\SubmergedShort.ogg", 1, 1};titles[]={};};
        class Green_Mountain_chatter{name = "Green_Mountain_chatter";sound[] = {"\z\misery\addons\audio\sounds\Greenmountain\Green_Mountain_chatter.ogg", 1, 1};titles[]={};};
        class Green_Mountain_static{name = "Green_Mountain_static";sound[] = {"\z\misery\addons\audio\sounds\Greenmountain\Green_Mountain_static.ogg", 1, 1};titles[]={};};
        class Green_Mountain_beep{name = "Green_Mountain_beep";sound[] = {"\z\misery\addons\audio\sounds\Greenmountain\Green_Mountain_beep.ogg", 1, 1};titles[]={};};
        class BlowoutWarning{name = "BlowoutWarning";sound[] = {"\z\misery\addons\audio\sounds\blowoutwarning\BlowoutWarning.ogg", 1, 1};titles[]={};};
        class AltarALARM{name = "AltarALARM";sound[] = {"\z\misery\addons\audio\sounds\zones\AltarALARM.ogg", 1, 1};titles[]={};};

    //__________________________    Generators __________________________
        class 100_KVA_Running{name = "100_KVA_Running";sound[] = {"\z\misery\addons\audio\sounds\generator\100_KVA_Running.ogg", 1, 1};titles[]={};};
        class 100_KVA_Startup{name = "100_KVA_Startup";sound[] = {"\z\misery\addons\audio\sounds\generator\100_KVA_Startup.ogg", 1, 1};titles[]={};};
        class 100_KVA_Shutdown{name = "100_KVA_Shutdown";sound[] = {"\z\misery\addons\audio\sounds\generator\100_KVA_Shutdown.ogg", 1, 1};titles[]={};};
        class dieselgeneratorrunning{name = "diesel-generator_running";sound[] = {"\z\misery\addons\audio\sounds\generator\diesel-generator_running.ogg", 1, 1};titles[]={};};
        class dieselgeneratorstart{name = "diesel-generator_start";sound[] = {"\z\misery\addons\audio\sounds\generator\diesel-generator_start.ogg", 1, 1};titles[]={};};
        class dieselgeneratorstop{name = "diesel-generator_stop";sound[] = {"\z\misery\addons\audio\sounds\generator\diesel-generator_stop.ogg", 1, 1};titles[]={};};
        class petorlgeneratorrunning{name = "petorl-generator_running";sound[] = {"\z\misery\addons\audio\sounds\generator\petorl-generator_running.ogg", 1, 1};titles[]={};};
        class petorlgeneratorstart{name = "petorl-generator_start";sound[] = {"\z\misery\addons\audio\sounds\generator\petorl-generator_start.ogg", 1, 1};titles[]={};};
        class petrolgeneratorstop{name = "petrol-generator_stop";sound[] = {"\z\misery\addons\audio\sounds\generator\petrol-generator_stop.ogg", 1, 1};titles[]={};};

    //__________________________    Monsters __________________________
        class Brain_Scorcher2{name = "Brain_Scorcher2";sound[] = {"\z\misery\addons\audio\sounds\NWAF\Brain_Scorcher2.ogg", 1, 1};titles[]={};};
        class Distant_Scream1{name = "Distant_Scream1";sound[] = {"\z\misery\addons\audio\sounds\Monster\Distant_Scream1.ogg", 1, 1};titles[]={};};
        class Distant_Scream2{name = "Distant_Scream2";sound[] = {"\z\misery\addons\audio\sounds\Monster\Distant_Scream2.ogg", 1, 1};titles[]={};};
        class Distant_Scream3{name = "Distant_Scream3";sound[] = {"\z\misery\addons\audio\sounds\Monster\Distant_Scream3.ogg", 1, 1};titles[]={};};
        class Distant_Scream4{name = "Distant_Scream4";sound[] = {"\z\misery\addons\audio\sounds\Monster\Distant_Scream4.ogg", 1, 1};titles[]={};};
        class Moan1{name = "Moan1";sound[] = {"\z\misery\addons\audio\sounds\Monster\Moan1.ogg", 1, 1};titles[]={};};
        class Monster_call{name = "Monster_call";sound[] = {"\z\misery\addons\audio\sounds\Monster\Monster_call.ogg", 1, 1};titles[]={};};
        class Monster_distant{name = "Monster_distant";sound[] = {"\z\misery\addons\audio\sounds\Monster\Monster_distant.ogg", 1, 1};titles[]={};};
        class Monster_scream1{name = "Monster_scream1";sound[] = {"\z\misery\addons\audio\sounds\Monster\Monster_scream1.ogg", 1, 1};titles[]={};};
        class Distant_ghost1{name = "Distant_ghost1";sound[] = {"\z\misery\addons\audio\sounds\Monster\Distant_ghost1.ogg", 1, 1};titles[]={};};
        class Distant_Hellspawn{name = "Distant_Hellspawn";sound[] = {"\z\misery\addons\audio\sounds\Monster\Distant_Hellspawn.ogg", 1, 1};titles[]={};};

        //__________________________EAS broadcast __________________________
        class EASPhantoms{name = "EASPhantoms";sound[] = {"\z\misery\addons\audio\sounds\eas\EASPhantoms.ogg", 1, 1};titles[]={};};

        //__________________________Radio __________________________
        class Radio{name = "Radio";sound[] = {"\z\misery\addons\audio\sounds\radio\Radio.ogg", 1, 1};titles[]={};};
        class EAS{name = "EAS";sound[] = {"\z\misery\addons\audio\sounds\radio\EAS.ogg", 1, 1};titles[]={};};
        class Song1{name = "Song1";sound[] = {"\z\misery\addons\audio\sounds\radio\Song1.ogg", 1, 1};titles[]={};};
        class Song2{name = "Song2";sound[] = {"\z\misery\addons\audio\sounds\radio\Song2.ogg", 1, 1};titles[]={};};
        class Song3{name = "Song3";sound[] = {"\z\misery\addons\audio\sounds\radio\Song3.ogg", 1, 1};titles[]={};};

        //__________________________GFSkin __________________________
        class Skinning_1{name = "Skinning_1";sound[] = {"\z\misery\addons\audio\sounds\z\MiserySkin\Skinning_1.ogg", 1, 1};titles[]={};};
        class Skinning_2{name = "Skinning_2";sound[] = {"\z\misery\addons\audio\sounds\z\MiserySkin\Skinning_2.ogg", 1, 1};titles[]={};};
        class Skinning_3{name = "Skinning_3";sound[] = {"\z\misery\addons\audio\sounds\z\MiserySkin\Skinning_3.ogg", 1, 1};titles[]={};};
        class Cut1{name = "Cut1";sound[] = {"\z\misery\addons\audio\sounds\z\MiserySkin\RUsaw\Cut1.ogg", 1, 1};titles[]={};};
        class Cut2{name = "Cut2";sound[] = {"\z\misery\addons\audio\sounds\z\MiserySkin\RUsaw\Cut2.ogg", 1, 1};titles[]={};};
        class Cut3{name = "Cut3";sound[] = {"\z\misery\addons\audio\sounds\z\MiserySkin\RUsaw\Cut3.ogg", 1, 1};titles[]={};};
        class BoneSaw{name = "BoneSaw";sound[] = {"\z\misery\addons\audio\sounds\z\MiserySkin\RUsaw\BoneSaw.ogg", 1, 1};titles[]={};};

        //__________________________fire __________________________
        class ACE_BigFire{name = "ACE_BigFire";sound[] = {"\z\misery\addons\audio\sounds\fire\ACE_BigFire.ogg", 1, 1};titles[]={};};

        //__________________________Trauma __________________________
        class Stage1{name = "Stage1";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Stage1.ogg", 1, 1};titles[]={};};
        class Spooky3_6{name = "Spooky3_6";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky3_6.ogg", 1, 1};titles[]={};};
        class Spooky3_5{name = "Spooky3_5";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky3_5.ogg", 1, 1};titles[]={};};
        class Spooky3_4{name = "Spooky3_4";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky3_4.ogg", 1, 1};titles[]={};};
        class Spooky3_3{name = "Spooky3_3";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky3_3.ogg", 1, 1};titles[]={};};
        class Spooky3_2{name = "Spooky3_2";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky3_2.ogg", 1, 1};titles[]={};};
        class Spooky3_1{name = "Spooky3_1";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky3_1.ogg", 1, 1};titles[]={};};
        class Spooky3{name = "Spooky3";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky3.ogg", 1, 1};titles[]={};};
        class Spooky2_Copy{name = "Spooky2_Copy";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky2_Copy.ogg", 1, 1};titles[]={};};
        class Spooky2_4{name = "Spooky2_4";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky2_4.ogg", 1, 1};titles[]={};};
        class Spooky2_3{name = "Spooky2_3";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky2_3.ogg", 1, 1};titles[]={};};
        class Spooky2_2{name = "Spooky2_2";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky2_2.ogg", 1, 1};titles[]={};};
        class Spooky2_1{name = "Spooky2_1";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky2_1.ogg", 1, 1};titles[]={};};
        class Spooky2{name = "Spooky2";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky2.ogg", 1, 1};titles[]={};};
        class Spooky1_Copy{name = "Spooky1_Copy";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky1_Copy.ogg", 1, 1};titles[]={};};
        class Spooky1_3{name = "Spooky1_3";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky1_3.ogg", 1, 1};titles[]={};};
        class Spooky1_2{name = "Spooky1_2";sound[] = {"\z\misery\addons\audio\sounds\Trauma\Spooky1_2.ogg", 1, 1};titles[]={};};

        //__________________________Jaroslav Forest __________________________
        class behindyou{name = "behindyou";sound[] = {"\z\misery\addons\audio\sounds\Jforest\behindyou.ogg", 1, 1};titles[]={};};
        class carefulnow{name = "carefulnow";sound[] = {"\z\misery\addons\audio\sounds\Jforest\carefulnow.ogg", 1, 1};titles[]={};};
        class donotbelong{name = "donotbelong";sound[] = {"\z\misery\addons\audio\sounds\Jforest\donotbelong.ogg", 1, 1};titles[]={};};
        class Hello{name = "Hello";sound[] = {"\z\misery\addons\audio\sounds\Jforest\Hello.ogg", 1, 1};titles[]={};};
        class helpme{name = "helpme";sound[] = {"\z\misery\addons\audio\sounds\Jforest\helpme.ogg", 1, 1};titles[]={};};
        class icanseeyou{name = "icanseeyou";sound[] = {"\z\misery\addons\audio\sounds\Jforest\icanseeyou.ogg", 1, 1};titles[]={};};
        class illkillyou{name = "illkillyou";sound[] = {"\z\misery\addons\audio\sounds\Jforest\illkillyou.ogg", 1, 1};titles[]={};};
        class iwillkillyou{name = "iwillkillyou";sound[] = {"\z\misery\addons\audio\sounds\Jforest\iwillkillyou.ogg", 1, 1};titles[]={};};
        class run{name = "run";sound[] = {"\z\misery\addons\audio\sounds\Jforest\run.ogg", 1, 1};titles[]={};};
        class running{name = "running";sound[] = {"\z\misery\addons\audio\sounds\Jforest\running.ogg", 1, 1};titles[]={};};
        class runninghello{name = "runninghello";sound[] = {"\z\misery\addons\audio\sounds\Jforest\runninghello.ogg", 1, 1};titles[]={};};
        class runnow{name = "runnow";sound[] = {"\z\misery\addons\audio\sounds\Jforest\runnow.ogg", 1, 1};titles[]={};};
        class runnow2{name = "runnow2";sound[] = {"\z\misery\addons\audio\sounds\Jforest\runnow2.ogg", 1, 1};titles[]={};};
        class walking{name = "walking";sound[] = {"\z\misery\addons\audio\sounds\Jforest\walking.ogg", 1, 1};titles[]={};};

        //__________________________Geiger enable __________________________
        class GeigerOFF{name = "GeigerOFF";sound[] = {"\z\misery\addons\audio\sounds\Geigerenable\GeigerOFF.ogg", 10, 1};titles[]={};};
        class GeigerON{name = "GeigerON";sound[] = {"\z\misery\addons\audio\sounds\Geigerenable\GeigerON.ogg", 10, 1};titles[]={};};
        class Geiger001{name = "Geiger001";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger001.ogg", 10, 1};titles[] = {};};
        class Geiger002{name = "Geiger002";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger002.ogg", 10, 1};titles[] = {};};
        class Geiger003{name = "Geiger003";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger003.ogg", 10, 1};titles[] = {};};
        class Geiger004{name = "Geiger004";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger004.ogg", 10, 1};titles[] = {};};
        class Geiger005{name = "Geiger005";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger005.ogg", 10, 1};titles[] = {};};
        class Geiger006{name = "Geiger006";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger006.ogg", 10, 1};titles[] = {};};
        class Geiger007{name = "Geiger007";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger007.ogg", 10, 1};titles[] = {};};
        class Geiger008{name = "Geiger008";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger008.ogg", 10, 1};titles[] = {};};
        class Geiger009{name = "Geiger009";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger009.ogg", 10, 1};titles[] = {};};
        class Geiger010{name = "Geiger010";sound[] = {"\z\misery\addons\audio\sounds\inventory\Items\Geiger010.ogg", 10, 1};titles[] = {};};

        //__________________________ ERU __________________________
        class ChirpBeep{name = "ChirpBeep";sound[] = {"\z\misery\addons\audio\sounds\eru\ChirpBeep.ogg", 1, 1};titles[]={};};
        class PowerDownBeep{name = "PowerDownBeep";sound[] = {"\z\misery\addons\audio\sounds\eru\PowerDownBeep.ogg", 1, 1};titles[]={};};
        class PowerUpBeep{name = "PowerUpBeep";sound[] = {"\z\misery\addons\audio\sounds\eru\PowerUpBeep.ogg", 1, 1};titles[]={};};

        //__________________________Mining __________________________
        class Coal{name = "Coal";sound[] = {"\z\misery\addons\audio\sounds\Mining\Coal.ogg", 1, 1};titles[]={};};
        class FurnaceFire{name = "FurnaceFire";sound[] = {"\z\misery\addons\audio\sounds\Mining\FurnaceFire.ogg", 1, 1};titles[]={};};
        class Gold{name = "Gold";sound[] = {"\z\misery\addons\audio\sounds\Mining\Gold.ogg", 1, 1};titles[]={};};
        class Iron{name = "Iron";sound[] = {"\z\misery\addons\audio\sounds\Mining\Iron.ogg", 1, 1};titles[]={};};
        class Stone{name = "Stone";sound[] = {"\z\misery\addons\audio\sounds\Mining\Stone.ogg", 1, 1};titles[]={};};
        class AnvilHammer{name = "AnvilHammer";sound[] = {"\z\misery\addons\audio\sounds\Mining\AnvilHammer.ogg", 1, 1};titles[]={};};
        class MetalSmelt{name = "MetalSmelt";sound[] = {"\z\misery\addons\audio\sounds\Mining\MetalSmelt.ogg", 1, 1};titles[]={};};
        class Pickaxe{name = "Pickaxe";sound[] = {"\z\misery\addons\audio\sounds\Mining\Pickaxe.ogg", 1, 1};titles[]={};};
        class Pickaxe60{name = "Pickaxe60";sound[] = {"\z\misery\addons\audio\sounds\Mining\Pickaxe60.ogg", 1, 1};titles[]={};};
};

class CfgMusic
{
tracks[] = {};
class CrimsonSunset{name = "CrimsonSunset";sound[] = {"\z\misery\addons\audio\music\CrimsonSunset.ogg", 1, 1};titles[] = {0,""};};
class ExtinctionEntity{name = "ExtinctionEntity";sound[] = {"\z\misery\addons\audio\music\ExtinctionEntity.ogg", 1, 1};titles[] = {0,""};};
class NotAlone{name = "NotAlone";sound[] = {"\z\misery\addons\audio\music\NotAlone.ogg", 1, 1};titles[] = {0,""};};
class SacredForest{name = "SacredForest";sound[] = {"\z\misery\addons\audio\music\SacredForest.ogg", 1, 1};titles[] = {0,""};};
class Wendigo{name = "Wendigo";sound[] = {"\z\misery\addons\audio\music\Wendigo.ogg", 1, 1};titles[] = {0,""};};
class TheBurningRain{name = "TheBurningRain";sound[] = {"\z\misery\addons\audio\music\TheBurningRain.ogg", 1, 1};titles[] = {0,""};};
class SullenSkies{name = "SullenSkies";sound[] = {"\z\misery\addons\audio\music\SullenSkies.ogg", 1, 1};titles[] = {0,""};};
class Tectonic{name = "Tectonic";sound[] = {"\z\misery\addons\audio\music\Tectonic.ogg", 1, 1};titles[] = {0,""};};
class Atmospheric{name = "Atmospheric";sound[] = {"\z\misery\addons\audio\music\Atmospheric.ogg", 1, 1};titles[] = {0,""};};
class Limbo{name = "Limbo";sound[] = {"\z\misery\addons\audio\music\Limbo.ogg", 1, 1};titles[] = {0,""};};
class TheBeginning{name = "TheBeginning";sound[] = {"\z\misery\addons\audio\music\TheBeginning.ogg", 1, 1};titles[] = {0,""};};
class Elysium{name = "Elysium";sound[] = {"\z\misery\addons\audio\music\Elysium.ogg", 1, 1};titles[] = {0,""};};
class EternalOhm{name = "EternalOhm";sound[] = {"\z\misery\addons\audio\music\EternalOhm.ogg", 1, 1};titles[] = {0,""};};
class MyColdBones{name = "MyColdBones";sound[] = {"\z\misery\addons\audio\music\MyColdBones.ogg", 1, 1};titles[] = {0,""};};
class OldWorld{name = "OldWorld";sound[] = {"\z\misery\addons\audio\music\OldWorld.ogg", 1, 1};titles[] = {0,""};};
class RazorBurn{name = "RazorBurn";sound[] = {"\z\misery\addons\audio\music\RazorBurn.ogg", 1, 1};titles[] = {0,""};};
class Ethereal{name = "Ethereal";sound[] = {"\z\misery\addons\audio\music\Ethereal.ogg", 1, 1};titles[] = {0,""};};
class PassingThroughTheLight{name = "PassingThroughTheLight";sound[] = {"\z\misery\addons\audio\music\PassingThroughTheLight.ogg", 1, 1};titles[] = {0,""};};
class PlaguedLands{name = "PlaguedLands";sound[] = {"\z\misery\addons\audio\music\PlaguedLands.ogg", 1, 1};titles[] = {0,""};};
class Playground{name = "Playground";sound[] = {"\z\misery\addons\audio\music\Playground.ogg", 1, 1};titles[] = {0,""};};
class Scars{name = "Scars";sound[] = {"\z\misery\addons\audio\music\Scars.ogg", 1, 1};titles[] = {0,""};};
class TheySeeYou{name = "TheySeeYou";sound[] = {"\z\misery\addons\audio\music\TheySeeYou.ogg", 1, 1};titles[] = {0,""};};
};

