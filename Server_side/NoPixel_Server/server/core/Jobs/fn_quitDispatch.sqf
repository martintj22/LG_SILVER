_player = _this select 0;

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
	publicvariable "currentMedicDispatch";
};

if (_player IN currentFireDispatch) then { 
	_pia = currentFireDispatch find _player;
	currentFireDispatch deleteAt _pia;
	publicvariable "currentFireDispatch";
};