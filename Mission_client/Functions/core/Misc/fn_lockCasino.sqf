_lock = _this select 0;
_casino = cursorObject;

if(_lock == 1) then {

    _casino setVariable ["bis_disabled_Door_01", 1, true];
    _casino setVariable ["bis_disabled_Door_03", 1, true];
    _casino setVariable ["bis_disabled_Door_05", 1, true];
    _casino setVariable ["bis_disabled_Door_07", 1, true];
    _casino setVariable ["bis_disabled_Door_09", 1, true];

    lockCasino = true;

} else {

    _casino setVariable ["bis_disabled_Door_01", 0, true];
    _casino setVariable ["bis_disabled_Door_03", 0, true];
    _casino setVariable ["bis_disabled_Door_05", 0, true];
    _casino setVariable ["bis_disabled_Door_07", 0, true];
    _casino setVariable ["bis_disabled_Door_09", 0, true];

    lockCasino = false;

};

publicVariable "lockCasino";