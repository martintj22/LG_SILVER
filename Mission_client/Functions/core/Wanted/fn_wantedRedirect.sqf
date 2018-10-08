//SUSPECTID / OFFICERID / CHARGES / STATUS / EVIDENCE / activate


_currentitemindex = lbCurSel 1120;
if (_currentitemindex == -1) exitWith { ["You must select a person.", true] spawn domsg; };
if ( myJob != "DA" && !(myJob == "Cop" && (player IN currentDetectives || (player getVariable "cop") >= 6 )) && !(myJob == "Legal" && ((player getVariable "legal") >= 6)) ) exitWith { ["You must be either a detective, prosecutor, police supervisor, or judge to submit warrants.", true] spawn domsg; };
currentcursortarget = _status2;

closedialog 0;
sleep 0.15;
createdialog "insertCriminal";