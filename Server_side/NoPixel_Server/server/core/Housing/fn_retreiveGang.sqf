private ["_turntable","_holder","_time","_dir","_stashId"]; 

if (!safetyloot) exitwith {};

_player = _this select 0;
_myJob = _this select 1;

diag_log ["retreive gang of: %1 %2", _player, _myJob];



if(_uid in activecrates) exitwith { ["Already in use",FALSE] remoteexec ["DOMSG",_player]; };
if(isnil "gangstasharray") then { gangstasharray = []; };
if(_myjob IN gangStashArray) exitwith { ["Already in use",FALSE] remoteexec ["DOMSG",_player]; };

gangstasharray pushback _myjob;
activecrates pushback _uid;

_holder = createVehicle ["np_HighSecContBlack", ASLtoATL (AGLtoASL (_player modeltoworld[0,4,1])), [], 0, "can_Collide"];
_holder setVectorUp [0,0,1];
_holder setDir (getDir _player);

_playercontent = (call compile format["%1Stash", _myJob]);

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

	[format["%1Stash",_myJob], _playercontent] spawn server_fnc_setValue; 

	deleteVehicle _holder; 
	_pia = activecrates find _uid;
	activecrates deleteAt _pia;
	_pia = gangstasharray FIND _myjob;
	gangstasharray DELETEAT _pia;
};