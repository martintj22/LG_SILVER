/*
petroleo < string to object
*/

private["_n","_i"];

_barArray = ["np_fishmeat"];
_priceArray = [7];


if(isNil "globalProtection") then { globalProtection = 0; };
if(globalProtection != 0) exitwith { ["Error - Already processing", true] spawn domsg; };
_localProtection = 0;



_n = 0;
_cashTotal = 0;
{
	_total = {_x == (_barArray select _n)} count magazines player;
	_i = _total;

	while{ _i > 0 } do {

		_localProtection = _localprotection + 1;
		globalProtection = globalProtection + 1;
		if(_localProtection != globalProtection) exitwith { [1,"Selling Fish Script"] spawn client_fnc_anticheat; };

		player removeitem (_barArray select _n);
		_value = (_priceArray select _n);
		[_value,true,true] call Client_fnc_addMoneyToPlayer;
		_cashTotal = _cashTotal + _value;
		_i = _i - 1;
		playSound3D ["vvv_fishingrod\sounds\splash.ogg", player, false, getPosasl player, 5, 1, 5];
		sleep 0.25;
		if(dialog) then { closedialog 0; };
	};

	_n = _n + 1;

} foreach _barArray;

globalProtection = 0;

[format["You just earned %1",_cashTotal call client_fnc_numberText], true] spawn domsg;