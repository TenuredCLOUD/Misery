private ["_found"];     
 
_found=FALSE;   
 
if (count (player nearEntities [["zombie"], 25]) > 0) then {       
  _found = TRUE; 

  if (_found)exitwith{}; 
};       
   
_found