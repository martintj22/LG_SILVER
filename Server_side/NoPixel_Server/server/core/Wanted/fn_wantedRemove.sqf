_info = _this select 0;
_caseID = _info select 0;
_closed = _this select 1;
_closedguid = _this select 2;

if ( _info select 6 == 4 ) exitWith {  

    boloList = boloList - [_info];
    publicVariable "boloList";


};
if ( _info select 6 == 5 ) exitWith {  

    evidenceList = evidenceList - [_info];
    publicVariable "evidenceList";

};

_updatestr = format ["updateCrime:%1:%2:%3:%4", _closed, _closedguid, 0, _caseID];
_del = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

lastwanted = time; 
_type = 1;