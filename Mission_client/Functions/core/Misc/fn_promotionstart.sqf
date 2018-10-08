private["_display","_list","_i","_EMS","_Cop","_Mafia","_mobster","_biker","_Marshal","_doc","_dmv","_da"];

_level = _this select 0;

//Cop - EMS - Mafia - Fire
disableSerialization;
_max = 0;

_EMS = player getvariable "EMS";
_Cop = player getvariable "Cop";
_Mafia = player getvariable "Mafia";
_Mobster = player getvariable "Mobster";
_biker = player getvariable "biker";
_legal = player getvariable "legal";
_doc = player getvariable "doc";
_dmv = player getvariable "dmv";
_da = player getvariable "da";

if(myJob == "doc" && _doc < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "Cop" && _cop < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "EMS" && _ems < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "Mafia" && _Mafia < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "Biker" && _Biker < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "Mobster" && _Mobster < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "Legal" && _legal < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "DMV" && _dmv < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };
if(myJob == "DA" && _da < 6) exitwith { ["You must be rank 6+ to promote people", true] spawn domsg; };

if(myJob == "Cop") then { _max = _cop; };
if(myJob == "EMS") then { _max = _EMS; };
if(myJob == "Mafia") then { _max = _Mafia; };
if(myJob == "Biker") then { _max = _Biker; };
if(myJob == "Mobster") then { _max = _Mobster;  };
if(myJob == "doc") then { _max = _doc; };
if(myJob == "Legal") then { _max = _legal;  };
if(myJob == "DA") then { _max = _da; };

if(_max <= _level) exitWith { ["You can't promote somebody higher or equal to you.", true] spawn domsg; };

createdialog "promotion";

_display = findDisplay 5111;
_list = _display displayCtrl 911;

lbClear _list;
_i = 0;

while{_i < _max} do {
	if(_i == 0) then { 
		_list lbAdd "Remove";
	} else {
		_list lbAdd format["RANK: %1", _i];
	};
	_list lbSetdata [(lbSize _list)-1,str(_i)];
	_i = _i + 1;

	if ( _max <= 7 && _i == 2 && !(myJob IN ["Cop","doc","EMS"]) ) exitWith {};
};