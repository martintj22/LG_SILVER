private["_custody","_jail","_prison"];

_time = _this select 0;
_time = call compile format["%1",_time];
_reason = _this select 1;

if(isnil "secondsLeft") then { secondsLeft = 0; };

secondsLeft = secondsLeft + (_time * 60);

if ( secondsLeft >= 600 ) then { _custody = "prison"; } else { _custody = "jail"; };

if ( getpos player distance [8242.13,3019.17,0] < 250 ) then { _custody = "jail"; };
if ( getpos player distance [5556.2,6291.29,0.00143433] < 150 ) then { _custody = "prison"; };

if (_custody == "jail") then { player setpos [8236.38,3014.21,0.00143814]; };
if (_custody == "prison") then { player setpos [5546.69,6290.16,0.00143433]; };

removeuniform player;

["Remove","Karma",random(100),"Stress"] call client_fnc_sustain;

player adduniform "mgsr_robe";
ClientArrested = true;
EM_allowed2 = false;
_escaped = false;
imRestrained = false;
player setVariable ['surrender', false];
player switchmove "";
_update = 0;
while{ClientArrested} do {
	if(getpos player distance [8242.13,3019.17,0] > 100 && _custody == "jail" && !(player getVariable["JailTracked",FALSE])) exitwith { _escaped = true; };
	if(getpos player distance [5556.2,6291.29,0.00143433] > 250 && _custody == "prison" && !(player getVariable["JailTracked",FALSE])) exitwith { _escaped = true; };
	uisleep 1;
	secondsLeft = secondsLeft - 1;
	_update = _update + 1;
	if(secondsLeft < 1) exitwith { secondsLeft = 0; };
	if(_update == 300) then { 
		_update = 0;
		_time = secondsLeft / 60;
		_time = round(_time);
		[_time, _reason,player,false] remoteExec ["server_fnc_jailsetup",2];
	};
};
[0, _reason,player,false] remoteExec ["server_fnc_jailsetup",2];
ClientArrested = false;
EM_allowed2 = true;
//when jail time ends normally
if(!_escaped) then {
	["Your jail time is over, did you learn your lesson?", true] spawn domsg;
	if(_custody == "jail") then { player setpos [8251.39,3027.08,0.00143814]; };
	if(_custody == "prison") then { player setpos [5538.63,6258.06,0.00143433]; };
	player setvariable ["JailTracked",nil,true]; 
	removeuniform player;
} else {
	["You escaped jail, you criminal!", true] spawn domsg;
};
