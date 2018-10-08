params["_type","_description"];

_updatestr = format ["newLog:%1:%2", _type, _description];
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;