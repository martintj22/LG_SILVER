/*
    Author: Wick
    Date: 21.10.2018
    Description: Bombe for køretøj, hvis køretøjet har en hastighed på 70 km/h bombe er blevet aktiveret og hvis køretøjet er under 50 km/h vil bomben eksploderet
    Return: None
 */
    private["_unit","_timer","_bomb"];
    _unit = cursorObject;

    ["np_SatchelCharge",0] spawn client_fnc_removeitem;
    
    if((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["escorted",false])) && (ClientArrested) && (client_istazed)) exitWith ["Du kan ikke placere en bombe!", false] spawn domsg;
     if(player distance _unit > 7) exitWith {["Du er for langt væk!", false] spawn domsg; player addItem "np_SatchelCharge";};
	//player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    //sleep 1.5;
    //waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};
     
     
    ["Du plantede en bombe under køretøjet!", false] spawn domsg;
    [_unit] spawn
    {
    	_veh = _this select 0;
    	waitUntil {(speed _veh) > 130}; // 130 - Speed for activate the bomb.
        _crew = crew (vehicle _veh);
    	["<t color='#ff0000' size = '.8'>Giv agt!<br /> En bombe blev anbragt i køretøjet! Hvis køretøjets hastighed falder under 50 km/t eksploderer bomben! Inden for 15 minutter bliver bomben deaktiveret!</t>",-1,-1,10,1,0,789] remoteExec ["BIS_fnc_dynamicText", _crew];
       //playSound3D ["sounds\bombhasbeenplanted.ogg", _veh, true, getPos _veh, 15, 1, 25];
       // _timer = 0;
       // for "_i" from 0 to 1 step 0 do  {
       //     _timer = _timer + 1;
       //     sleep 1;
       //         //if (_timer == 900) then {
       //         if (_timer == 20) then {
       //             if (true) exitWith { _crew = crew (vehicle _veh); ["<t color='#ff0000' size = '.8'>Giv agt!<br /> Bomben er blevet deaktiveret!</t>",-1,-1,5,1,0,789] remoteExec ["BIS_fnc_dynamicText", _crew];};
       //         };
       // };
    	waitUntil {(speed _veh) < 70}; // 50 - Speed that the bomb will explode. 
    	_bomb = "Bo_Mk82" createVehicle [0,0,9999];
    	_bomb setPos (getPos _veh);
        playSound3D ["sounds\speedbombExplode.ogg", player, false, getPos _veh, 15, 1, 25];
    	_bomb setVelocity [100,0,0];
    };