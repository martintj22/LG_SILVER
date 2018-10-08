[player, "casinoVault"] remoteExec ["client_fnc_getremotevar",2];
waitUntil { !isNil "packet"; };
_casinoVault = packet;
packet = nil;

_cash = _casinoVault * (0.3 + 0.01*(count currentMobster) + 0.01*(count currentCop));

vaultTimer = vaultTimer + 3600;
publicVariable "vaultTimer";

[format["You have stolen %1 from the casino vault.", _cash call client_fnc_numberText], true] spawn domsg;

[_cash] call client_fnc_addMoneyToPlayer;
["casinoVault", _cash, "Remove",true] remoteExec["server_fnc_setValue", 2];