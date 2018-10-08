_type = _this select 0;
_player = _this select 1;


if(_type == 0) then {

    _update = [0, format ["readAllMail:%1", getPlayerUID _player]] call ExternalS_fnc_ExtDBquery;

};

if(_type == 1) then {

    _fetch = [format ["getUnreadMail:%1", getPlayerUID _player], 2] call ExternalS_fnc_ExtDBasync;
    _fetch = _fetch select 0 select 0;

    [_player, ["unreadMail", _fetch]] remoteExec ["setVariable", _player];

};