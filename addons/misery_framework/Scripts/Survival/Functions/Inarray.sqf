private _possibleItems=_this select 0;
private _playerItems=_this select 1;
private _found=FALSE;
private _playerItems2=[];
// Convert player items to upper case
{_playerItems2 pushBack(toUpper _x)}forEach _playerItems;
// Check upper case of each possible item with player items
{
if((toUpper _x)in _playerItems2)exitWith{_found=TRUE};
}forEach _possibleItems;
_found