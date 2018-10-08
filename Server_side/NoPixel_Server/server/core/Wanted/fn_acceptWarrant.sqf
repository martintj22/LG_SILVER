params["_caseID",["_approved",""],["_approvedguid",""]];

_updatestr = format ["approveCrime:%1:%2:%3:%4", 1, _approved, _approvedguid, _caseID];
_del = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

lastwanted = time; 
_type = 1;