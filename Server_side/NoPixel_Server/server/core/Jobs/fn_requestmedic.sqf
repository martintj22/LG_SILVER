private["_nearestMedic"];

_player = _this select 0;

_nearest = currentEMS apply {[_player distance getPos _x, _x]};
_nearest sort true;
_nearest = (_nearest select 0) select 1;

[getPos _player, "Downed Person", "Location", currentEMS] remoteExec ["client_fnc_hudHelper", _nearest];
wantedTimer = time;
[format["Dispatch to %1: A downed person was spotted at %2.", _nearest getVariable "badgeNumber", mapGridPosition getPos _player], true] remoteExec ["domsg", currentEMS];