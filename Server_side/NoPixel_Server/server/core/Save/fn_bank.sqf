_mafiaBank = ["getValue:mafiaBank", 2] call ExternalS_fnc_ExtDBasync;
mafiaBank = _mafiaBank select 0 select 0;
publicvariable "mafiaBank";

_govtBank = ["getValue:govtBank", 2] call ExternalS_fnc_ExtDBasync;
govtBank = _mafiaBank select 0 select 0;
publicvariable "govtBank";

_bikerBank = ["getValue:bikerBank", 2] call ExternalS_fnc_ExtDBasync;
bikerBank = _mafiaBank select 0 select 0;
publicvariable "bikerbank";

_mobsterBank = ["getValue:mobsterBank", 2] call ExternalS_fnc_ExtDBasync;
mobsterBank = _mafiaBank select 0 select 0;
publicvariable "mobsterBank";

_mobsterVault = ["getValue:casinoVault", 2] call ExternalS_fnc_ExtDBasync;
casinoVault = _mobsterVault select 0 select 0;
publicvariable "casinoVault";

diag_log "banks";