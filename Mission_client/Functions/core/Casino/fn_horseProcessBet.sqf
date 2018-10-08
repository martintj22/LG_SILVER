disableSerialization;
_index = lbCurSel (1113);
if(casinoVault < 5000) exitwith { ["Vault funds are too low.", true] spawn domsg; };
if(cantbet) exitwith { ["Race already in progress.", true] spawn domsg; };
if(isnil "MyHorseBets") then { myhorsebets = []; };
if(_index == -1) exitWith { ["You must select a horse.", true] spawn domsg; };
if(count myhorsebets > 2) exitwith { ["3 bets max per race", true] spawn domsg; };

_status = lbData[1113, _index];
_status = call compile format["%1", _status];

_odds = _status select 0;
_horse = _status select 1;

_betType = _this select 0;
_betamount = ctrlText 9331;



_betamount = call compile format["%1", _betamount];
if(_betamount > 500) exitwith { ["$500.00 is max single bet", true] spawn domsg; };


_cashcheck = [1,_betamount*(1+casinoRate/100)] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",_betamount*(1+casinoRate/100) call client_fnc_numberText], true] spawn domsg; };

[format["The horse betting cost you %1 because the fee is at %2%3.",_betamount*(1+casinoRate/100) call client_fnc_numberText, casinoRate, "%"], true] spawn domsg;

[_betamount*(1+casinoRate/100)] call Client_fnc_removeCash;

["mobsterBank", format["%1 (%2) bought %3 worth of horse betting.", name player, getplayeruid player, _betamount*(1+casinoRate/100) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

["mobsterBank", 1000*(1+casinoRate/100), "Add"] remoteexec ["server_fnc_setValue",2];




if(_bettype == 0) then {
	//betonn place
	_odds = _odds / 3;
	_betamount = _betamount + (_betamount * _odds);
} else {
	//bet on win
	_betamount = _betamount + (_betamount * _odds);
};







if(isnil "MyHorseBets") then { myhorsebets = []; };

myhorsebets pushback [_horse,_betamount,_bettype];

CLOSEDIALOG 0;