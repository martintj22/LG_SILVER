/*

_type 1 = blue
_type 2 = olive
any other type = orange

_phase 1 = dirty
_phase 2 = muddy
any other phase = standard.


*/
//[1,1] remoteexec ["client_fnc_jailClothing",currentcursortarget];
//jailclothing

params["_type","_phase"];

removeuniform player;

_string = "mgsr_robe";

if(_type == 1) then {
	_string = format["%1%2",_string,"_blue"];
};
if(_type == 2) then {
	_string = format["%1%2",_string,"_olive"];
};
if(_phase == 1) then {
	_string = format["%1%2",_string,"_dirty"];
};
if(_phase == 2) then {
	_string = format["%1%2",_string,"_muddy"];
};
player forceAddUniform _string;