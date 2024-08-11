/*
Misery Item usage Decrementer
Decrements magazine type items by 1 each use, if container has only 1 count left, it is removed on last use 
Designed specifically for Misery mod 
by TenuredCLOUD 

Usage Example:
["Misery_pain"] call Misery_fnc_ItemDecrement; 
*/

 params ["_Item"];  

 private _magazines = magazinesAmmo player; 
 
 private _ItemContainer = _magazines findIf {(_x select 0) == _Item}; 
 
 if (_ItemContainer != -1) then {  
  private _ContainerCount = (_magazines select _ItemContainer) select 1; 
 
  if (_ContainerCount > 1) then { 
   player removeMagazine _Item; 
   player addMagazine [_Item, _ContainerCount - 1];   
   }else{ 
   player removeMagazine _Item; 
  }; 
 }; 

