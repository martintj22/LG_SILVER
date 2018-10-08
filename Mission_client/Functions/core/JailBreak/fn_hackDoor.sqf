if(isNil "jailHacking") then { jailHacking = false; };
if(jailHacking) exitwith { ["A Jail is already being hacked.", true] spawn domsg; };
jailHacking = true;


if(typeof cursorobject IN ["Land_buildingsJailCellBlock1"]) then {
	publicVariable "jailHacking";
	_fencetoopen = cursorobject;
	hint parsetext "<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>STARTING HACK SEQUENCE</t><br/> ACCESS POINT BEING BREACHED.";

	playSound3D ["CG_Jobs\sounds\jailbreak\hacking.ogg", player, false, (getposasl player), 1, 1, 25];
	_calcT = 0;
	player playmove "vvv_anim_lockpick";
	while {true} do {
		if(animationstate player != "vvv_anim_lockpick") then { player playmove "vvv_anim_lockpick"; };
		_calcT = _calcT + 1;
		if(_calcT > 25) exitwith {};
		uisleep 1;
		hint parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>MODIFYING SECURITY CELL</t><br/> %1 of 25 seconds.",_calcT];
	};
	playSound3D ["CG_Jobs\sounds\jailbreak\hacking.ogg", player, false, (getposasl player), 3, 1, 55];
	

	playSound3D ["CG_Jobs\sounds\jailbreak\jailAlarm.ogg", _fenceToOpen, false, (getposasl _fenceToOpen), 1.7, 1, 10235];
	hint parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>MAIN MODULE HACKED</t><br/> FULL ACCESS GRANTED IN 7 MINUTES.",_calcT];

	["3 Minutes til open", true] spawn domsg;

	uisleep 60;

	_doors = ["door1","door2","door3","door4"];
	{
		_fencetoopen animate [_x,1];
	} foreach _doors;

	0 = [_fencetoopen] spawn {
		_obj = _this select 0;
		_obj setVariable ['bis_disabled_Door_01',0];
		_obj setVariable ['bis_disabled_Door_02',0];
		_obj setVariable ['bis_disabled_Door_03',0];
		_obj setVariable ['bis_disabled_Door_04',0];
		sleep 1200;
		_obj setVariable ['bis_disabled_Door_01',1];
		_obj setVariable ['bis_disabled_Door_02',1];
		_obj setVariable ['bis_disabled_Door_03',1];
		_obj setVariable ['bis_disabled_Door_04',1];
	};
	["You have access to the doors for 20 minutes.", true] spawn domsg;

	["2 Minutes til open", true] spawn domsg;

	uisleep 60;

	["1 Minute til open", true] spawn domsg;

	uisleep 60;

	_doors = ["doorcell1","doorcell2","doorcell3","doorcell4"];
	{
		_fencetoopen animate [_x, 1];
	} foreach _doors;

	0 = [_fencetoopen] spawn {
		_obj = _this select 0;
		_obj setVariable ['bis_disabled_Door_c1',0];
		_obj setVariable ['bis_disabled_Door_c2',0];
		_obj setVariable ['bis_disabled_Door_c3',0];
		_obj setVariable ['bis_disabled_Door_c4',0];
		sleep 1200;
		_obj setVariable ['bis_disabled_Door_c1',1];
		_obj setVariable ['bis_disabled_Door_c2',1];
		_obj setVariable ['bis_disabled_Door_c3',1];
		_obj setVariable ['bis_disabled_Door_c4',1];
	};
	["You have access to the cell doors for 20 minutes.", true] spawn domsg;

	jailHacking = false;
	publicVariable "jailHacking";
};
jailHacking = false;




//plp_ctm_contshippinggreen