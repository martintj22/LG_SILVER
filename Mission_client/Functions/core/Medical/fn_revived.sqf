maxtime = 0;
deadplayer = false;
im_dead = false; 
closedialog 0;
detach player;
["set",0.25] call Client_Fnc_DoHealth;

if(deadPhase == 1) then {

    ["You woke up and can recall what happened from when you were paralyzed.", true] spawn domsg;

};

if(deadPhase == 2) then {

    ["You woke up, but have no recollection of any recent memories while you were unconscious.", true] spawn domsg;

};

sleep 1;
deadphase = 0;
player setVariable ["tf_voiceVolume", 1, true];
inGameUISetEventHandler ["Action", ""];

"colorCorrections" ppEffectEnable true;    
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [0, 0, 0, 1],  [0, 0, 0, 0.0]];  
"colorCorrections" ppEffectCommit 5;
"colorCorrections" ppEffectEnable false; 

if(myjob IN ["Cop","EMS","Fire"] || !shooting_death || isNil "shooting_death") exitwith {};

player setunitloadout savedGear;

[player, "getunitloadout", savedGear] remoteExec ["Server_fnc_setVariable",2];