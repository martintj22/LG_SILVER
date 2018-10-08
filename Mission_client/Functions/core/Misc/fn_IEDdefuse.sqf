params["_target"];

if (count nearestObjects[player,["SatchelCharge_F"],10] > 0) exitWith {

    _target = (nearestObjects[player,["SatchelCharge_F"],10] select 0);

    deleteVehicle _target;

    player addMagazine "np_SatchelCharge";

};

if ( "SatchelCharge_F" IN ((attachedObjects _target) apply {typeOf _x}) ) exitWith {

    {

        if (typeOf _x == "SatchelCharge_F") then { 

            deleteVehicle _x;

            player addMagazine "np_SatchelCharge";

        }; 


    } forEach attachedObjects _target;

};