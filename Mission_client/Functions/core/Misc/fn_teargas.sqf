
_gasmask = ["TAC_SF10H"];
_myvariable = -1;


While{true} do {

// normal conditions
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal


waituntil
{
	((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) // classnames of smoke ["Smokeshell", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", 																													SmokeShellOrange", "SmokeShellBlue"]
	and
	(getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)
};

_headgear = goggles player;

if (_headgear in _gasmask)
	then {
			if (_myvariable < 0) then {};
	}



else
		{
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [10]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
			enableCamShake true;	 // enables camera shake
			addCamShake [10, 45, 10];	// sets shakevalues
			player setFatigue 1; // sets the fatigue to 100%
			5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds
			sleep 5;
			"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
			sleep 5;
		};
};
