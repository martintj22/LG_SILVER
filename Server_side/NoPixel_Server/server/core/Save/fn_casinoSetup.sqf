
casinoRate = ["getValue:casinoRate", 2] call ExternalS_fnc_ExtDBasync;
casinoRate = casinoRate select 0 select 0;
casinoOpen = true;

publicVariable "casinoRate";
publicVariable "casinoOpen";

