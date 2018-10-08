//[position,type IE "Murder" or "Vehicle Accident"] remoteExec ["client_fnc_startNews",_player];
if(myjob != "none") exitwith { ["You already have a job!", true] spawn domsg; };
if(isnil "taskrunning") then { taskrunning = false; };

myjob = "NewsMan";

private ["_warning","_JobBase"];
if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		taskrunning = true;

		_warnings = 0;
		while{taskrunning} do {
			uisleep 3;
			if(playertasks isequalto []) then {
				["You have no current jobs!", true] spawn domsg;
				uisleep 60;
			} else {

				if(player distance ((playertasks select 0) select 0) < 15) then {
					["You have arrived, get the cameras rolling!", true] spawn domsg;
					paycheck = paycheck + 30;
					playertasks deleteat 0;
					deletemarkerlocal format["job%1",getPlayerUID player];
					uisleep 3;
				} else {
					[format ["Your current Job (Marked on the Map): Job Type - %1", ((playertasks select 0) select 1)], false] spawn doquickmsg;
					[((playertasks select 0) select 0)] call client_fnc_jobMarker;			
					uisleep 30;
				};
			};
		};
		[0] call client_fnc_jobEnd;
	};
};

if(taskrunning) then { 
	_location = _this select 0;
	_type = _this select 1;
	playertasks pushback [_location,_type]; 
};