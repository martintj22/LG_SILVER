

diag_log "refreshing job list";

//jobs that can happen inside jobs, so, if found, keep searching.


	_old = currentPoliceDispatch;

	for "_i" from 0 to 20 step 1 do {
		_pia = currentPoliceDispatch FIND objNull;  
		currentPoliceDispatch deleteAT _pia;  
	};

	if!(_old isEqualTo currentpolicedispatch) then { publicvariable "currentPoliceDispatch"; };


	_old = currentDocDispatch;

	for "_i" from 0 to 20 step 1 do {
		_pia = currentDocDispatch FIND objNull;  
		currentDocDispatch deleteAT _pia;  
	};

	if!(_old isEqualTo currentDocDispatch) then { publicvariable "currentDocDispatch"; };





	_old =  currentMedicDispatch;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentMedicDispatch FIND objNull;  
		 currentMedicDispatch deleteAT _pia;  
	};

	if!(_old isEqualTo  currentMedicDispatch) then { publicvariable "currentMedicDispatch"; };



	_old =  currentFireDispatch;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentFireDispatch FIND objNull;  
		 currentFireDispatch deleteAT _pia;  
	};

	if!(_old isEqualTo  currentFireDispatch) then { publicvariable "currentFireDispatch"; };



	_old =  currentCop;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentCop FIND objNull;  
		 currentCop deleteAT _pia;  
	};

	if!(_old isEqualTo  currentCop) then { publicvariable "currentCop"; };


	_old =  currentDetectives;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentDetectives FIND objNull;  
		 currentDetectives deleteAT _pia;  
	};

	if!(_old isEqualTo  currentDetectives) then { publicvariable "currentDetectives"; };




	_old =  currentMarshals;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentMarshals FIND objNull;  
		 currentMarshals deleteAT _pia;  
	};

	if!(_old isEqualTo currentMarshals) then { publicvariable "currentMarshals";


	_old =  currentEMS;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentEMS FIND objNull;  
		 currentEMS deleteAT _pia;  
	};

	if!(_old isEqualTo  currentEMS) then { publicvariable "currentEMS"; };



 
	_old =  currentMafia;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentMafia FIND objNull;  
		 currentMafia deleteAT _pia;  
	};

	if!(_old isEqualTo  currentMafia) then { publicvariable "currentMafia"; };


 


















	_old =  currentsenators;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentsenators FIND objNull;  
		 currentsenators deleteAT _pia;  
	};

	if!(_old isEqualTo  currentsenators) then { publicvariable "currentsenators"; };


	_old =  currentDA;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentDA FIND objNull;  
		 currentDA deleteAT _pia;  
	};

	if!(_old isEqualTo  currentDA) then { publicvariable "currentDA"; };

















	_old =  currentLawyers;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentLawyers FIND objNull;  
		 currentLawyers deleteAT _pia;  
	};

	if!(_old isEqualTo  currentLawyers) then { publicvariable "currentLawyers"; };



	_old =  currentJudges;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentJudges FIND objNull;  
		 currentJudges deleteAT _pia;  
	};

	if!(_old isEqualTo  currentJudges) then { publicvariable "currentJudges"; };





	_old =  currentMailmen;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentMailmen FIND objNull;  
		 currentMailmen deleteAT _pia;  
	};

	if!(_old isEqualTo  currentMailmen) then { publicvariable "currentMailmen"; };




	_old =  currentsecurity;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentsecurity FIND objNull;  
		 currentsecurity deleteAT _pia;  
	};

	if!(_old isEqualTo  currentsecurity) then { publicvariable "currentsecurity"; };



	_old =  currentTowTruckDrivers;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentTowTruckDrivers FIND objNull;  
		 currentTowTruckDrivers deleteAT _pia;  
	};

	if!(_old isEqualTo  currentTowTruckDrivers) then { publicvariable "currentTowTruckDrivers"; };


	_old =  currentRepairmen;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentRepairmen FIND objNull;  
		 currentRepairmen deleteAT _pia;  
	};

	if!(_old isEqualTo  currentRepairmen) then { publicvariable "currentRepairmen"; };


	_old =  currentNewsMan;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentNewsMan FIND objNull;  
		 currentNewsMan deleteAT _pia;  
	};

	if!(_old isEqualTo  currentNewsMan) then { publicvariable "currentNewsMan"; };

	_old =  currentTrashMan;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentTrashMan FIND objNull;  
		 currentTrashMan deleteAT _pia;  
	};

	if!(_old isEqualTo  currentTrashMan) then { publicvariable "currentTrashMan"; };


	_old =  currentmailmen;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentmailmen FIND objNull;  
		 currentmailmen deleteAT _pia;  
	};

	if!(_old isEqualTo  currentmailmen) then { publicvariable "currentmailmen"; };


 
	_old =  currentTaxiDrivers;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentTaxiDrivers FIND objNull;  
		 currentTaxiDrivers deleteAT _pia;  
	};

	if!(_old isEqualTo  currentTaxiDrivers) then { publicvariable "currentTaxiDrivers"; };


	_old =  currentBusDrivers;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentBusDrivers FIND objNull;  
		 currentBusDrivers deleteAT _pia;  
	};

	if!(_old isEqualTo  currentBusDrivers) then { publicvariable "currentBusDrivers"; };


	_old =  currentlegalaid;

	for "_i" from 0 to 20 step 1 do {
		_pia =  currentlegalaid FIND objNull;  
		 currentlegalaid deleteAT _pia;  
	};

	if!(_old isEqualTo currentlegalaid) then { publicvariable "currentlegalaid"; };
