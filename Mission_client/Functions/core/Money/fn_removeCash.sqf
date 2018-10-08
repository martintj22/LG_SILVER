private ["_old", "_new","_dirtyMoney"];
params ["_amount",["_useClean",false]];
_old = player getVariable "cashinhand";
_new = _old - _amount;
if (_new >= 0) then {

	player setVariable ["cashinhand", _new, false];
	[player, "cashinhand", _new] remoteExec ["Server_fnc_setVariable",2];
		
	if!(_useClean) then {
		_DirtyMoney = (client_level_array select 16);
		
		if( (_dirtyMoney - _amount) > 0 ) then {
			_dirtyMoney = (_dirtyMoney - _amount);
		} else {
			_dirtyMoney = 0;
		};
		
		["Set","Karma",_DirtyMoney,"DirtyMoney"] call client_fnc_sustain;
	}; 
	
	
};