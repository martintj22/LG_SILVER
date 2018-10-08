params["_object"];

{

    if ( _object getHitPointDamage _x < 0.9 ) exitWith {

        [_object,[_x,1]] remoteExec ["setHitPointDamage"];

        player addItem "CG_wheel";

        ["You stole the rims, aren't you proud of yourself...", true] spawn domsg;

    };

} forEach ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel"];