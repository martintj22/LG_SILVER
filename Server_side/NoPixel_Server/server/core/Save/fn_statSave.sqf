params ["_player", "_id", "_uid", "_name"];

diag_log ["%1 %2 %3 %4", _player, _id, _uid, _name];

_statuses = _player getVariable "statuses";
if(isNil "_statuses") exitwith { };

_items = _player getVariable "getunitloadout";

_phoneBackground = _player getVariable "phoneBackground";
_messages = _player getVariable "messages";

_house = _player getVariable "house";
_shop = _player getVariable "shop";

_shop setVariable ["shop",nil,false];
shops pushback _shop;


_houselevel = _player getVariable "houselevel";

if(_houseLevel == 1) then {
	tier1housing pushback _house;
};
if(_houseLevel == 2) then {
	tier2housing pushback _house;
};
if(_houseLevel == 3) then {
	tier3housing pushback _house;
};
	


_housecontent = _player getVariable "housecontent";
_shopcontent = _player getVariable "shopcontent";


deletemarker format["%1",_uid];

_cash = [(_player getVariable "cashinhand"), 1, 2, false] call CBA_fnc_formatNumber;
_bank = [(_player getVariable "cashinbank"), 1, 2, false] call CBA_fnc_formatNumber;

_position = position _player;

_syncInfo = _player getVariable "sync";
if(isNil "_syncInfo") then { _syncinfo = 1; };

if(uniform _player IN ["vvv_traje_policia_3","silver_lake_police","silver_lake_fbi","silver_lake_statepolice","nopixel_character_swat","vvv_traje_bombero_2","female_police","female_ems","CUP_U_C_Fireman_01"]) then { _syncinfo = 0; };

_exit = false;
if(_syncInfo == 0 || _player in CurrentCop || _player in currentEMS || _player IN currentDoc) then {
	_updatestr = format ["updatePlayerInfoNoGear:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11", _cash, _bank, _position, _messages, _statuses, _housecontent, _shopcontent, _phonebackground, _houselevel, _name, _uid];
	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
	_exit = true;
} else {

	_updatestr = format ["updatePlayerInfo:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12", _items, _cash, _bank, _position, _messages, _statuses, _housecontent, _shopcontent, _phonebackground, _houselevel, _name, _uid];
	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

};

if (_exit) exitwith { deleteVehicle _player; };

if(_houseLevel == 1) then {
	tier1housing pushback _house;
};

if(_houseLevel == 2) then {
	tier2housing pushback _house;
};

if(_houseLevel == 3) then {
	tier3housing pushback _house;
};

[] spawn server_fnc_refreshjobs;

_playeroffice = _player getVariable "office";

if(!isNil "_playerOffice") then {
	_pia = rentedshops FIND _playeroffice;
	rentedshops DELETEAT _pia;
	deletemarker format["%1OFFICE",_uid];
};

if(isNil "racecontestents") then { racecontestents = []; };
_pia = racecontestents FIND _player; 
racecontestents DELETEAT _pia;

deleteVehicle _player;

_pia = MafiaLoan1 FIND _player;

if(_pia != -1) then {
	MafiaLoan1 DELETEAT _pia;
	MafiaLoan2 DELETEAT _pia;
};



_player setvariable ["getunitloadout",nil,false];
_player setVariable ["sync", nil, false];
_player setVariable ["cashinhand", nil, false];
_player setVariable ["cashinbank", nil, false];
_player setVariable ["bankAccount", nil, false];
_player setVariable ["cop", nil, false];
_player setVariable ["ems", nil, false];
_player setVariable ["mafia", nil, false];

_player setVariable ["biker", nil, false];
_player setVariable ["mobster", nil, false];

_player setVariable ["doc", nil, false];
_player setVariable ["marshal", nil, false];
_player setVariable ["dmv", nil, false];



_player setVariable ["legal", nil, false];
_player setVariable ["garage", nil, false];
_player setVariable ["phoneBackground", nil, false];
_player setVariable ["messages", nil, false];
_player setVariable ["statuses", nil, false];
_player setVariable ["houselevel", nil, false];
_player setVariable ["housecontent", nil, false];
_player setVariable ["shopcontent", nil, false];
_player setVariable ["house", nil, false];
_player setVariable ["office", nil, false];
_player setVariable ["shop", nil, false];