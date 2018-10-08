_length = ctrlText 2222;
_reason = ctrlText 1111;
_length = call compile format["%1", _length];
_length = round(_length);
_suspect = name currentcursortarget;
_suspectID = getplayeruid currentcursortarget;
_officer = name player;
_officerID = getplayeruid player;
_evidence = 1;

if ( _length <= 0 ) exitWith { ["Must be at least 0 years.", true] spawn domsg; };
if ( _length > 10 && getpos player distance [8242.13,3019.17,0] < 600 ) exitWith { ["Must be at most 10 years at Jail.", true] spawn domsg; };
if ( _length > 90 ) exitWith { ["Must be at most 90 years.", true] spawn domsg; };

[_length, _reason, CurrentCursorTarget,true] remoteExec ["server_fnc_jailsetup",2];
[_suspect,_suspectID,_officer,_officerID,_reason,0,_evidence,0,_length,"","","Silver Lake", 0] remoteexec ["server_fnc_addcriminal",2];

imrestrained = false;
player setVariable ['surrender', false];

_bonus = _length*10;
[format["%1 has been sentenced to %2 year(s) and you have received a %3 bonus.", name player, _length, _bonus call client_fnc_numberText], true] spawn domsg; 
[_bonus] call client_fnc_addMoneyToPlayer; 

[[_length, _officer],{

    params["_length", "_officer"];
    [format["You have been convicted for %1 years.", _length], true] spawn domsg;

    [getplayeruid player, "Silver Lake", 0] remoteExec ["Server_fnc_wantedRemoveAll",2];

    if(myTickets > 0) then {
        _myCash = (player getVariable "cashinbank");
        _rate = 0.9;
        if( _myCash - myTickets <= 5000) then {
            if( _myCash > 5000 ) then {
                [_myCash - 5000] call client_fnc_removeBank;  

                [(_myCash - 5000)*(1-_rate)] remoteExec["client_fnc_addMoneyToPlayer", _officer]; 

	            ["govtBank", (_myCash - 5000)*_rate, "Add"] remoteExec["server_fnc_setValue",2];
	            ["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, (_myCash - 5000) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

                [format["The government seized %1 from your bank account because of unpaid tickets.",(_myCash - 5000) call client_fnc_numberText], true] spawn domsg; 
            } else {
                [format["You had less than %1 in your bank account so the government did not seize any funds.", 5000 call client_fnc_numberText], true] spawn domsg;
            };  
        } else {
            [myTickets] call client_fnc_removeBank;  

            [myTickets*(1-_rate)] remoteExec["client_fnc_addMoneyToPlayer", _officer]; 

	        ["govtBank", myTickets, "Add"] remoteExec["server_fnc_setValue",2];
	        ["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, myTickets call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

            [format["The government seized %1 from your bank account because of unpaid tickets.",(myTickets) call client_fnc_numberText], true] spawn domsg; 
            
            [format["The government seized %1 from the convict's bank account because of unpaid tickets and you received %2 in bonus.",(myTickets) call client_fnc_numberText], true] remoteExec["domsg", _officer]; 
        };
        myTickets = 0;
    };

    if(((player getvariable "statuses") select 13) > 0) then {
        _currentTax = ((player getvariable "statuses") select 13);
        _myCash = (player getVariable "cashinbank");
        _rate = 0.9;
        if( _myCash - _currentTax <= 5000) then {
            if( _myCash > 5000 ) then {
                [_myCash - 5000] call client_fnc_removeBank;  

                [(_myCash - 5000)*(1-_rate)] remoteExec["client_fnc_addMoneyToPlayer", _officer]; 

	            ["govtBank", (_myCash - 5000)*_rate, "Add"] remoteExec["server_fnc_setValue",2];
	            ["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, (_myCash - 5000) call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

                [format["The government seized %1 from your bank account because of unpaid tickets.",(_myCash - 5000) call client_fnc_numberText], true] spawn domsg; 
            }  else {
                [format["You had less than %1 in your bank account so the government did not seize any funds.", 5000 call client_fnc_numberText], true] spawn domsg;
            };
        } else {
            [_currentTax] call client_fnc_removeBank;  

            [_currentTax*(1-_rate)] remoteExec["client_fnc_addMoneyToPlayer", _officer]; 

	        ["govtBank", _currentTax, "Add"] remoteExec["server_fnc_setValue",2];
	        ["govtBank", format["%1 (%2) added %3 into the Government bank account.", name player, getplayeruid player, _currentTax call client_fnc_numberText]] remoteExec ["server_fnc_log",2];

            [format["The government seized %1 from your bank account because of unpaid taxes.",(_currentTax) call client_fnc_numberText], true] spawn domsg; 
            
            [format["The government seized %1 from the convict's bank account because of unpaid taxes and you received %2 in bonus.",(_currentTax) call client_fnc_numberText], true] remoteExec["domsg", _officer]; 
        };
        (player getvariable "statuses") set [13, 0]; 
    };

    if( (client_level_array select 16) > 0 ) then {

        _dirtyMoney = client_level_array select 16;
        _rate = 0.9;

        [_dirtyMoney] call client_fnc_removeCash; 
        
        [_dirtyMoney*(1-_rate)] remoteExec["client_fnc_addMoneyToPlayer", _officer]; 
        ["govtBank", _dirtyMoney*_rate, "Add"] remoteExec["server_fnc_setValue",2];
        
        [format["The government seized %1 from your person because of you were in possession of dirty money.", (_dirtyMoney) call client_fnc_numberText], true] spawn domsg; 
            
        [format["The government seized %1 from the convict because of dirty money and you received %2 in bonus.",(_dirtyMoney) call client_fnc_numberText, (_dirtyMoney*(1-_rate)) call client_fnc_numberText], true] remoteExec["domsg", _officer]; 

    };
    
    if(myWarrants > 0) then {
        myWarrants = 0;
    };

    [player] remoteExec ["Server_fnc_wantedListMine", 2];

}] remoteExec["bis_fnc_spawn", CurrentCursorTarget];

closedialog 0;