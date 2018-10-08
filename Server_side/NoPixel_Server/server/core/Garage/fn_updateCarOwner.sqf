_plate = _this select 0;
_uid = _this select 1;

_updatestr = format ["updateCarUID:%1:%2", _uid, _plate];
_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;