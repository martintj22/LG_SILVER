params[["_suspectguid",""],["_closed",""],["_closedguid",""]];

_updatestr = format ["closeBail:%1:%2:%3", _closed, _closedguid, _suspectguid];
_del = [0, _updatestr] call ExternalS_fnc_ExtDBquery;