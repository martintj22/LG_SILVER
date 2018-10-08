//[_location] remoteExec ["client_fnc_startSecurity",_player];
//[getpos player,] remoteExec ["client_fnc_startGarbage",_player];
// use lexus with directionals only.
if(myjob != "none") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };

myjob = "security";

private ["_warning","_JobBase"];
if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		taskrunning = true;

		_warnings = 0;
		while{taskrunning} do {
			uisleep 3;
			if(playertasks isequalto []) then {
				["You have no current jobs, please patrol a city and keep an eye on shops!", true] spawn domsg;
				uisleep 60;
			} else {

				if(player distance ((playertasks select 0) select 0) < 15) then {
					["You have arrived, please stick around for atleast 5-10 minutes unless told otherwise!", true] spawn domsg;
					paycheck = paycheck + 30;
					playertasks deleteat 0;
					uisleep 3;
					deletemarkerlocal format["job%1",getPlayerUID player];
				} else {
					["Your current Job (Marked on the Map): Job Type - Security", true] spawn domsg;	
					[((playertasks select 0) select 0)] call client_fnc_jobMarker;			
					uisleep 3;
				};
			};
		};
		[0] call client_fnc_jobEnd;
	};
};

if(taskrunning) then { 
	_location = _this select 0;
	playertasks pushback [_location]; 
};