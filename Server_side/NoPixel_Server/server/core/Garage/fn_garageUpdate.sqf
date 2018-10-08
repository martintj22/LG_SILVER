private["_licenseAlphaArray","_color"];

_player = _this select 10;
_status = _this select 9;
_garageArray = _player getvariable ["garage",[]];
_licenseAlphaArray 	= ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

if(_status == "Add") then {

	_licensePlate = _this select 0;
	_class = _this select 1;
	_color = _this select 2;
	_finish = _this select 3;
	_rims = _this select 4;
	_windows = _this select 5;
	_lights = _this select 6;
	_owner = getplayerUID _player;
	_statuses = _this select 8;

	if(_licensePlate == "Testing" || _licensePlate == "FrstCar") then {

	if(_licensePlate == "FrstCar") then {
			
			_textures = getArray(configfile >> "CfgIvoryTextures" >> "defaulttextures");
			_color = _textures call BIS_fnc_selectRandom;
	};

		_l1 = _licenseAlphaArray call BIS_fnc_selectRandom;
		_l2 = _licenseAlphaArray call BIS_fnc_selectRandom;
		_l3 = _licenseAlphaArray call BIS_fnc_selectRandom;
		_licensePlate = format["%1%2%3%4",_l1,_l2,_l3,str(round(random [1111,5555,9999]))];
		_checkstr = format ["existLicense:%1", _licensePlate];
		_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery;
		booli = (_check select 0) select 0;

		while {booli} do {
			sleep 3;

			diag_log ["license change 7x %1", _owner];

			_l1 = _licenseAlphaArray call BIS_fnc_selectRandom;
			_l2 = _licenseAlphaArray call BIS_fnc_selectRandom;
			_l3 = _licenseAlphaArray call BIS_fnc_selectRandom;
			_l4 = _licenseAlphaArray call BIS_fnc_selectRandom;
			_licensePlate = format["%1%2%3%4%5",_l1,_l2,_l3,_l4,str(round(random [111,555,999]))];
			_checkstr = format ["existLicense:%1", _licensePlate];
			_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery;
			booli = (_check select 0) select 0;
		};

	};

	_tempcar = _class createVehicleLocal [0,0,2000+random(2000)];
	_tempcar allowDamage false;
	_damage = [];
	if( count (getAllHitPointsDamage _tempcar) > 0 ) then {
		_damage = (getAllHitPointsDamage _tempcar) select 2;
	};
	deleteVehicle _tempcar;

	_newVehicle = [_licensePlate, _class, _color, _finish, _rims, _windows, _lights, _statuses, _owner, 0, 1, _damage];

	_garageArray pushback _newVehicle;
	_player setvariable ["garage",_garageArray,false];

	["garage", _newvehicle, _newvehicle] remoteExec ["client_fnc_setVariable",_player];

	_updatestr = format ["insertGarage:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12", _licensePlate, _class, _color, _finish, _rims, _windows, _lights, _owner, _statuses, 0, 1, _damage];

	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
} else {
	_status = _this select 9;
	_licensePlate = _this select 0;
	_newVehicle = _this select 1;
	_pia = _garageArray find _newVehicle;
	_garageArray deleteAt _pia;
	_updatestr = format ["deleteGarage:%1", _licensePlate];
	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
};

