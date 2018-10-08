disableSerialization;
createDialog "DirtyMoney";

_bankAccount = format ["ATM # Account:%1", str (player getVariable "bankAccount")]; 
ctrlSetText [1000, _bankAccount];

_bank = (client_level_array select 17); 
_bank = _bank call client_fnc_numberText;

ctrlSetText [1002, _bank];

_cash = (client_level_array select 16); 
_cash = _cash call client_fnc_numberText;
ctrlSetText [1004, _cash];