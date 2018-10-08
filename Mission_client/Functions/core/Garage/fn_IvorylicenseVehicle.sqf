private ["_car"];
_car = param [0, objNull, [objNull]];
_license = param [1, "", [""]];

_license = toLower(_license);
 
_licenseAlphaArray 		= ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
_licenseNumericArray 	= ["0","1","2","3","4","5","6","7","8","9"];
_licenseSelectionsEven 	= [4,6,8,10,12,14,16];
_licenseSelectionsOdd	= [5,7,9,11,13,15];

if (_license == "") then 
{
	{ 
		_licenseRandom = _licenseAlphaArray;
		if (_x > 8) then { _licenseRandom = _licenseNumericArray; };
		
		_licenseRandom = selectRandom _licenseRandom;
		_car setObjectTextureGlobal [_x, format["ivory_data\license\%1.paa", _licenseRandom]];
		
		_license = _license + _licenseRandom;
	} forEach _licenseSelectionsEven;
	_car setVariable ["ivory_license", _license , true];
} else {
	_licenseArr = _license splitString "";
	_licenseArray = [];
	
	{
		if ( _x in _licenseAlphaArray || _x in _licenseNumericArray ) then { _licenseArray pushBack _x };
		if (count _licenseArray == 7) exitWith {};
	} forEach _licenseArr;
	
	{
		_car setObjectTextureGlobal [_x, ""];
	} forEach _licenseSelectionsEven + _licenseSelectionsOdd;
	
	switch(count _licenseArray) do
	{
		case 1: { 
			_car setObjectTextureGlobal [_licenseSelectionsEven select 3, format["ivory_data\license\%1.paa", _licenseArray select 0]];
		};
		case 2: { 
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 2, format["ivory_data\license\%1.paa", _licenseArray select 0]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 3, format["ivory_data\license\%1.paa", _licenseArray select 1]];
		};
		case 3: { 
			_car setObjectTextureGlobal [_licenseSelectionsEven select 2, format["ivory_data\license\%1.paa", _licenseArray select 0]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 3, format["ivory_data\license\%1.paa", _licenseArray select 1]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 4, format["ivory_data\license\%1.paa", _licenseArray select 2]];
		};
		case 4: { 
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 1, format["ivory_data\license\%1.paa", _licenseArray select 0]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 2, format["ivory_data\license\%1.paa", _licenseArray select 1]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 3, format["ivory_data\license\%1.paa", _licenseArray select 2]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 4, format["ivory_data\license\%1.paa", _licenseArray select 3]];
		};
		case 5: { 
			_car setObjectTextureGlobal [_licenseSelectionsEven select 1, format["ivory_data\license\%1.paa", _licenseArray select 0]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 2, format["ivory_data\license\%1.paa", _licenseArray select 1]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 3, format["ivory_data\license\%1.paa", _licenseArray select 2]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 4, format["ivory_data\license\%1.paa", _licenseArray select 3]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 5, format["ivory_data\license\%1.paa", _licenseArray select 4]];
		};
		case 6: { 
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 0, format["ivory_data\license\%1.paa", _licenseArray select 0]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 1, format["ivory_data\license\%1.paa", _licenseArray select 1]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 2, format["ivory_data\license\%1.paa", _licenseArray select 2]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 3, format["ivory_data\license\%1.paa", _licenseArray select 3]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 4, format["ivory_data\license\%1.paa", _licenseArray select 4]];
			_car setObjectTextureGlobal [_licenseSelectionsOdd select 5, format["ivory_data\license\%1.paa", _licenseArray select 5]];
		};
		default { 
			_car setObjectTextureGlobal [_licenseSelectionsEven select 0, format["ivory_data\license\%1.paa", _licenseArray select 0]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 1, format["ivory_data\license\%1.paa", _licenseArray select 1]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 2, format["ivory_data\license\%1.paa", _licenseArray select 2]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 3, format["ivory_data\license\%1.paa", _licenseArray select 3]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 4, format["ivory_data\license\%1.paa", _licenseArray select 4]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 5, format["ivory_data\license\%1.paa", _licenseArray select 5]];
			_car setObjectTextureGlobal [_licenseSelectionsEven select 6, format["ivory_data\license\%1.paa", _licenseArray select 6]];
		};
	};
	_car setVariable ["ivory_license", _licenseArray joinString "", true];
};

true;