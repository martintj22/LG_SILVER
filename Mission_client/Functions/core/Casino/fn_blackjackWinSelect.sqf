params ["_cards"];

_myValue = 0;
_aces = 0;
{
	_myvalue = _myvalue + (_x select 2);
	if((_x select 2) == 11) then { _aces = _aces + 1; };
}foreach _cards;

while{_myValue > 21 && _aces > 0} then {

	_myvalue = _myvalue - 10;
	_aces = _aces - 1;
	uisleep 0.05;

}; //bust