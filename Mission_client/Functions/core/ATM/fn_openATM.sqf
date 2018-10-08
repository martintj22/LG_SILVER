disableSerialization;
createDialog "ATM";

_bankAccount = format ["ATM # Account:%1", str (player getVariable "bankAccount")]; 
ctrlSetText [1000, _bankAccount];

_bank = player getVariable "cashinbank"; 
_bank = _bank call client_fnc_numberText;

ctrlSetText [1002, _bank];

_cash = (player getVariable "cashinhand") - (client_level_array select 16); 
_cash = _cash call client_fnc_numberText;
ctrlSetText [1004, _cash];

_totalTickets = 0;
_handle = false;
if(isNil "wantedTimer") then { wantedTimer = time-301; };
if (time >= wantedTimer + 300 && count currentMarshals > 0) then {
    if( ((player getVariable 'statuses') select 13 >= 1000) || myTickets > 2000 || myWarrants > 0) then {

        _nearest = currentMarshals apply {[player distance getPos _x, _x]};
        _nearest sort true;
        _nearest = (_nearest select 0) select 1;

        [getPos player, format["Spotted %1", name player], "Location", currentMarshals] remoteExec ["client_fnc_hudHelper", _nearest];
        wantedTimer = time;
        [format["Dispatch to %1: %2 has been spotted at %3 using an ATM.", _nearest getVariable "badgeNumber", name player, mapGridPosition getPos player], true] remoteExec ["domsg", currentMarshals];

    };
};

if(isNil "loanTimer") then { loanTimer = time-301; };
if(time >= loanTimer + 300 && moneyOwed > 0 && count currentMafia > 0) then {
        [getPos player, format["Spotted %1", name player], "Location", currentMafia] remoteExec ["client_fnc_hudHelper", _nearest];
        [format["%1 has been spotted at %2 using an ATM.", name player, mapGridPosition getPos player], true] remoteExec ["domsg", currentMafia];
};