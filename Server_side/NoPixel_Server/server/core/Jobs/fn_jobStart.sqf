// send the location and job here 
//[player,"job"] remoteExec ["server_fnc_jobStart",2];

_player = _this select 0;
_jobtype = _this select 1;

diag_log ["job starting %1 - %2", _player,_jobtype];

if (str _jobtype find "Cop" > -1) exitwith {   
	if(count currentCop < 15) then {
		[_player, 0, getplayeruid _player, name _player] call Server_fnc_statSave;
		[] remoteExec ["client_fnc_startCop",_player];
		_player setvariable ["sync",0,false];
		currentCop pushback _player;
		publicvariable "currentCop";
		//make a group and add them? easier for map locations / gps tracking.
	} else {
		["Too many on duty",true] remoteexec ["domsg",_player];
	};
};

if (str _jobtype find "EMS" > -1) exitwith {  
	if(count currentEMS < 5) then {
		[_player, 0, getplayeruid _player, name _player] call Server_fnc_statSave;		
		[] remoteExec ["client_fnc_startEMS",_player];
		_player setvariable ["sync",0,false];
		currentEMS pushback _player;
		publicvariable "currentEMS";
	} else {
		//return error.
		["Too many on duty",true] remoteexec ["domsg",_player];
	};
};

if (str _jobtype find "Mafia" > -1) exitwith {   
	if(count currentMafia < 10) then {
		[] remoteExec ["client_fnc_startMafia",_player];
		currentMafia pushback _player;
		publicvariable "currentMafia";
	} else {
		//return error.
		["Too many on duty",true] remoteexec ["domsg",_player];
	};	
};



if (str _jobtype find "Police Dispatch" > -1) exitwith {   
	[] remoteExec ["client_fnc_startDispatch",_player];
	currentPoliceDispatch pushback _player;
	publicvariable "currentPoliceDispatch";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Doc Dispatch" > -1) exitwith {   
	[] remoteExec ["client_fnc_startDispatch",_player];
	currentDocDispatch pushback _player;
	publicvariable "currentDocDispatch";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Medic Dispatch" > -1) exitwith {
	[] remoteExec ["client_fnc_startDispatch",_player];
	currentMedicDispatch pushback _player;
	publicvariable "currentMedicDispatch";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Fire Dispatch" > -1) exitwith {
	[] remoteExec ["client_fnc_startDispatch",_player];
	currentFireDispatch pushback _player;
	publicvariable "currentFireDispatch";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Fedex Worker" > -1) exitwith {
	[] remoteExec ["client_fnc_mailSystem",_player];
	currentmailmen pushback _player;
	publicvariable "currentMailMen";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Taxi Driver" > -1) exitwith {
	[] remoteExec ["client_fnc_startTaxi",_player];
	currentTaxiDrivers pushback _player;
	publicvariable "currentTaxiDrivers";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Security" > -1) exitwith {
	[] remoteExec ["client_fnc_startSecurity",_player];
	currentsecurity pushback _player;
	publicvariable "currentSecurity";
	//[] spawn server_fnc_addJob;
};




if (str _jobtype find "Legal Aid" > -1) exitwith {
	[] remoteExec ["client_fnc_startLegalAid",_player];
	currentlegalaid pushback _player;
	publicvariable "currentLegalAid";
	//[] spawn server_fnc_addJob;
};


if (str _jobtype find "Legal" > -1) exitwith {

	[] remoteExec ["client_fnc_startLegal",_player];

	if(player getvariable "legal" == 1) then {
		currentPubDefs pushback _player;
		publicvariable "currentPubDefs";
	};
	if(player getvariable "legal" == 2) then {
		currentPubDefs pushback _player;
		publicvariable "currentPubDefs";
	};
	if(player getvariable "legal" == 3) then {
		currentPubDefs pushback _player;
		publicvariable "currentPubDefs";
	};
	if(player getvariable "legal" == 4) then {
		currentPubDefs pushback _player;
		publicvariable "currentPubDefs";
	};
	if(player getvariable "legal" == 5) then {
		currentPubDefs pushback _player;
		publicvariable "currentPubDefs";
	};
	if(player getvariable "legal" == 6) then {
		currentjudges pushback _player;
		publicvariable "currentJudges";
	};
	if(player getvariable "legal" == 7) then {
		currentjudges pushback _player;
		publicvariable "currentJudges";
	};
	if(player getvariable "legal" == 8) then {
		currentJudges pushback _player;
		publicvariable "currentJudges";
	};
	if(player getvariable "legal" == 9) then {
		currentJudges pushback _player;
		publicvariable "currentJudges";
	};	
	if(player getvariable "legal" == 10) then {
		currentJudges pushback _player;
		publicvariable "currentJudges";
	};							
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Tow Truck Driver" > -1) exitwith {
	[] remoteExec ["client_fnc_startTowTruck",_player];
	currentTowTruckDrivers pushback _player;
	publicvariable "currentTowTruckDrivers";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Garbage Man" > -1) exitwith {
	[] remoteExec ["client_fnc_startGarbage",_player];
	currentTrashMan pushback _player;
	publicvariable "currentTrashman";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "News Reporter" > -1) exitwith {
	[] remoteExec ["client_fnc_startNews",_player];	
	currentNewsMan pushback _player;
	publicvariable "currentNewsMan";
	//[] spawn server_fnc_addJob;
};

if (str _jobtype find "Repairman" > -1) exitwith {	
	[] remoteExec ["client_fnc_startRepair",_player];
	currentRepairmen pushback _player;
	publicvariable "currentRepairmen";
	//[] spawn server_fnc_addJob;
};

