_player = _this select 0;
_myJob = _this select 1;

_level = player getVariable _myJob;

[_level] remoteExec ["client_fnc_promotionStart", _player];