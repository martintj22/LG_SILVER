_tax = _this select 0;

_updatestr = format ["setValue:%1:%2", _tax, "taxRate"];
taxRate = [0, _updatestr] call ExternalS_fnc_ExtDBquery;
taxRate = _tax;

publicVariable "taxRate";