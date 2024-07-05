private ["_found"];     
 
_found=FALSE;   
 
if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 25]) > 0) then {       
  _found = TRUE; 

  if (_found)exitwith{}; 
};       
   
_found