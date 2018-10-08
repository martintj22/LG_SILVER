// this is where we open the shop that we are looking at
private["_status","_lostprice"];
disableSerialization;

_typebuy = _this select 0;

_index = lbCurSel (9001);
if (_index == -1) exitWith {};
_status = lbData[9001, _index];
_status = call compile format["%1", _status];

_quantity = ctrlText 9339;
_quantity = call compile format["%1", _quantity];

_item = _status select 0;
_itemName = _status select 1;
_cost = _status select 2;
_type = _status select 3;

if(isNil "_status") exitwith {};
if(isNil "_quantity") then { _quantity = 1; };
if(_quantity < 0) exitwith {};
 
_cost = call compile format["%1", (_status select 2)];

_totalprice = _cost * _Quantity;

if(_totalprice == 0 || _totalprice < 0) exitwith { ["You can not purchase an item that costs $0.00", true] spawn domsg; };
_error = false;

if(_typebuy == "fish") then {
	_rarefish = {_x IN ["Fish_Mackerel_7", "Fish_Tuna_7", "Fish_Trout_Rare", "Fish_Shark_Rare"]} count magazines player;
	if(_rarefish < _totalprice) exitwith { ["Not enough Fish!", true] spawn domsg; _error = true; };
};



if(_typebuy == "standard") then {
	_cashcheck = [1,_totalprice] call client_fnc_checkmoney;
	if!(_cashCheck) then { [format["%1 - You do not have enough money to pay for this!",_totalprice call client_fnc_numberText], true] spawn domsg; _error = true; };	
};

if(_error) exitwith {};




player allowdamage false;

if(isNil "shopholder") then {
	shopholder = "plp_ct_woodboxlightbig" createVehicleLocal (getpos player);  
};
player disablecollisionwith shopholder;
shopholder setpos (getposATL player);	


player allowdamage true;

switch (_type) do {
    case 1: { shopholder addWeaponCargoGlobal [_item,_quantity]; };
    case 2: { shopholder addMagazineCargoGlobal [_item,_quantity]; };
    case 3: { shopholder addItemCargoGlobal [_item,_quantity]; };
    case 4: { shopholder addBackpackCargoGlobal [_item,_quantity]; };   
};

if(_typebuy == "fish") then {
	_rarefish1 = {_x == "Fish_Trout_Rare"} count magazines player;
	_rarefish2 = {_x == "Fish_Shark_Rare"} count magazines player;
	_rarefish3 = {_x == "Fish_Mackerel_7"} count magazines player;
	_rarefish4 = {_x == "Fish_Tuna_7"} count magazines player;

	while { _rarefish1 > 0 } do {
		if(_totalprice == 0) exitwith {};
		player removeitem "Fish_Trout_Rare";
		_rarefish1 = _rarefish1 - 1;
		_totalprice = _totalprice - 1;
		uisleep 0.05;
	};

	while { _rarefish2 > 0 } do {
		if(_totalprice == 0) exitwith {};
		_rarefish1 = _rarefish1 - 1;
		_totalprice = _totalprice - 1;	
		player removeitem "Fish_Shark_Rare";	
		uisleep 0.05;
	};

	while { _rarefish3 > 0 } do {
		if(_totalprice == 0) exitwith {};
		_rarefish1 = _rarefish1 - 1;
		_totalprice = _totalprice - 1;	
		player removeitem "Fish_Mackerel_7";	
		uisleep 0.05;
	};

	while { _rarefish4 > 0 } do {
		if(_totalprice == 0) exitwith {};
		_rarefish1 = _rarefish1 - 1;
		_totalprice = _totalprice - 1;	
		player removeitem "Fish_Tuna_7";	
		uisleep 0.05;
	};	

	playSound3D ["vvv_fishingrod\sounds\splash.ogg", player, false, getPosASL player, 5, 1, 45];
};
if(_typebuy == "standard") then {
	_lostprice = _status select 5;
	if(_lostprice > 0) then {
		if(isNil "taxpayments") then { taxpayments = 0; };
		if(taxpayments == 0) then { taxpayments = taxpayments + _lostprice;	["govtBank", _lostprice, "Add"] remoteExec["server_fnc_setValue",2]; } else { taxpayments = taxpayments + _lostprice; };
	};

	[_totalPrice] call Client_fnc_removeCash;
	["govtBank", _totalPrice-(_totalPrice/(1+taxRate/100)), "Add"] remoteExec["server_fnc_setValue",2];
	["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, (_totalPrice-(_totalPrice/(1+taxRate/100))) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];
};

if(_item IN  ["np_tequila","murshun_cigs_lighter","murshun_cigs_cigpack"]) then {
	["bikerBank", _totalPrice, "Add"] remoteexec ["server_fnc_setValue",2];
};

[format["You bought %1 of %2 for %3 - check the box at your feet.",_quantity, _item, _totalprice call client_fnc_numberText],true] spawn domsg;

_totalTickets = 0;
_handle = false;
if(isNil "wantedTimer") then { wantedTimer = time-301; };
if (time >= wantedTimer + 300 && count currentMarshals > 0) then {
    if( ((player getVariable 'statuses') select 13 >= 1000) || myTickets > 2000 || myWarrants > 0) then {

        _nearest = currentMarshals apply {[player distance getPos _x, _x]};
        _nearest sort true;
        _nearest = (_nearest select 0) select 1;

        [getPos player, "Spotted Wanted Person", "Location", currentMarshals] remoteExec ["client_fnc_hudHelper", _nearest];
        wantedTimer = time;
        [format["Dispatch to %1: A wanted person has been spotted at %2 buying items.", _nearest getVariable "badgeNumber", mapGridPosition getPos player], true] remoteExec ["domsg",currentMarshals];
                
    };
};