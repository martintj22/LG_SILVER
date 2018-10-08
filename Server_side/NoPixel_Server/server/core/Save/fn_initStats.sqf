_player = _this select 0;
_uid = getPlayerUID _player;
_checkstr = format ["existPlayerInfo:%1", _uid];
_check = [0, _checkstr] call ExternalS_fnc_ExtDBquery;
_booli = (_check select 0) select 0;

diag_log ["init stats %1", _uid];


if (_booli) then {

	_fetchstr = format ["getMessages:%1", _uid];
	_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
	_returned = str _fetch;
	_phonemessages = _fetch;	

	_fetchstr = format ["getMail:%1", _uid];
	_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
	_returned = str _fetch;
	_mail = _fetch;

	_fetchstr = format ["getGarage:%1", _uid];
	_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
	_returned = str _fetch;
	_garage = _fetch;
	
	_fetchstr = format ["getLicenses:%1", _uid];
	_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
	_licenseArray = _fetch apply {_x select 0};

	_fetchstr = format ["playerInfo:%1", _uid];
	_fetch = [_fetchstr, 2] call ExternalS_fnc_ExtDBasync;
	_returned = str _fetch;

	_res = _fetch select 0;

	_items = _res select 0;

	_cash = _res select 1;
	_bank = _res select 2;
	_cop = _res select 3;
	_ems = _res select 4;
	_position = _res select 5;
	_bankAccount = _res select 6;
	_phoneBackground = _res select 7;
	_messages = _res select 8;
	_statuses = _res select 9;


	if(isNil "_statuses") then { _statuses = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],100,100,100,0,0,0,[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0],0,[0,0,0,0,0],["nobody",0,"no reason","NO DATE"],[_uid,"0"],0]; };

	///////////////////////////////////////////////////////// REMOVE AFTER WIPE ////////////////////////////////////////////////////////////

	if(count _statuses == 13) then {
		_statuses pushBack 0; // tax
	};
	
	if(count (_statuses select 0) == 17) then {
		(_statuses select 0) pushBack 0; // tax
	};
	
	if(count (_statuses select 0) == 18) then {
		(_statuses select 0) pushBack 0; // bail
	};

	if( (((_statuses select 0) select 16) + ((_statuses select 0) select 17)) > _cash ) then {
		(_statuses select 0) SET [16,_cash];
	};
	
	///////////////////////////////////////////////////////// REMOVE AFTER WIPE ////////////////////////////////////////////////////////////

	_checkMarriage = _statuses select 12;

	_moneyOwed = (_statuses select 11) select 1;

	if(_moneyOwed > 0) then {
		MafiaLoan1 pushback _player;
		MafiaLoan2 pushback (_statuses select 11);
	};

	_houselevel = _res select 10;
	_housecontent = _res select 11;
	_shopcontent = _res select 12;
	_shopname = _res select 13;
	_mafia = _res select 14;
 




	_fire = _res select 15;

	_legal = _res select 16;
	_prison = _res select 17;
	_prisonreason = _res select 18;



	_doc = _res select 19;
	_biker = _res select 20;
	_mobster = _res select 21;
	_dmv = _res select 22;
	_da = _res select 23;
	_admin = _res select 24;



	_player setvariable ["getunitloadout",_items,false];
	_player setVariable ["cashinhand", _cash, false];
	_player setVariable ["cashinbank", _bank, false];
	_player setVariable ["bankAccount", _bankAccount, false];
	_player setVariable ["cop", _cop, false];
	_player setVariable ["ems", _ems, false];
	_player setVariable ["mafia", _mafia, false];

	_player setVariable ["doc", _doc, false];
	_player setVariable ["biker", _biker, false];
	_player setVariable ["mobster", _mobster, false];
	_player setVariable ["dmv", _dmv, false];
	_player setVariable ["da", _da, false];

	_player setVariable ["fire", _fire, false];
	_player setVariable ["legal", _legal, false];
	_player setVariable ["garage", _garage, false];
	_player setVariable ["phoneBackground", _phoneBackground, false];
	_player setVariable ["messages", _messages, false];
	_player setVariable ["statuses", _statuses, false];
	_player setVariable ["houselevel", _houselevel, false];
	_player setVariable ["housecontent", _housecontent, false];
	_player setVariable ["shopcontent", _shopcontent, false];

	_inUseVehicles = [];
	_mycarinfo = [];
	if(!isNil {GarageVariableWhore getVariable (getplayerUID _player)}) then {
		_inUseVehicles = GarageVariableWhore getVariable (getplayerUID _player);

		{
			private["_info","_licensematch"];


			_info = _x getvariable ["information",[]];
			if( count _info == 0 ) exitWith {};

			_licensematch = (_info select 0);
			{
				_licensematchcurrent = (_x select 0);
				if( _licensematch == _licensematchcurrent) then {

					_mycarinfo pushback _info;
					_garage deleteAt _foreachindex;

				};

			} foreach _garage;

		} foreach _inUseVehicles;
	};

	_mayor = false;

	if(_uid == currentMayorGUID) then { _mayor = true; theMayor = _player; };
	if(_mayor) then { _houselevel = 3; _player setVariable ["houselevel", _houselevel, false]; };

	_house = [0,0,0];

	if(_houseLevel == 1) then {
		_house = tier1housing call BIS_fnc_selectRandom;	
		_pia = tier1housing find _house;
		tier1housing deleteAt _pia;
	};

	if(_houseLevel == 2) then {
		_house = tier2housing call BIS_fnc_selectRandom;
		_pia = tier2housing find _house;
		tier2housing deleteAt _pia;
	};

	if(_houseLevel == 3) then {
		_house = tier3housing call BIS_fnc_selectRandom;	
		_pia = tier3housing find _house;
		tier3housing deleteAt _pia;
	};

	_shop = shops call BIS_fnc_selectRandom;	
	_pia = shops find _shop;
	shops deleteAt _pia;

	_partner = (_statuses select 12);

	_partner = [_uid,"0"];
	
	_partner = (_partner select 1);

	if(isNil "_partner") then { _partner = 0; };

	_player setvariable ["housepartner",_partner,true];

	{
		if( getplayeruid _x == _partner && _x getvariable "houselevel" == 3 && (_x getvariable "housepartner") == getplayeruid _player ) then { diag_log "Friends house found!"; _house = _x getvariable "house"; };
		if( getplayeruid _x == _partner && _x getvariable "houselevel" != 3 && (_x getvariable "housepartner") == getplayeruid _player ) then { diag_log "Sent new house to friend!"; _x setvariable ["house",_house,false]; _house remoteexec ["client_fnc_updatehousePos",_x]; };
	} foreach allplayers;

	_player setVariable ["house", _house, false];
	_player setVariable ["shop", _shop, false];
	_house setVariable ["house", _player, false];
	_shop setVariable ["shop", _player, false];

	[_items, _position, _cash, _bank, _bankAccount, _cop, _ems, _garage, _inUseVehicles, _phoneBackground, _messages, _statuses, _houselevel, _shopname, (getpos _house), (getpos _shop), _shopcontent, _mail, _phonemessages, _mycarinfo, _mafia, _fire, _legal, _prison, _prisonreason,_mayor,_partner,_doc,_biker,_mobster,_dmv,_da,_licenseArray,_admin] remoteexec ["Client_fnc_loadInventory", _player]; 

} else {

	_name = name _player;
	_items = getunitloadout _player;
	_cash = 100;
	//_bank = 1500;
	_bank = 2000;
	_cop = 0;
	_ems = 0;
	_mafia = 0;
	_fire = 0;
	_legal = 0;
	_doc = 0;
	_biker = 0;
	_mobster = 0;
	_dmv = 0;
	_da = 0;
	_admin = 0;
	_prison = 0;
	_prisonreason = "none";
	_position = [0,0,0];
	_phoneBackground = [80001,1];
	_messages = [];
	_statuses = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],100,100,100,0,0,0,[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],0,[0,0,0,0,0],["nobody",0,"no reason","NO DATE"],[_uid,"0"],0];
	_houselevel = 1;
	_housecontent = [[[],[]],[[],[]],[[],[]],[[],[]]];
	_shopcontent = [[[],[],[]],[[],[],[]],[[],[],[]],[[],[],[]]];


	_shopname = format["%1's Store", _name];
	_insertstr = format ["insertPlayerInfo:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18:%19:%20:%21:%22:%23:%24:%25:%26", _uid, _name, _items, _cash, _bank, _cop, _ems, _position, _phoneBackground, _messages, _statuses, _houselevel, _housecontent, _shopcontent, _shopname, _mafia, _fire, _legal, _prison, _prisonreason,_doc,_biker,_mobster,_dmv,_da,_admin];
	_insert = [0, _insertstr] call ExternalS_fnc_ExtDBquery;

	/*
	_insertstr = format ["insertMail:%1:%2:%3:%4", format["Hello %1. As you may have already known, Silver Lake is currently at a war with the United States of America ever since we have seceded. Thus, we regret to announce that American spies infiltrated our country and destroyed much of our data including text messages, any stored emails, and bank accounts. As an apology, we have credited all citizens $500,000.00. We are trying to negotiate peace but the belligerent country has no intent to cooperate. There have been rumors of destruction of our newly formed nation. We urge you to remain calm at all times and to remain civil as the United States Navy is occupying our Harbors. Thank you and good luck. - Mayor.",name _player], "Announcement", "Silver Lake", getplayeruid _player];
	_insert = [0, _insertstr] call ExternalS_fnc_ExtDBquery;

	_insertstr = format ["insertMessage:%1:%2:%3:%4", "Hi, this is your first text message, welcome to the Silver Lake Verizon network!", format ["SMS from %1", name _player], "Verizon", getplayeruid _player];
	_insert = [0, _insertstr] call ExternalS_fnc_ExtDBquery;
	*/

	_testing = getplayeruid _player;

	if(isnil "_testing") exitwith { };

	
	[_player] spawn Server_fnc_initStats;

	_startercars = ["ivory_190e","VVV_Chevrolet_Camaro_RS","VVV_Aston_Martin_Cygnet","VVV_Abarth_500","ivory_gti","VVV_Abarth_695","VVV_Chevrolet_Bel_Air"];
	_class = selectRandom _startercars;
	//add a test car for every spawn!
	_Color = "black"; _finish = "glossy"; _rims = "default"; _windows = 0; _Lights = 0; _owner = getplayeruid _player; _licensePlate = "FrstCar"; _statuses = 1; 
	[_licensePlate, _class, _color, _finish, _rims, _windows, _lights, _owner, _statuses, "Add", _player] spawn Server_fnc_garageUpdate;

};