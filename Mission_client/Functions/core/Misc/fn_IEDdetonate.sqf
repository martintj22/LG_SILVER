_bombStr = lbData[1113, (lbCurSel 1113)];
_bomb = call compile format["%1", _bombStr];

_rBomb = createVehicle ["SatchelCharge_Remote_Ammo", position _bomb, [], 0, "CAN_COLLIDE"];
_rBomb setDamage 1;

if( typeOf _bomb == "SatchelCharge_F" ) then {
    deleteVehicle _bomb;
} else {
    {
        deleteVehicle _x;  
    } forEach (attachedObjects _bomb);
};

{

    if ( _bombStr == _x ) exitWith {
        bombs deleteAt _forEachIndex;
    };

} forEach bombs;

["Detonated!", true] spawn domsg;

closeDialog 0;