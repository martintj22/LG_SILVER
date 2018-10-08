_player = _this select 0;


_fetchstr = format ["getTickets:%1", getplayeruid _player];
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
_fetch = _fetch select 0 select 0;

if(_fetch isEqualTo "") then {
    [missionNamespace, ["myTickets", 0]] remoteExec ["setVariable", _player];
} else {
    [missionNamespace, ["myTickets", _fetch]] remoteExec ["setVariable", _player];
};

_fetchstr = format ["getWarrants:%1", getplayeruid _player];
_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
_fetch = _fetch select 0 select 0;

[missionNamespace, ["myWarrants", _fetch]] remoteExec ["setVariable", _player];