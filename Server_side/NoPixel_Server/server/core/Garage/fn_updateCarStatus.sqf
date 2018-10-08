//License to check in db - status, 1 is available 0 not - object being the vehicle, player the player who owns the vehicle.
//["who cares",0,cursorobject,player] remoteExec ["Server_fnc_updateCarStatus",2];
//[_license,1,_vehicle,player] remoteExec ["Server_fnc_updateCarStatus",2];

_license = _this select 0;
_status = _this select 1;
_object = _this select 2;
_player = _this select 3;
_testplayer = _player;
_information = _object getvariable "information";


[((getAllHitPointsDamage _object) select 2),fuel _object,_license] remoteexec ["server_fnc_updateCarDamages",2];


_exit = false;
if(_status == 0) then {
	_license = _information select 0;
	_carowner = _information select 8;

	if(isNil "_carowner") exitwith {
		_exit = true;
	};

	_player = _carowner call BIS_fnc_getUnitByUid;

	deletevehicle _object; 
};
if(_exit) exitwith { 
	{ deletevehicle _x; } foreach attachedobjects _object;
	deletevehicle _object;  
};


_updatestr = format ["updateCarStatus:%1:%2", _status, _license];
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

//its being impouned here
if(_status == 0) then {
	if(_testplayer == _player) exitwith {deletevehicle _object; };
	_information SET [7,0];

	["garage", _information] remoteExec ["client_fnc_setVariable",_player];

	deletevehicle _object; 
} else {
	_information SET [7,1];
	_currentCars = _player getvariable "usedgarage";
	_currentCars pushback _information;
	_player setvariable ["usedgarage",_currentCars,false];
};