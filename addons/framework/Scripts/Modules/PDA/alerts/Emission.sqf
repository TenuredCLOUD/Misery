#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Misery Emission alert startup
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[{(!isNil "tts_emission_emissionIsActive" && !isNil "tts_emission_progressState") && tts_emission_emissionIsActive == true && tts_emission_progressState == 0},
{
	MIS_REXEC(MIS_FILESYS(Modules\PDA\alerts\Emission\start),execVM,player)
}, []] call CBA_fnc_waitUntilAndExecute;

[{(!isNil "tts_emission_emissionIsActive" && !isNil "tts_emission_progressState") && tts_emission_emissionIsActive == true && tts_emission_progressState == 5},
{
	MIS_REXEC(MIS_FILESYS(Modules\PDA\alerts\Emission\end),execVM,player)
}, []] call CBA_fnc_waitUntilAndExecute;