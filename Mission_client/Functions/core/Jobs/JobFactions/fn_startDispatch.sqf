//[_location] remoteExec ["client_fnc_startSecurity",_player];
//[getpos player,] remoteExec ["client_fnc_startGarbage",_player];
// use lexus with directionals only.

private ["_warning","_JobBase"];
if(!dispatch) then {
	dispatch = true;
	playertasks = [];
};
