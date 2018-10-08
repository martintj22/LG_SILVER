//SUSPECTID / OFFICERID / CHARGES / STATUS / EVIDENCE / activate
_type = _this select 0;

_officer = name player;
_officerID = getplayeruid player;
_evidence = 0; // lodged later.
_charges = ctrlText 1116;

if(_charges find ":" > -1) exitWith {
    ["You cannot use a colon (':') in your message.", true] spawn domsg;
};

if(_type == 0) then {
    _status = lbData [911, _currentitemindex];
    currentcursortarget = call compile format ["%1",currentcursortarget];
    _suspect = name currentcursortarget;
    _suspectID = getplayeruid currentcursortarget;
    [_suspect,_suspectID,_officer,_officerID,_charges,1,_evidence,1,0] remoteexec ["server_fnc_addcriminal",2];
};

if(_type == 1) then {

    //["","",_officer,_officerID,_charges,4,_evidence,1,0] remoteexec ["server_fnc_addcriminal",2];

    [currentCop+currentDoc+currentDA, _charges, name player] remoteExec ['server_fnc_sendMessage', 2];
};

if(_type == 2) then {
    _status = lbData [911, _currentitemindex];
    currentcursortarget = call compile format ["%1",currentcursortarget];
    _suspect = name currentcursortarget;
    _suspectID = getplayeruid currentcursortarget;
    [_suspect,_suspectID,_officer,_officerID,format["HOUSE RAID - %1",_charges],3,_evidence,1,0] remoteexec ["server_fnc_addcriminal",2];
};

if(_type == 3) then {
    _status = lbData [911, _currentitemindex];
    currentcursortarget = call compile format ["%1",currentcursortarget];
    _suspect = name currentcursortarget;
    _suspectID = getplayeruid currentcursortarget;
    [_suspect,_suspectID,_officer,_officerID,format["SHOP RAID - %1",_charges],3,_evidence,1,0] remoteexec ["server_fnc_addcriminal",2];
};

if(_type == 4) then {
    
    _status = lbData [911, _currentitemindex];
    currentcursortarget = call compile format ["%1",currentcursortarget];
    _suspect = name currentcursortarget;
    _suspectID = getplayeruid currentcursortarget;

    if(_charges == "This is an official court document. You have to describe the events leading up to the arrest of this person. Do not include the charges. You have to be brief and descriptive. Failure to abide by the correct format will lead to disciplinary action as well the denial of the arrest and conviction of the suspect.") exitWith {

        ["You did not provide a valid reason.", true] spawn domsg;

    };

    if(count _charges < 150) exitWith {

        ["The reason must contain at least 150 characters.", true] spawn domsg;
        
    };

    [_suspect,_suspectID,_officer,_officerID,_charges,5,_evidence,1,0] remoteexec ["server_fnc_addcriminal",2];

    [player, {

        params["_officer"];

        if(lastarrest < time) then {
            lastarrest = time + 600;

            [500] remoteExec ['client_fnc_addMoneyToPlayer', _officer];
            [format["You have received %1 in bonuses for arresting a suspect and logging it.", 500 call client_fnc_numberText], true] remoteExec ["domsg", _officer];
        } else {
            ["You have not received a bonus because the arrest of this person was recently logged.", true] remoteExec ["domsg", _officer];
        };

    }] remoteExec["bis_fnc_spawn", currentcursortarget];

};

closedialog 0;