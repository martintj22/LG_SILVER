params["_suspectguid","_closer","_closerguid"];

_updatestr = format ["updateCrimeRemove:%1:%2:%3", _closer, _closerguid, _suspectguid];
_del = [0, _updatestr] call ExternalS_fnc_ExtDBquery;