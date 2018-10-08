if(myjob != "none" && myjob != "cropdusting") exitwith { ["You already have a job!", true] spawn domsg; };

if(isnil "taskrunning") then { taskrunning = false; };

myjob = "cropdusting";

[] call client_fnc_hudwork;

private ["_warning","_JobBase"];


if(!taskrunning) then {

	[] spawn {
		playertasks = [];
		sprayCapacity = 100;
		taskrunning = true;

		_warnings = 0;
		while{taskrunning && myjob == "cropdusting"} do {
			uisleep 3;
			if(playertasks isequalto []) then {
				["You have no current jobs, fly around safely until a task is generated!", true] spawn domsg;
				uisleep 60;

				if(sprayCapacity > 20) then {
					_defaultjobs = [[3567.24,1929.51,-0.00124359],[4654.04,3070.79,0.00135803],[3898.7,2686.29,0.000307083],[4969.38,4793.7,0.000488281],[9265.04,6887.19,0.00150585],[9174.77,4357.66,0.00127983],[7083.15,3283.64,0.00138092]];
					_randomTask = _defaultjobs call bis_fnc_selectRandom;
					playertasks pushback [_randomTask,"dump"];
					[_randomTask] call client_fnc_jobMarker;	
				} else {
					playertasks pushback [[1988.9,8798.34,0.00143909],"refuel"];
					[[1988.9,8798.34,0.00143909]] call client_fnc_jobMarker;	
				};



			} else {


				if(_warnings > 30) then { 
					taskrunning = false; 
					["You have been laid off from your job!", true] spawn domsg; 
				};

				if(vehspawned distance player > 30) then { _warnings = _warnings + 1; };
				if(isNull vehspawned) then { _warnings = _warnings + 1; };


				if(player distance ((playertasks select 0) select 0) < 100 && vehicle player iskindof "Air" && ((playertasks select 0) select 1) != "refuel") then {


					["You are spraying the area!", true] spawn domsg;
					[] spawn client_fnc_cropDustingSpray;

					paycheck = paycheck + 30;
					playertasks deleteat 0;
					uisleep 3;
					deletemarkerlocal format["job%1",getPlayerUID player];


					["add","Karma",4,"Farming"] call client_fnc_sustain;

					_level_check = (client_level_array select 8);
					_amount = 0;
					sprayCapacity = sprayCapacity - 10;
					if(_level_check > 10 && _level_check < 300) then { sprayCapacity = sprayCapacity - 5; _amount = _level_check / 5; };
					if(_level_check > 299 && _level_check < 600) then { sprayCapacity = sprayCapacity - 5; _amount = _level_check / 4; };
					if(_level_check > 599) then { sprayCapacity = sprayCapacity - 5; _amount = _level_check / 3; };

					_amount = round(_amount);

					if(_amount > 0) then {
						if(_amount > 150) then { _amount = 150; };
						[ format["You got paid an extra %1 cash in pocket!", _amount call client_fnc_numberText ] , false ] spawn domsg;	
						[_amount,true,true] call Client_fnc_addMoneyToPlayer;
					};


				};


				if(player distance ((playertasks select 0) select 0) < 50 && player distance [1988.9,8798.34,0.00143909] < 50 && speed vehicle player < 5) then {
					sprayCapacity = 100;

					["You have refilled the Spray Canisters!", true] spawn domsg;

					paycheck = paycheck + 300;
					["You finished a full round, your next paycheck will be bigger & received a $500.00 bonus.", true] spawn domsg;
					[500,true,true] call Client_fnc_addMoneyToPlayer;

					playertasks deleteat 0;
					uisleep 3;
					deletemarkerlocal format["job%1",getPlayerUID player];
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

// [1988.9,8798.34,0.00143909] = northern island airfield.

// [3567.24,1929.51,-0.00124359] farm 2 

// [3371.74,960.018,0.00144196] airfield gas

// [4654.04,3070.79,0.00135803] logging area

// [3898.7,2686.29,0.000307083] mining area

// [4969.38,4793.7,0.000488281] senit peak


