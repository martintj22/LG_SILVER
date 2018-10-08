disableserialization;
private["_text"];


_text = toLower (ctrlText 9993);

_licenseAlphaArray = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
_licenseNumericArray = ["0","1","2","3","4","5","6","7","8","9"];

_licenseArr = _text splitString "";

if(count _licenseArr > 7) then { _licenseArr resize 7; };
if(count _licenseArr == 0) exitwith { ["Too Short", true] spawn domsg; };
_fuckit = false;
_n = 0;
{
	_licenseChar = _licenseArr select _n;
	if( (_licenseChar IN _licenseAlphaArray) || (_licenseChar IN _licenseNumericArray) ) then {  } else {_fuckit = true;};
	_n = _n + 1;
} forEach _licenseArr;

if(_fuckit) exitwith { ["Invalid Numberplate", true] spawn domsg; };

_cashCheck = [1, 2000] call Client_fnc_checkMoney;
if!(_cashCheck) exitwith { [format["%1 - You do not have enough money to pay for this!",2000 call client_fnc_numberText], true] spawn domsg; };	

[plateChange,_text,player] remoteexec ["server_fnc_platechange",2];

closedialog 0;