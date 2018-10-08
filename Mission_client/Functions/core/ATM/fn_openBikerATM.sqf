disableSerialization;
params["_player"];

[bikerBank, {
	params["_bank"];

	createDialog "ATMBiker";

	_bank = _bank call client_fnc_numberText;
	ctrlSetText [1002, _bank];

	_cash = (player getVariable "cashinhand") - (client_level_array select 16); 
	_cash = _cash call client_fnc_numberText;
	ctrlSetText [1004, _cash];

}] remoteExec["bis_fnc_spawn",_player];