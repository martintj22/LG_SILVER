params["_target"];

if(count currentsecurity > 0) then { 
	_player = currentsecurity call BIS_fnc_selectRandom; 
	[getpos _target] remoteexec ["client_fnc_jobMarker", _player];
	["DISPATCH: A BANK WILL IS INSPECTED, LOCATION LOCATED ON THE MAP", false] remoteExec ["domsg", _player]; 
	[getpos _target] remoteexec ["client_fnc_jobMarker", currentCop]; 
	["911: DURING BANK FAILURE, LOCATION MARKED ON THE MAP!", false] remoteExec ["domsg", currentCop];
	["dbank"] remoteExec ["client_fnc_playSound", currentCop];
	//if (myjob == "cop") then {playSound "dbank";};
} else { 
	[getpos _target] remoteexec ["client_fnc_jobMarker", currentCop];
	["911: BANK DAMAGE, LOCATION MARKED ON THE MAP!", false] remoteExec ["domsg", currentCop]; 
	["dbank"] remoteExec ["client_fnc_playSound", currentCop];
	//if (myjob == "cop") then {playSound "dbank";};
}; 

diag_log ["robbery call %1", _target];
