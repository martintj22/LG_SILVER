params["_player",["_officer",[]]];

private ["_turntable","_holder","_time","_dir","_spawnLocation"]; 

if (!safetyloot) exitwith {};

diag_log ["retreive house: %1", _player];

_uid = getPlayerUID _player;

if(_uid in activecrates) exitwith {};
activecrates pushback _uid;

//plp_ct_SuitcaseBigBlack
//plp_ct_sack
//plp_ct_woodboxlightbig
_houseLevel = _player getvariable "houselevel";

if (count _officer > 0) then { _spawnLocation = _officer; } else { _spawnLocation = _player; };
if(_houselevel == 1) then { _holder = createVehicle ["plp_ct_SuitcaseBigBlack", ASLtoATL (AGLtoASL (_spawnLocation modeltoworld[0,2,0])) , [], 0, "can_Collide"]; _holder setVectorDirAndUp [[0,0,0],[0,0,0]]; };
if(_houselevel == 2) then { _holder = createVehicle ["plp_ct_woodboxlightmedium", ASLtoATL (AGLtoASL (_spawnLocation modeltoworld[0,3,0])), [], 0, "can_Collide"]; _holder setVectorDirAndUp [[0,0,0],[0,0,0]];  };
if(_houselevel == 3) then { _holder = createVehicle ["plp_ct_woodboxlightbig", ASLtoATL (AGLtoASL (_spawnLocation modeltoworld[0,2,0])), [], 0, "can_Collide"]; _holder setVectorDirAndUp [[0,0,0],[0,0,0]];  };


_playercontent = _player getVariable "housecontent";

_myweapons = (_playercontent select 0); 
_mymagazines = (_playercontent select 1); 
_myitems = (_playercontent select 2); 
_mybackpacks = (_playercontent select 3);


_process = _myWeapons select 0;

if(!isnil "_process") then {
_count = 0;
	{ 
	 _ItemCount = _myweapons select 1;
	 _itemNumber = _ItemCount select _count;
	 _holder addWeaponCargoGlobal [_x,_itemnumber];
	 _count = _count + 1;
	} foreach _process; 
};

_process =_myMagazines select 0; 

if(!isnil "_process") then {
	_count = 0;
	{ 
	_ItemCount = _mymagazines select 1;
	_itemNumber = _ItemCount select _count;
	  _holder addMagazineCargoGlobal [_x,_itemnumber];
	 _count = _count + 1;
	} foreach _process; 
};

_process = _myItems select 0; 

if(!isnil "_process") then {
	_count = 0;
	{ 
	_ItemCount = _myitems select 1;
	_itemNumber = _ItemCount select _count;
	 _holder addItemCargoGlobal [_x,_itemnumber];
	 _count = _count + 1;
	} foreach _process;  
};

_process = _mybackpacks select 0; 

if(!isnil "_process") then {
	_count = 0;
	{ 
	_ItemCount = _mybackpacks select 1;
	_itemNumber = _ItemCount select _count;
	 _holder addBackpackCargoGlobal [_x,_itemnumber];
	 _count = _count + 1;
	} foreach _process; 
};

_time = time + 60; 

waitUntil { 
    time > _time 
}; 

if(!isnull _holder) then {
	_weapons = getWeaponCargo _holder;
	_magazines = getMagazineCargo _holder;
	_items = getItemCargo _holder;
	_backpacks = getBackpackCargo _holder;

	_playercontent = [_weapons,_magazines,_items,_backpacks];

	_player setVariable ["housecontent",_playercontent,false];

	_updatestr = format ["updateHouse:%1:%2", _playercontent, getPlayerUID _player];
	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

	deleteVehicle _holder; 
	_pia = activecrates find _uid;
	activecrates deleteAt _pia;
};