//[getpos object, "News", "Mass Shooting"] remoteexec ["server_fnc_giveTask",2];
//[getpos player, "Tow", "Vehicle Tow Request"] remoteexec ["server_fnc_giveTask",2];

_position = _this select 0;
_type = _this select 1;
_input = _this select 2;

diag_log ["give task %1", _type];

if(_type == "News") exitwith {
	if(count currentNewsMan == 0) exitWith {};
	_players = [];
	_player = currentNewsMan call BIS_fnc_selectRandom;
	_players pushback _player;
	_player2 = currentNewsMan call BIS_fnc_selectRandom;
	if(_player2 != _player) then { _players pushback _player2; };
	[_position,_input] remoteExec ["client_fnc_startNews",_players];
};

if(_type == "Tow") exitwith {
	_player = currentTowTruckDrivers call BIS_fnc_selectRandom;
	[_position,_input] remoteExec ["client_fnc_startTowTruck",_player];
};