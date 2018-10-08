_number = param [0,0,[0]]; 

_numberText = "$";
_numberText = _numberText + ([_number, 1, 2, true] call CBA_fnc_formatNumber);

_numberText