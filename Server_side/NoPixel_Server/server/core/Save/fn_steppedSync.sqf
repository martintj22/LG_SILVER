params ["_player", "_id", "_uid", "_name","_loadout"];


player setvariable ["getunitloadout",_loadout,false];
_statuses = _player getVariable "statuses";
if(isNil "_statuses") exitwith { };

_phoneBackground = _player getVariable "phoneBackground";
_messages = _player getVariable "messages";

_house = _player getVariable "house";
_shop = _player getVariable "shop";

_houselevel = _player getVariable "houselevel";

_housecontent = _player getVariable "housecontent";

_shopcontent = _player getVariable "shopcontent";

_cash = [(_player getVariable "cashinhand"), 1, 2, false] call CBA_fnc_formatNumber;
_bank = [(_player getVariable "cashinbank"), 1, 2, false] call CBA_fnc_formatNumber;

_position = position _player;

_syncInfo = _player getVariable "sync";

if(isNil "_syncInfo") then { _syncinfo = 1; };

_exit = false;




if(uniform _player IN ["vvv_traje_policia_3","silver_lake_police","silver_lake_fbi","silver_lake_statepolice","nopixel_character_swat","vvv_traje_bombero_2","female_police","female_ems","CUP_U_C_Fireman_01"]) then { _syncinfo = 0; };


if(_syncInfo == 0 || _player in CurrentCop || _player in currentEMS || _player IN currentDoc ) then {

	_updatestr = format ["updatePlayerInfoNoGear:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11", _cash, _bank, _position, _messages, _statuses, _housecontent, _shopcontent, _phonebackground, _houselevel, _name, _uid];
	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;


} else {

	_updatestr = format ["updatePlayerInfo:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12", _loadout, _cash, _bank, _position, _messages, _statuses, _housecontent, _shopcontent, _phonebackground, _houselevel, _name, _uid];
	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

};




