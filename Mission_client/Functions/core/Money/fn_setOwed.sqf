disableserialization;

_amount = parseNumber (ctrlText 9993);

_display = findDisplay 9999;

_status = lbData[9001,lbCurSel (9001)];
_loan = call compile format["%1", _status];

_old = _loan select 2;

_error = false;

if ((player getVariable "Mafia") < 5 && _amount < _old) then {
	_change = _old - _amount;
	_enoughCash = [1, _change] call Client_fnc_checkMoney;
	if(!_enoughCash) exitwith { _error = true; ["You need the cash to settle this loan..", true] spawn domsg; };
	[_change] call Client_fnc_removeCash;
	["mafiaBank", _amountcheck, "Add"] remoteexec ["server_fnc_setValue",2];
};

if(_error) exitwith {};

_player = call compile format["%1",(lbData[9001,(lbCurSel 9001)])];

_player = call compile format["%1",(_player select 0)];

["set","MafiaMoney",_amount] remoteExec ["client_fnc_sustain",_player];

closedialog 0;