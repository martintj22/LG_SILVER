_player = _this select 0;

_PS1 = "#particlesource" createVehiclelocal [0,0,0];
_PS1 setParticleRandom [0,[0.004,0.004,0.004],[0.01,0.01,0.01],30,0.01,[0,0,0,0],1,0.02,360];

_PS1 setDropInterval 0.001;

_PS1 attachTo [_player,[0.1,0,-0.1],"head"] ;
playSound3D ["cg_mission_files\sounds\vomit.ogg", player, false, getPos player, 1, 1, 25];
for "_i" from 0 to 1 step 0.1 do {
	_PS1 setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (getDir _player) * _i,cos (getDir _player) * _i,0],0,1.5,1,0.1,[0.35,0.35,0.6],[[0.2,0.6,0.3,0.6],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_PS1,0,true,0.1,[[0.8,0.7,0.2,0]]] ;
	sleep 0.05;
};

detach _ps1;
deleteVehicle _PS1;