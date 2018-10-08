params[["_suspectguid",""],["_approved",""],["_approvedguid",""]];

_updatestr = format ["removeBail:%1:%2:%3", _approved, _approvedguid, _suspectguid];
_del = [0, _updatestr] call ExternalS_fnc_ExtDBquery;