_houseLevel = player getvariable "houselevel";

_cashcheck = [1,225000] call client_fnc_checkmoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",225000 call client_fnc_numberText], true] spawn domsg; };	

if( ((player getvariable "cashinhand") - 225000) < (client_level_array select 16) ) exitWith {
    [format["The store does not accept your %1 in dirty money.", (client_level_array select 16) call client_fnc_numberText], true] spawn domsg;
};

if(_houselevel == 1) then { ["You upgraded to tier 2 housing, you will get your new house on soft-log.", true] spawn domsg; player setvariable ["houselevel",2,false]; [player, "houselevel", 2] remoteExec ["Server_fnc_setVariable",2]; };
if(_houselevel == 2) then { ["You upgraded to tier 3 housing, you will get your new house on soft-log.", true] spawn domsg; player setvariable ["houselevel",3,false]; [player, "houselevel", 3] remoteExec ["Server_fnc_setVariable",2]; };
if(_houselevel == 3) then { ["You can not upgrade any higher, yet!", true] spawn domsg; };

[225000, true] call Client_fnc_removecash;