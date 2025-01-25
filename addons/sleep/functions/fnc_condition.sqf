#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Condition for sleep action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Correct model <BOOL>
 *
 * Example:
 * [] call misery_sleep_fnc_sleepCondition
 *
*/

private _object = cursorObject;
private _model = getModelInfo _object select 0;
_model in [MACRO_BED_MODELS]
