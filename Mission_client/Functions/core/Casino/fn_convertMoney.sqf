disableSerialization;

_target = CurrentCursorTarget;

_rate = ctrlText 9339;
_rate = call compile format["%1", _rate];

if(_rate > 100) then { _rate = 100; };
if(_rate < 0) then { _rate = 0; };

[[_rate,_target], {
    params["_rate","_target"];
    private["_convert","_convert2"];

    _rate = _rate / 100;

    _convert = (client_level_array select 16); 

    _convert = floor (_convert / 1000) * 1000;

    if(_convert < 1000) exitWith { [format["Du skal mindst bruge %1 sorte penge for at hvid vaske.", 1000 call client_fnc_numberText], true] spawn domsg; };

    [format["Du er ved at hvidvaske %1 sorte penge til %2 hvide penge med en kursen %3%4.", _convert call client_fnc_numberText, _convert*(1-_rate) call client_fnc_numberText, _rate*100, "%"], true] spawn domsg;

    _check = ["Converting",120,0,player,'AinvPknlMstpSnonWnonDnon_medic_1',player,"cg_sndimg\sounds\repair.ogg"] spawn client_fnc_dotask; 

    waitUntil { scriptDone _check };

    if(!client_dotask) exitWith {};

    _convert2 = (client_level_array select 16); 

    _convert2 = floor (_convert2 / 1000) * 1000;

    if(_convert != _convert2) exitWith { ["The conversion canceled because you tried to do something naughty.", true] spawn domsg; };

    [_convert] call client_fnc_removeCash;

    [_convert*(1-_rate), true, true] call client_fnc_addMoneyToPlayer;

    ["mobsterBank", _convert*_rate, "Add"] remoteexec ["server_fnc_setValue",2];

    [format["Somebody has converted %1 in dirty money to %2 in clean money and mobster bank has received %3.", _convert call client_fnc_numberText, _convert*(1-_rate) call client_fnc_numberText, (_convert*_rate) call client_fnc_numberText], true] remoteExec["domsg", currentMobster];

    [format["Du har hvid vasket %1 i sorte penge til %2 i hvide penge med kursen %3%4.", _convert call client_fnc_numberText, _convert*(1-_rate) call client_fnc_numberText, _rate*100, "%"], true] spawn domsg;

}] remoteExec["bis_fnc_spawn", _target];

closeDialog 0;