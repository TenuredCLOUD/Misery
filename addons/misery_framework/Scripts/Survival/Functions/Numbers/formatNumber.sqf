
/* -----------------------------------
Misery number formatter
Takes input number and avoids scientific notations, should work for any numeric value, except 1Bil + Due to Arma's number processing limitations
Designed specifically for Misery mod 
by TenuredCLOUD 

Usage: 

[9999999] call Misery_fnc_formatNumber;
-------------------------------------- */

    private _num = (_this select 0) call BIS_fnc_numberText;  
    _num = _num splitString " " joinString ",";  
    _num 
