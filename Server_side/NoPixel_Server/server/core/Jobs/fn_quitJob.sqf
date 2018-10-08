_player = _this select 0;

diag_log ["leave job %1", _player];

//jobs that can happen inside jobs, so, if found, keep searching.


if (_player IN currentPoliceDispatch) then {  
	_pia = currentPoliceDispatch find _player;
	currentPoliceDispatch deleteAt _pia;
	publicvariable "currentPoliceDispatch";
};

if (_player IN currentDocDispatch) then {  
	_pia = currentDocDispatch find _player;
	currentDocDispatch deleteAt _pia;
	publicvariable "currentDocDispatch";
};

if (_player IN currentMedicDispatch) then { 
	_pia = currentMedicDispatch find _player;
	currentMedicDispatch deleteAt _pia;
	publicvariable "currentPoliceDispatch";
};

if (_player IN currentFireDispatch) then { 
	_pia = currentFireDispatch find _player;
	currentFireDispatch deleteAt _pia;
	publicvariable "currentFireDispatch";
};

//standard jobs - exit if found.

if (_player IN currentCop) exitwith {  
	_pia = currentCop find _player;
	currentCop deleteAt _pia;
	publicvariable "currentCop";

	if (_player IN currentDetectives) then {  
		_pia = currentDetectives find _player;
		currentDetectives deleteAt _pia;
		publicvariable "currentDetectives";
	};

	if (_player IN currentMarshals) then {  
		_pia = currentMarshals find _player;
		currentMarshals deleteAt _pia;
		publicvariable "currentMarshals";
	};
	
};


if (_player IN currentEMS) exitwith { 
	_pia = currentEMS find _player;
	currentEMS deleteAt _pia;
	publicvariable "currentEMS";
};

if (_player IN currentMafia) exitwith {  
	_pia = currentMafia find _player;
	currentMafia deleteAt _pia;
	publicvariable "currentMafia";
};


if (_player IN currentBiker) exitwith {  
	_pia = currentBiker find _player;
	currentBiker deleteAt _pia;
	publicvariable "currentBiker";
};

if (_player IN currentMobster) exitwith {  
	_pia = currentMobster find _player;
	currentMobster deleteAt _pia;
	publicvariable "currentMobster";
};

if (_player IN currentdoc) exitwith {  
	_pia = currentdoc find _player;
	currentdoc deleteAt _pia;
	publicvariable "currentdoc";
};

if(_player IN currentLawyers) exitwith { 
	_pia = currentLawyers find _player;
	currentLawyers deleteAt _pia;
	publicvariable "currentLawyers";
};

if(_player IN currentJudges) exitwith { 
	_pia = currentJudges find _player;
	currentJudges deleteAt _pia;
	publicvariable "currentJudges";
};



if(_player IN currentsenators) exitwith { 	_pia = currentsenators find _player;
currentsenators deleteAt _pia; publicvariable "currentsenators"; };

if(_player IN currentda) exitwith { 	_pia = currentda find _player;
currentda deleteAt _pia; publicvariable "currentda"; };









//limited player jobs - need to update the addjob function -- organize these later from most popular to least, this will make it faster than using switch.

if(_player IN currentBusDrivers) exitwith { 
	_pia = currentBusDrivers find _player;
	currentBusDrivers deleteAt _pia;
	publicvariable "currentBusDrivers";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentMailmen) exitwith { 
	_pia = currentMailmen find _player;
	currentMailmen deleteAt _pia;
	publicvariable "currentMailmen";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentsecurity) exitwith { 
	_pia = currentsecurity find _player;
	currentsecurity deleteAt _pia;
	publicvariable "currentsecurity";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentTowTruckDrivers) exitwith { 
	_pia = currentTowTruckDrivers find _player;
	currentTowTruckDrivers deleteAt _pia;
	publicvariable "currentTowTruckDrivers";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentRepairmen) exitwith { 
	_pia = currentRepairmen find _player;
	currentRepairmen deleteAt _pia;
	publicvariable "currentRepairmen";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentNewsMan) exitwith { 
	_pia = currentNewsMan find _player;
	currentNewsMan deleteAt _pia;
	publicvariable "currentNewsMan";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentTrashMan) exitwith { 
	_pia = currentTrashMan find _player;
	currentTrashMan deleteAt _pia;
	publicvariable "currentTrashMan";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentmailmen) exitwith { 
	_pia = currentmailmen find _player;
	currentmailmen deleteAt _pia;
	publicvariable "currentMailmen";
	//[] spawn server_fnc_addJob;
};

if(_player IN currentTaxiDrivers) exitwith { 
	_pia = currentTaxiDrivers find _player;
	currentTaxiDrivers deleteAt _pia;
	publicvariable "currentTaxiDrivers";
	//[] spawn server_fnc_addJob;
};