/*
load inventory
*/
private ["_house"];

_items = _this select 0;
_position = _this select 1;
_cash = _this select 2;
_bank = _this select 3;
_bankAccount = _this select 4;
_cop = _this select 5;
_ems = _this select 6;
_garage = _this select 7;
Current_Cars = _this select 8;
phoneBackground = (_this select 9) select 0;
phoneSkin = (_this select 9) select 1;
_messages = _this select 10;
_statuses = _this select 11;

_houselevel = _this select 12;
_shopname = _this select 13;
_house = _this select 14;
_shop = _this select 15;
shopcontent = _this select 16;
mail = _this select 17;
messages = _this select 18;
_usedcarinfo = _this select 19;

_mafia = _this select 20;

_fire = _this select 21;
_legal = _this select 22;
_prisontime = _this select 23;
_prisonreason = _this select 24;
_mayor = _this select 25;
_partner = _this select 26;

_doc = _this select 27;
_biker = _this select 28;
_mobster = _this select 29;
_dmv = _this select 30;
_da = _this select 31;
_licenseArray = _this select 32;
_admin = _this select 33;


_higherup = false;

if(_mayor) then { 
	[] spawn client_fnc_mayorsetup; 
	_house = nearestObject [[9949.03,3732.87,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};


/*
if(_mafia == 10) then {

	_house = nearestObject [[9842.84,3677.44,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};

if(_mafia == 9) then {

	_house = nearestObject [[9736.28,3629.54,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};
*/
if(_cop == 10) then {
	_house = nearestObject [[9626,3578.7,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};

if(_cop == 9) then {

	_house = nearestObject [[9516.43,3526.09,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};

if(_ems == 10) then {

	_house = nearestObject [[9412.31,3479.1,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};

if(_ems == 9) then {

	_house = nearestObject [[9306.67,3430.66,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};

if(_legal == 10) then {

	_house = nearestObject [[9188.22,3371.8,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};

if(_legal == 9) then {
	_house = nearestObject [[9094.99,3324.16,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};

if(_legal == 8) then {
	_house = nearestObject [[8984.55,3274.12,0.00143814], "Land_vvv_np_maison1"]; _higherup = true;
};


//[8984.55,3274.12,0.00143814]


_count = 0;
{
	if(count current_cars == 0) exitWith {};
	
	_newusedcarinfo = _usedcarinfo select _count;
	(current_cars select _count) setvariable ["information",_newusedcarinfo,false];
	_count = _count + 1;
} foreach current_cars;

Shared_Cars = [];

player setVariable ["cashinhand", _cash, false];
player setVariable ["cashinbank", _bank, false];
player setVariable ["bankAccount", _bankAccount, false];

player setVariable ["cop", _cop, false];
player setVariable ["ems", _ems, false];
player setVariable ["fire", _fire, false];


player setVariable ["mafia", _mafia, false];
player setVariable ["biker", _biker, false];
player setVariable ["mobster", _mobster, false];

player setVariable ["doc", _doc, false];

player setVariable ["dmv", _dmv, false];
player setVariable ["da", _da, false];

player setVariable ["legal", _legal, false];

player setVariable ["garage", _garage, false];
player setVariable ["messages", _messages, false];
player setVariable ["statuses", _statuses, false];

player setVariable ["da", _da, false];


myoffice = [0,0,0];
player setVariable ["houselevel", _houselevel, false];

deletemarkerlocal "myhouse";

_marker = createMarkerLocal ["myhouse", _house];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "Empty";
_marker setMarkerTextLocal "My House";


_marker = createMarkerLocal [getPlayerUID player, _shop];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "Empty";
_marker setMarkerTextLocal format["%1 - CLOSED", _shopname];


player setVariable ["shopname", _shopname, false];

client_level_array = (_statuses select 0);

/*
client_level_default = (client_level_array select 0);
client_level_fedex = (client_level_array select 1);
client_level_security = (client_level_array select 2);
client_level_radio = (client_level_array select 3);
client_level_towtruck = (client_level_array select 4);
client_level_garbage = (client_level_array select 5);
client_level_news = (client_level_array select 6);
client_level_repairman = (client_level_array select 7);
client_level_farming = (client_level_array select 8);
client_level_taxi = (client_level_array select 9);
client_level_meth = (client_level_array select 10);
client_level_accuracy = (client_level_array select 11);
client_level_sway = (client_level_array select 12);
client_level_movement = (client_level_array select 13);
client_level_strength = (client_level_array select 14);
client_level_weed = (client_level_array select 15);
*/

client_hunger = (_statuses select 1);
client_thirst = (_statuses select 2);
client_battery = (_statuses select 3);
client_poop = (_statuses select 4);

myhealth = (_statuses select 5); 

client_unhealthiness = (_statuses select 6);

_myInjuries = (_statuses select 7);

licenseArray = _licenseArray;

adminLevel = _admin;

player setVariable ["playerInjuries", _myInjuries, true];

_drugEffects = (_statuses select 10);

client_marijuana = _drugEffects select 0;
client_cocaine = _drugEffects select 1;
client_meth = _drugEffects select 2;
client_heroin = _drugEffects select 3;
client_energy = _drugEffects select 4;
client_drunk = 0;
client_donuts = 0;
//player name // amount // reasoning
loan = (_statuses select 11);
moneyOwed = (_statuses select 11) select 1;

//do prison shit here

if(_prisontime > 0) then {
	[_prisontime,_prisonreason] spawn client_fnc_jailsetup;
} else {

if(_higherup) exitwith { 
	[player,"house",_house] remoteexec ["server_fnc_setvariable",2]; _house = getpos _house; player setpos _house; 

	{
		if( getplayeruid _x == _partner && (_x getvariable "housepartner") == getplayeruid player ) then { _x setvariable ["house",_house,false]; [_house] remoteexec ["client_fnc_updatehousePos",_x]; };
	} foreach allplayers;

};


	if(_houselevel == 1) then {
		_nObject = nearestObjects [_house, ["Land_ivory_trailer_04","Land_ivory_trailer_01","Land_ivory_trailer_02","Land_ivory_trailer_03","Land_ivory_trailer_06","Land_ivory_trailer_05","Land_vvv_np_maison1"], 30];  
		_containerpos = (_nobject select 0) getrelpos [8,0]; 
		player setpos _containerpos;
	};

	if(_houselevel == 2) then {
		_nObject = nearestObjects [_house, ["Land_Ranch_DED_Ranch_02_F","Land_Ranch_DED_Ranch_01_F","Land_HouseC_R","Land_HouseC1_L","Land_HouseA1_L","Land_HouseB1_L","Land_vvv_np_maison1"], 30];   
		_containerpos = (_nobject select 0) getrelpos [15,0];  
		player setpos _containerpos;
	};

	if(_houselevel == 3) then {
		_nObject = nearestObjects [_house, ["Land_HouseDoubleAL","Land_HouseDoubleAL2","Land_vvv_np_maison1"], 30];   
		_containerpos = (_nobject select 0) getrelpos [15,0];  
		player setpos _containerpos;
	};


};

//if( !(_position isEqualTo [0,0,0]) ) then { player setpos _position; };


myhouse = _house;
myshop = _shop;

removeAllItems player;
removeAllContainers player;
removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

[player] spawn client_fnc_destroyGroundHolders;

player setunitloadout _items;

// player select here
if((_statuses select 9) == 0) then {
	[] spawn client_fnc_playerselect;
	[] spawn {

		"dynamicBlur" ppEffectEnable true; /* enables ppeffect */
		"dynamicBlur" ppEffectAdjust [0]; /* intensity of blur */
		"dynamicBlur" ppEffectCommit 25; /* time till vision is fully blurred */
		uisleep 27;
		"dynamicBlur" ppEffectEnable false;	
		
	};
} else {
	if((_statuses select 9) == 1) then { 
		Female = true;
	} else { Female = false; };
	player setVariable["loaded", 1, false];	
	[] spawn {
		"dynamicBlur" ppEffectEnable true; /* enables ppeffect */
		"dynamicBlur" ppEffectAdjust [0]; /* intensity of blur */
		"dynamicBlur" ppEffectCommit 5; /* time till vision is fully blurred */
		uisleep 5;
		"dynamicBlur" ppEffectEnable false;	
	};
};

player setUnitRecoilCoefficient 1.75;

if(client_marijuana > 0) then { player setCustomAimCoef 0; };

if(client_cocaine > 0) then { player setAnimSpeedCoef 1.2; };

if(client_heroin > 0) then { player setUnitRecoilCoefficient 0.5; };

if(client_energy > 0) then {
	player enablefatigue false;
	player enablestamina false;
};


















