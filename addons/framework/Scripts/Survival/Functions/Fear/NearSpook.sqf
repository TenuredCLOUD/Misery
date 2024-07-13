private _found;
private _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;

_found=FALSE;   
 
if (count (player nearEntities [[_spookArray], 25]) > 0) then {       
  
  _found = TRUE; 

  if (_found)exitwith{}; 
};       
   
_found