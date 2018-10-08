
diag_log "setup mayor";

_fetch = ["getValue:mayor", 2] call ExternalS_fnc_ExtDBasync;
currentMayorGUID = str(_fetch select 0 select 0);

_fetch = ["getValue:senators", 2] call ExternalS_fnc_ExtDBasync;
currentSenatorsGUID = _fetch select 0 select 0;

taxRate = ["getValue:taxRate", 2] call ExternalS_fnc_ExtDBasync;
taxRate = taxRate select 0 select 0;

publicVariable "taxRate";
publicVariable "currentMayorGUID";
publicVariable "currentSenatorsGUID";

["mayor", "currentMayorGUID"] remoteExec ["server_fnc_getValue", 2];