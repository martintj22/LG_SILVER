// i like the idea of the shop system, right now, i think its not good enough unless its put on the headless client, we need a headless client for best possible cps.

private["_ERROR","_itemcount","_price","_newcount","_totalprice","_newcount","_quantity","_cash","_player","_shopplayer","_type","_item","_type"];
_player = _this select 0;
_item = _this select 1;
_quantity = _this select 2;
_quantity = call compile format["%1", _quantity];
_shop = nearestObjects [_player, ["Land_buildingCommercial1","Land_buildingCommercial2"], 30];
_shop = _shop select 0;
_shopplayer = _shop getVariable "shop";

diag_log ["store purchase %1", _player];



if(isNull _shopplayer) exitwith {}; //guess they logged out, need to cancel it here to prevent duping.

_shopcontent = _shopplayer getVariable "shopcontent";

_cash = _player getVariable "cashinhand";
_cash = call compile format["%1", _cash];

_myweapons = (_shopcontent select 0); 
_mymagazines = (_shopcontent select 1); 
_myitems = (_shopcontent select 2); 
_mybackpacks = (_shopcontent select 3);
_ERROR = "Success";
_type = 0;

if(true) then {

	if(_item IN (_myweapons select 0)) exitwith {
		_type = 1;
		_location = (_myweapons select 0) FIND _item;

		_itemcount = (_myweapons select 1) select _location;
		_price = (_myweapons select 2) select _location;

		_itemcount =  call compile format["%1", _itemcount];
		_price = call compile format["%1", _price];

		_newcount = _itemcount - _quantity;
		_totalprice = _quantity * _price;

		if(_newcount < 0) exitwith { _ERROR = "Not enough of that item."; };
		if(_cash < _totalprice) exitwith { _ERROR = "Not enough cash."; };

		if(_newcount == 0) then {
			//remove the item, its quantity and price here if there is none left after purchase.
			_location = (_myweapons select 0) FIND _item;
			(_myweapons select 0) deleteAt _location;
			(_myweapons select 1) deleteAt _location;
			(_myweapons select 2) deleteAt _location;
		} else {
			//update the quantity array here - more arrays in arrays in array changing - mind fuck complete.
			_myweaponscount = (_myweapons select 1);
			_myweaponscount SET [_location,_newcount];
			_myweapons SET [1,_myweaponscount];
		};
	};

	if(_item IN (_mymagazines select 0)) exitwith {
		_type = 2;
		_location = (_mymagazines select 0) FIND _item;

		_itemcount =  (_mymagazines select 1) select _location;
		_price = (_mymagazines select 2) select _location;

		_itemcount =  call compile format["%1", _itemcount];
		_price = call compile format["%1", _price];

		_newcount = _itemcount - _quantity;
		_totalprice = _quantity * _price;

		if(_newcount < 0) exitwith { _ERROR = "Not enough of that item."; };
		if(_cash < _totalprice) exitwith { _ERROR = "Not enough cash."; };

		if(_newcount == 0) then {
			//remove the item, its quantity and price here if there is none left after purchase.
			_location = (_mymagazines select 0) FIND _item;
			(_mymagazines select 0) deleteAt _location;
			(_mymagazines select 1) deleteAt _location;
			(_mymagazines select 2) deleteAt _location;
		} else {
			//update the quantity array here - more arrays in arrays in array changing - mind fuck complete.
			_mymagazinescount = (_mymagazines select 1);
			_mymagazinescount SET [_location,_newcount];
			_mymagazines SET [1,_mymagazinescount];
		};
	};


	if(_item IN (_myitems select 0)) exitwith {
		_type = 3;
		_location = (_myitems select 0) FIND _item;

		_itemcount =  (_myitems select 1) select _location;
		_price = (_myitems select 2) select _location;

		_itemcount =  call compile format["%1", _itemcount];
		_price = call compile format["%1", _price];

		_newcount = _itemcount - _quantity;
		_totalprice = _quantity * _price;

		if(_newcount < 0) exitwith { _ERROR = "Not enough of that item."; };
		if(_cash < _totalprice) exitwith { _ERROR = "Not enough cash."; };

		if(_newcount == 0) then {
			//remove the item, its quantity and price here if there is none left after purchase.
			(_myitems select 0) deleteAt _location;
			(_myitems select 1) deleteAt _location;
			(_myitems select 2) deleteAt _location;
		} else {
			//update the quantity here.
			_myitemscount = (_myitems select 1);
			_myitemscount SET [_location,_newcount];
			_myitems SET [1,_myitemscount];
		};
	};


	if(_item IN (_mybackpacks select 0)) exitwith {
		_type = 4;
		_location = (_mybackpacks select 0) FIND _item;	

		_itemcount = (_mybackpacks select 1) select _location;
		_price = (_mybackpacks select 2) select _location;

		_itemcount =  call compile format["%1", _itemcount];
		_price = call compile format["%1", _price];

		_newcount = _itemcount - _quantity;
		_totalprice = _quantity * _price;

		if(_newcount < 0) exitwith { _ERROR = "Not enough of that item."; };
		if(_cash < _totalprice) exitwith { _ERROR = "Not enough cash."; };	

		if(_newcount == 0) then {
			//remove the item, its quantity and price here if there is none left after purchase.
			_location = (_mybackpacks select 0) FIND _item;
			(_mybackpacks select 0) deleteAt _location;
			(_mybackpacks select 1) deleteAt _location;
			(_mybackpacks select 2) deleteAt _location;
		} else {
			//update the quantity here.
			_mybackpackscount = (_mybackpacks select 1);
			_mybackpackscount SET [_location,_newcount];
			_mybackpacks SET [1,_mybackpackscount];
		};
	};
};

if(_ERROR == "Success") exitwith {
	//shop owner setting
	_shopcontent = [_myweapons,_mymagazines,_myitems,_mybackpacks];
	_shopplayer setVariable ["shopcontent",_shopcontent,false];
	
	[_quantity, _item, _totalprice,_type,_shopcontent] remoteExec ["client_fnc_payShopOwner",_shopplayer];

	//database changes
	_updatestr = format ["updateShop:%1:%2", _shopcontent, getPlayerUID _shopplayer];
	_update = [0, _updatestr] call ExternalS_fnc_ExtDBquery;

	//player purchase success
	[_quantity, _item, _totalprice, _type] remoteExec ["client_fnc_confirmPurchase",_player];
};

[format["Error: %1",_ERROR],true] remoteExec ["domsg",_player];