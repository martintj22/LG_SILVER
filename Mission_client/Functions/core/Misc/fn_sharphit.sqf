/*
sharp melee hit
*/
params["_player","_shooter"];

if(_shooter isKindOf "Man" && !deadPlayer) then
{
	["Remove",0.1] remoteexec ["client_fnc_doHealth",_player];
};