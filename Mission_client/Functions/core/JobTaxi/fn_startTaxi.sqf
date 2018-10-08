//[_location] remoteExec ["client_fnc_startSecurity",_player];
//[getpos player,] remoteExec ["client_fnc_startGarbage",_player];
// use lexus with directionals only.
if(myjob != "none") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };

myjob = "taxi";

private ["_warning","_JobBase"];
if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		taskrunning = true;

		_warnings = 0;
		while{taskrunning} do {
			uisleep 180;
			if(player distance vehspawned < 20) then {
				paycheck = paycheck + 45;
			};
		};
		[0] call client_fnc_jobEnd;
	};
};