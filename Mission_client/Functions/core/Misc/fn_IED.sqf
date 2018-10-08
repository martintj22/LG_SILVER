private["_obj"];

_obj = cursorObject;

if( myJob == "Biker" && (_obj isKindOf "Car" || _obj isKindOf "Air" || _obj isKindOf "Boat") ) then {

    _check = ["Attaching Satchel Charge",5,0,player,'vvv_anim_ticket',player,"cg_sndimg\sounds\repair.ogg"] spawn client_fnc_dotask; 

	waitUntil { scriptDone _check };

	if (!client_dotask) exitWith {};

    _bomb = createVehicle ["SatchelCharge_F", getposATL _obj, [], 0, "CAN_COLLIDE"];
    _bomb attachTo [_obj,[0,0,-1]];
        
    _name = ("bomb" + (str round(random(10000))));
    missionNamespace setVariable [_name, _bomb];

    bombs pushBack _name;

    ["NP_SatchelCharge",0] spawn client_fnc_removeitem;

} else {

    _check = ["Placing Satchel Charge",3,0,player,'vvv_anim_ticket',player,"cg_sndimg\sounds\repair.ogg"] spawn client_fnc_dotask; 

	waitUntil { scriptDone _check };

	if (!client_dotask) exitWith {};

    _bomb = createVehicle ["SatchelCharge_F", getposATL player, [], 0, "CAN_COLLIDE"];
        
    _name = ("bomb" + (str round(random(10000))));
    missionNamespace setVariable [_name, _bomb];

    bombs pushBack _name;

    ["NP_SatchelCharge",0] spawn client_fnc_removeitem;

}