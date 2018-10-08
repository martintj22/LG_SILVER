//[] spawn client_fnc_spreaddisease;
_myInjuries = player getVariable "playerInjuries";
_spread = _myinjuries select 10;

_nearest = player nearEntities ["man", 30]; 
[player] remoteexec ["client_fnc_vomit",_nearest];

[_spread] remoteexec ["client_fnc_givedisease",cursorobject];