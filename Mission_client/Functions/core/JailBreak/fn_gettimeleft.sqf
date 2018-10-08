_target = _this select 0;

[format["%1 has %2 left in his sentence.", name player, [secondsLeft/60,"MM:SS"] call BIS_fnc_secondsToString], true] remoteExec ["domsg", _target];