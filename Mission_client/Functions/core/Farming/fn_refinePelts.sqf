private["_n","_i","_localprotection"];
_oreArray = ["np_upelt"];
_barArray = ["np_pelt"];
_farmingVehicles = ["vvv_DOD_RamSRT_civ","VVV_Fortransi_civ","vvv_DOD_RamSRT_civ_1","VVV_Fortransi_civ_1","vvv_DOD_RamSRT_civ_2","VVV_Fortransi_civ_2"];


playSound3D ["CG_Jobs\sounds\meth\drugBoil.ogg", player, false, getPosasl player, 31, 1, 15];


if(isNil "globalProtection") then { globalProtection = 0; };
if(globalProtection != 0) exitwith { ["Error - Already processing", true] spawn domsg; };
_localProtection = 0;


_n = 0;
{
	_total = {_x == (_oreArray select _n)} count magazines player;
	_i = _total;

	while{ _i > 0 } do {

		_localProtection = _localprotection + 1;
		globalProtection = globalProtection + 1;
		if(_localProtection != globalProtection) exitwith { [1,"Refine Pelt Script"] spawn client_fnc_anticheat; };

		player removeitem (_oreArray select _n);
		player additem (_barArray select _n);
		_i = _i - 1;
		sleep 0.25;
		["You are curing pelts, stay still!", true] spawn domsg;
	};

	_n = _n + 1;

} foreach _oreArray;


if(_localProtection != globalProtection) exitwith { globalProtection = 0; };


if(typeof (vehicle player) IN _farmingVehicles && driver (vehicle player) == player) then {

	_thecargo = getmagazineCargo (vehicle player);

	clearmagazinecargo (vehicle player);

	_holder = (vehicle player);

	_process = _thecargo select 0; 
	_ItemCount = _thecargo select 1;


	if(!isnil "_process") then {
		_count = 0;
		{ 

			_localProtection = _localprotection + 1;
			globalProtection = globalProtection + 1;
			if(_localProtection != globalProtection) exitwith { [1,"Refine Pelt Script"] spawn client_fnc_anticheat; };

			_itemNumber = _ItemCount select _count;
			 if !(_x IN _oreArray) then {
				_holder addMagazineCargoGlobal [_x,_itemnumber];
				_count = _count + 1;
				uisleep 0.05;
			} else {
				_n = _oreArray FIND _x;
				_holder addItemCargoGlobal [(_barArray select _n),_itemNumber];
				_count = _count + 1;

				uisleep 1.5;
			};
		} foreach _process; 
	};
};




globalProtection = 0;