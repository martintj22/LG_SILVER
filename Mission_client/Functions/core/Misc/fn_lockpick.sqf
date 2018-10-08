private["_obj"];

_obj = cursorObject;

if (_obj isKindOf "House_F") exitWith {

	_doorArray = [_obj] call client_fnc_getDoor;

	if( !(_doorArray isEqualTo 0) ) then {

		_check = ["Lockpicking",100,0,player,'AinvPknlMstpSnonWnonDnon_medic_1',player,"cg_sndimg\sounds\repair.ogg"] spawn client_fnc_dotask; 
		
		waitUntil { scriptDone _check };

		if (!client_dotask) exitWith {};

		playSound3D ["np_item\alarm.ogg", player, false, getPosasl player, 3, 1, 50];

		{

			_obj animate [_x, 1];

		} forEach (_doorArray select 1);

		[_obj, _doorArray] spawn {
			params["_obj","_doorArray"];

			_obj setVariable [_doorArray select 2, 0];
			sleep 300;
			_obj setVariable [_doorArray select 2, 1];
		};

		["CG_Lockpick",50] spawn client_fnc_removeitem;
		["You have access to this door for 5 minutes.", true] spawn domsg;

	};

};  

if(_obj iskindof "car"  || _obj iskindof "boat" || _obj iskindof "Air") exitWith {

	_check = ["Lockpicking",100,0,player,'AinvPknlMstpSnonWnonDnon_medic_1',player,"cg_sndimg\sounds\repair.ogg"] spawn client_fnc_dotask; 

	waitUntil { scriptDone _check };

	if (!client_dotask) exitWith {};

	current_cars pushback _obj;
};