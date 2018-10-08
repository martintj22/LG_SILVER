
diag_log "setup gang stash";

_mafiaStash = ["getValue:mafiaStash", 2] call ExternalS_fnc_ExtDBasync;
mafiaStash = _mafiaStash select 0 select 0;
publicVariable "mafiaStash";

_bikerStash = ["getValue:bikerStash", 2] call ExternalS_fnc_ExtDBasync;
bikerStash = _bikerStash select 0 select 0;
publicVariable "bikerStash";

_mobsterStash = ["getValue:mobsterStash", 2] call ExternalS_fnc_ExtDBasync;
mobsterStash = _mobsterStash select 0 select 0;
publicVariable "mobsterStash";
