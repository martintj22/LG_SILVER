private["_type","_approved","_closedperson"];

disableSerialization;


_display = findDisplay 5111;
_Btn4 = _display displayCtrl 1119;

_info = lbData[911,lbCurSel (911)];
_info = call compile format["%1", _info];

_ID = _info select 0;
_suspect = _info select 1;
_suspectGUID = _info select 2;
_officer = _info select 3;
_officerGUID = _info select 4;
_crime = _info select 5;
_status = _info select 6;
_evidence = _info select 7;
_active = _info select 8;
_jailtime = _info select 9;
_created_at = _info select 10;
_approved = _info select 11;
_approvedguid = _info select 12;
_closed = _info select 13;
_closedguid = _info select 14;

if (_evidence == 0) then {
    _approved = "Awaiting approval";
} else {
    _approved = format["Signed by %1", _approved];
};

switch(_active) do {
    case 0: {
        _closedperson = format["Closed by %1", _closed];
    };
    case 1: {
        _closedperson = "Filed";
    };
};

switch(_status) do {
    
    case 0: {
        _type = format["%1 YEARS CONVICTED", _jailtime];
        _Btn4 ctrlSetStructuredText parsetext format["SILVER LAKE v. %1<br/>%2<br/>%3<br/>Created at %4<br/>Submitted by %5<br/><br/>%6", toUpper(_suspect), _type, _closedperson, _created_at, _officer, _crime];
    };
    case 1: {
        _type = "ARREST WARRANT";
        _Btn4 ctrlSetStructuredText parsetext format["SILVER LAKE v. %1<br/>%2<br/>%3<br/>Created at %4<br/>Submitted by %5<br/>%6<br/><br/>%7", toUpper(_suspect), _type, _closedperson, _created_at, _officer, _approved, _crime];
    };
    case 2: {
        if (_evidence == 0) then {
            _type = format["%1 TICKET GIVEN", _jailtime call client_fnc_numberText];
        } else {
            _type = format["%1 TICKET PAID", _jailtime call client_fnc_numberText];
        };
        _Btn4 ctrlSetStructuredText parsetext format["SILVER LAKE v. %1<br/>%2<br/>%3<br/>Created at %4<br/>Submitted by %5<br/><br/>%6", toUpper(_suspect), _type, _closedperson, _created_at, _officer, _crime];
    };
    case 3: {
        _type = "SEARCH AND SEIZURE WARRANT";
        _Btn4 ctrlSetStructuredText parsetext format["SILVER LAKE v. %1<br/>%2<br/>%3<br/>Created at %4<br/>Submitted by %5<br/>%6<br/><br/>%7", toUpper(_suspect), _type, _closedperson, _created_at, _officer, _approved, _crime];
    };
    case 4: {
        _type = format["%1 BAIL", _jailtime call client_fnc_numberText];
        _Btn4 ctrlSetStructuredText parsetext format["SILVER LAKE v. %1<br/>%2<br/>%3<br/>Created at %4<br/>Submitted by %5", toUpper(_suspect), _type, _closedperson, _created_at, _officer];
    }; 
    case 5: {
        _type = "AFFIDAVIT FOR PROBABLE CAUSE";
        _Btn4 ctrlSetStructuredText parsetext format["SILVER LAKE v. %1<br/>%2<br/>%3<br/>Created at %4<br/>Submitted by %5<br/><br/>%6", toUpper(_suspect), _type, _closedperson, _created_at, _officer, _crime];
    }; 
};

_btn4 ctrlCommit 0;

[_btn4] call BIS_fnc_ctrlFitToTextHeight;