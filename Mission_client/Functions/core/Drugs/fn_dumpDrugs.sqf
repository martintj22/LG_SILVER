
_class1 = ["CG_MethBag100","CG_Cocaine","CG_WeedBag4"];
_class2 = ["CG_MethBag80","CG_WeedBag3","CG_MethBag90"];
_class3 = ["CG_MethBag70","CG_WeedBag2"];
_class4 = ["CG_MethBag60"];
_class5 = ["CG_MethBag50","CG_WeedBag1"];

_total = 0;
_cashout = 0;

{
	_mag = _x;
	if(_mag IN _class1) then { _cashout = _cashout + 330; player removeMagazine _mag; _total = _total + 1; };
	if(_mag IN _class2) then { _cashout = _cashout + 290; player removeMagazine _mag; _total = _total + 1; };
	if(_mag IN _class3) then { _cashout = _cashout + 240; player removeMagazine _mag; _total = _total + 1; };
	if(_mag IN _class4) then { _cashout = _cashout + 230; player removeMagazine _mag; _total = _total + 1; };
	if(_mag IN _class5) then { _cashout = _cashout + 220; player removeMagazine _mag; _total = _total + 1; };	

} forEach magazines player;

[_cashout,false,true] call Client_fnc_addMoneyToPlayer;

[format["You made %1 from this drug run.",_cashout call client_fnc_numberText], true] spawn domsg;
	
["Add","Karma",random(15),"Stress"] call client_fnc_sustain;

if(myjob == "Mafia") exitwith { [1,_total,player,getpos player] remoteExec ["server_fnc_drugJob",2]; };

if(myjob == "Biker") exitwith { [1,_total,player,getpos player] remoteExec ["server_fnc_drugJob2",2]; };