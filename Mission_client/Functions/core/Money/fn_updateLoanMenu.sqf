disableserialization;


_display = findDisplay 9999;

_status = lbData[9001,lbCurSel (9001)];
_loan = call compile format["%1", _status];

_moneyOwed = _loan select 2;
_cash = _moneyOwed call client_fnc_numberText;

_TEXT = _display displayCtrl 1001;
_TEXT ctrlSetStructuredText parsetext format["<t color='#33CC33'>Loan Giver: %1 <t color='#ffffff'> <br/><br/> Owed: %2 <t color='#33CC33'> <br/><br/> Reasoning: %3 <br/><br/> Date Due: %4", _loan select 1, _cash, _loan select 3, _loan select 4];
_TEXT ctrlCommit 0;
