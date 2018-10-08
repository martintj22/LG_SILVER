//pay mayor taxes

_startingpayment = taxpayments;
_n = 0;
while { true } do {
	uisleep 120;
	if(taxpayments != _startingpayment) then {
		_n = 0;
		_startingpayment = taxpayments;
	};
	_n = _n + 1;
	if(_n == 5) exitwith {};
};

["govtBank",taxpayments, "Add"] remoteExec["server_fnc_setValue",2];

taxpayments = 0;