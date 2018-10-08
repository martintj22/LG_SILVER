//[_location] remoteExec ["client_fnc_startSecurity",_player];
//[getpos player,] remoteExec ["client_fnc_startGarbage",_player];
// use lexus with directionals only.
if(myjob != "none") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };

myjob = "taxi";
[] call client_fnc_hudwork;
private ["_warning","_JobBase"];
if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		taskrunning = true;

		_warnings = 0;
		while{taskrunning && myjob == "taxi"} do {


			if(_warnings > 10) then { 
				taskrunning = false; 
				["You have been laid off from your job!", true] spawn domsg; 
			};

			if(vehspawned distance player > 30) then { _warnings = _warnings + 1; };
			if(isNull vehspawned) then { _warnings = _warnings + 1; };

			
			uisleep 180;
			paycheck = paycheck + 65;

			if(random(100) > 75) then { ["add","Karma",1,"Taxi Driver"] call client_fnc_sustain; };
			
			_level_check = (client_level_array select 9);
			_amount = 0;
			if(_level_check > 10 && _level_check < 300) then { _amount = _level_check / 7; };
			if(_level_check > 299 && _level_check < 600) then { _amount = _level_check / 5; };
			if(_level_check > 599) then { _amount = _level_check / 4; };

			_amount = round(_amount);

			if(_amount > 0) then {
				if(_amount > 150) then { _amount = 150; };
				[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
				[_amount,true,true] call Client_fnc_addMoneyToPlayer;
			};


		};
		[0] call client_fnc_jobEnd;
	};
};