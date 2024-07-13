private _target=_this select 0;
private _time=_this select 1;
titleText[" ","BLACK OUT",1];
_target setUnconscious TRUE;
if(_time<1)then{_time=1};
sleep _time;
titleText[" ","BLACK IN",1];
_target setUnconscious FALSE;