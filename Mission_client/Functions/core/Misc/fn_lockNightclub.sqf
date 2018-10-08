_lock = _this select 0;
_nightclub = cursorObject;

if(_lock == 1) then {

    _nightclub setVariable ["bis_disabled_Door_01", 1, true];

    lockNightclub = true;

} else {

    _nightclub setVariable ["bis_disabled_Door_01", 0, true];

    lockNightclub = false;

};

publicvariable "lockNightclub";