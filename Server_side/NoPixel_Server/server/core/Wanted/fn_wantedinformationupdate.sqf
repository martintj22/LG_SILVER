_display = findDisplay 5111;
_Btn4 = _display displayCtrl 1119;

_info = lbData[911,lbCurSel (911)];
_info = call compile format["%1", _info];


_ID = _info select 0;
_suspect = _info select 1;
_officer = _info select 2;
_crime = _info select 3;
_status = _info select 4;
_evidence = _info select 5;
_jailtime = _info select 6;
_time = _info select 7;


_Btn4 ctrlSetStructuredText parsetext format["Silver Lake v. %1 <br/> Officer %2 <br/> Entered %3 <br/> <br/> Crime: %4", _suspect select 0, _suspect select 0, _time, _crime];
_btn4 ctrlCommit 0;