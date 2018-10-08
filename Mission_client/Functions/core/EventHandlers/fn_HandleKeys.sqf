//handle keys

params ["_ctrl", "_code", "_shift", "_ctrlKey", "_alt", ["_handled", false, [false]], "_veh", "_locked", "_interactionKey", "_mapKey", ["_interruptionKeys", [17,30,31,32]]];

if ( deadPlayer && !( _code IN [59]+(actionkeys 'PersonView')+(actionKeys 'ingamePause') ) ) exitWith { true };

switch (_code) do
{
	case 59: 
	{
		if(!(adminLevel >= 7)) exitWith {};

		if (!_shift && !_ctrlKey && !_alt) then {
			if(!isNull(findDisplay 1444)) exitWith {};

			closedialog 0; 
			createdialog 'koiladmin';
		};

		if (_shift && !_ctrlKey && !_alt && (adminLevel == 10)) then {
			closedialog 0; 
			createDialog "RscDisplayDebugPublic";
		};
		
	};

	case 57:
	{
		if(EM_allowed) then { EM_Allowed = false; };
        if(isNil "jumpActionTime") then { jumpActionTime = 0; };
        if( (time - jumpActionTime) > 2 && !client_istazed && !imrestrained && (animationState player) != "unconscious" && (animationState player) != "Incapacitated" && (animationState player) != "deadstate") then {
            jumpActionTime = time;
            player spawn client_fnc_jumpScript;
            _handled = true;
        };
		if(!ClientInterrupted) then {
			ClientInterrupted = true;
		};

		[] spawn { 

			uisleep 1.1; 
			
			if(clientInterrupted) then {
				ClientInterrupted = false; 
			};

		};
	};
	case 61:
	{
	
		if(myjob == "Cop" || myjob == "EMS" || myjob == "doc") then {
			33.1 call client_fnc_changeFrequency;
		};

		if(myjob == "Biker") then {
			69.1 call client_fnc_changeFrequency;
		};

	};


	case 62:
	{
		if(myjob == "Cop" || myjob == "EMS" || myjob == "doc") then {
			33.2 call client_fnc_changeFrequency;
		};
	};

	case 63:
	{
		if(myjob == "Cop" || myjob == "EMS" || myjob == "doc") then {
			33.3 call client_fnc_changeFrequency;
		};
	};

	case 64:
	{
		if(myjob == "Cop" || myjob == "EMS" || myjob == "doc") then {
			33.4 call client_fnc_changeFrequency;
		};
	};	

	case 65:
	{
		if(myjob == "Cop" || myjob == "EMS" || myjob == "doc") then {
			33.5 call client_fnc_changeFrequency;
		};
	};	

	case 66:
	{
		if(myjob == "Cop" || myjob == "EMS" || myjob == "doc") then {
			33.6 call client_fnc_changeFrequency;
		};
	};	

	case 67:
	{
		if(myjob == "Cop" || myjob == "EMS" || myjob == "doc") then {
			33.7 call client_fnc_changeFrequency;
		};
	};	


	case 1:
	{
		[] spawn {
			uisleep 0.1;
				if(!isNull (findDisplay 49)) then {
				disableserialization;

				_respawnButton = (findDisplay 49) displayCtrl 1010;
				_respawnButton ctrlEnable false;
				
				if(deadPlayer) then {
					_qButton = (findDisplay 49) displayCtrl 104;
					_qButton ctrlEnable false;
				};
			};
		};
	};


	//U Key
	case 22:
	{
		if( (cursorobject iskindof "Car" || cursorobject iskindof "Ship" || cursorobject iskindof "Air") || vehicle player != player ) then {
			_veh = cursorobject;
			if(vehicle player != player) then { _veh = vehicle player; };
			_locked = locked _veh;
			if(_veh in current_cars && player distance _veh < 8 && !imRestrained && !(player getVariable ["surrender", false])) then {

				if(_locked == 2) then {
					
					if(local _veh) then {
						_veh lock 0;
					} else {
						[_veh,0] remoteExecCall ["client_fnc_lock",_veh];
					};
					["unlocked", false] spawn doquickmsg; 

					playSound3D ["cg_mission_files\sounds\lockunlock.ogg", player, false, getPosASL player, 3, 1.1, 25];

				} else {

					if(local _veh) then {
						_veh lock 2;
					} else {
						[_veh,2] remoteExecCall ["client_fnc_lock",_veh];
					};	

					["locked", false] spawn doquickmsg; 

					playSound3D ["cg_mission_files\sounds\lockunlock.ogg", player, false, getPosASL player, 3, 1.1, 25];
				};
			};
		};
	};



		


	case 16:
	{

		if(_ctrlKey) then { closedialog 0; _loadout = getunitloadout player; closedialog 0; player setunitloadout _loadout; closedialog 0; };

		if((myJob == "Cop" || myjob == "EMS") && typeof vehicle player IN ["VVV_dodge_charger_pd","VVV_dodge_charger_marshals","VVV_dodge_charger_highway","VVV_dodge_charger_pd_su","VVV_dodge_charger_marshals_su","VVV_dodge_charger_highway_su","VVV_DodgeDurango_police","VVV_dodge_charger_doc_su","VVV_dodge_charger_doc","VVV_DodgeDurango_medic","VVV_dodge_charger_medic"]) then 
		{
			[2] spawn client_fnc_rotateLight;
		};

		if( (myJob == "EMS" || myJob == "Fire") && typeof vehicle player == "C_hh60j_unarmed_F" && driver (vehicle player) != player ) then 
		{
			[] spawn client_fnc_raisebasket;
		};	
	};

	case 18:
	{
		if((myJob == "Cop" || myjob == "EMS") && typeof vehicle player IN ["VVV_dodge_charger_pd","VVV_dodge_charger_marshals","VVV_dodge_charger_highway","VVV_dodge_charger_pd_su","VVV_dodge_charger_marshals_su","VVV_dodge_charger_highway_su","VVV_DodgeDurango_police","VVV_dodge_charger_doc_su","VVV_dodge_charger_doc","VVV_DodgeDurango_medic","VVV_dodge_charger_medic"]) then 
		{
			[1] spawn client_fnc_rotateLight;
		};
		if( (myJob == "EMS" || myJob == "Fire") && typeof vehicle player == "C_hh60j_unarmed_F" && driver (vehicle player) != player ) then 
		{
			[] spawn client_fnc_lowerbasket;
		};	
	};

	//Map Key
	case 50:
	{
		if(!(myJob IN ["EMS","Cop","doc"])) then {
			[] spawn client_fnc_playermapMarkers;
		} else {
			if(myJob == "EMS") then {
				[] spawn client_fnc_mapMarkers;
			};
			if(myJob IN ["Cop","doc"]) then 
			{
				[] spawn client_fnc_copmapMarkers;
			};
		};
	};

	case 3:
	{
		if(isNil "LoggedIn") then { LoggedIn = false; };
		if(LoggedIN) then { _relpos = player getRelPos [10, 0]; player setpos _relpos; };
	};


	case 17:
	{
	    if(!currentlyUpdating) then {
	        if(vehicle player != player && str(typeof (vehicle player)) find "_2" > -1 ) then {
	            currentlyUpdating = true;
	            Gearphase = (vehicle player) animationSourcePhase "gear";
	            [] spawn {

	                while{currentlyUpdating} do {
	                    _phase = vehicle player animationSourcePhase "RPM";
	                    if(_phase > 2000) then {
	                       vehiclePressure = vehiclePressure + 0.2;
	                       _gearphase = vehicle player animationSourcePhase "gear";
	                        if(_gearphase > gearphase && vehiclePressure > 3) then { 
		                        playSound3D ["CG_turbo\sounds\turbo1.ogg", vehicle player, false, getPosasl (vehicle player), 1, 1, 21];
	                            Gearphase = (vehicle player) animationSourcePhase "gear";
	      						if(vehicle player != player && str(typeof (vehicle player)) find "vory" > -1 ) then {	                            
		                            vehicle player animate["backfire", 1];
		                            uisleep 0.1;
		                            vehicle player animate["backfire", 0];	
						        };                     
	                            vehiclePressure = 0;
	                            currenltyUpdating = false;	                                                      
	                        };                     
	                    };
	                    if(vehicle player == player) exitwith {};
	                    sleep 0.05;
	                };

	            	Gearphase = (vehicle player) animationSourcePhase "gear";
	            	vehiclePressure = 0;
	                currenltyUpdating = false; 
	            };
		 	};
        }; 
    };

	case 2:
	{


		if (_ctrlKey && myjob IN ["Cop","doc"]) then {
			if(handgunweapon player == "taser") then {
				_weapon = handgunweapon player;
				player removeweapon _weapon; player additemtobackpack _weapon;
				[] spawn { 

					if("RH_uspm" in backpackItems Player) then {
						player action ["SwitchWeapon", player, player, 400]; uisleep 2.1; player removeitem "RH_uspm"; player addweapon "RH_uspm"; player selectweapon "RH_uspm"; player addItemToBackPack "vvv_np_magazine_taser";
						444 cutRsc ["HUDguncop","PLAIN"]; 
					} else {
						["ERROR: No USP Pistol in backpack", true] spawn domsg;
					};
					
				};
			} else {
				_weapon = handgunweapon player;
				player removeweapon _weapon; player additemtobackpack _weapon;
				[] spawn { 

					if("taser" in backpackItems Player) then {
						player action ["SwitchWeapon", player, player, 400]; uisleep 2.1; player removeitem "taser"; player addweapon "taser"; player selectweapon "taser"; player addItemToBackpack "RH_16Rnd_40cal_usp";
						444 cutRsc ["HUDtasercop","PLAIN"]; 
					} else {
						["ERROR: No Taser in backpack", true] spawn domsg;
					};

				};
			};
			_handle = true;	
		};	
	};

	case 219:
	{
		_spikeStrips = (nearestObjects[getPos player,["CG_Spikes_Extended"],3]) select 0;
		if !(_spikeStrips isEqualTo [] && !spikeAntiSpam) then {
				[] spawn {
					spikeAntiSpam = true;
					sleep 1;
					spikeAntispam = false;
				};	
				deletevehicle _spikeStrips;
				["You picked up some spike strips!", false] spawn domsg; 
				player additem "CG_Spikes_Collapsed";
		};

		if(mouseMovement == 1) exitwith { mouseMovement = 3; _handle = true; };
		if(!busyPlayer) then {
			closedialog 0;
			[] call Client_fnc_openInteraction;
			[] spawn client_fnc_keyBusyPlayer;
			_handle = true;
		};
	};
	
	case 25:
	{
	    if(_shift && !_alt && !_ctrlKey && !busyPlayer) then
	    {
	 		[] spawn client_fnc_keyBusyPlayer;      	
			if (!client_fadeSound) then 
			{
				1 fadeSound 0.1;
				["Your sound has been lowered.", false] spawn domsg;
				client_fadesound = true;
			}
			else
			{
				1 fadeSound 1;
				["Your sound has returned to normal.", false] spawn domsg;
				client_fadesound = false;
			};
	        _handle = true;
	    };
	};






	case 6:
	{

		if (_shift) then { _handle = true; };
		if (_shift) then
			{
			_spikeStrips = (nearestObjects[getPos player,["CG_Spikes_Extended"],3]) select 0;
			if !(_spikeStrips isEqualTo [] && !spikeAntiSpam) then {
					[] spawn {
						spikeAntiSpam = true;
						sleep 1;
						spikeAntispam = false;
					};	
					deletevehicle _spikeStrips;
					["You picked up some spike strips!", false] spawn domsg; 
					player additem "CG_Spikes_Collapsed";
			};

			if(mouseMovement == 1) exitwith { mouseMovement = 3; _handle = true; };
			if(!busyPlayer) then {
				closedialog 0;
				[] call Client_fnc_openInteraction;
				[] spawn client_fnc_keyBusyPlayer;
				_handle = true;
			};
		};
	};
	
	case 7:
	{
		if (_shift) then { _handle = true; };

		if (_shift) then
		{
			if (isNull objectParent player && !busyPlayer && (animationState player) != "Incapacitated" ) then
			{
				[] spawn client_fnc_keyBusyPlayer;
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", nil, false];
				} else
				{
					[] spawn client_fnc_surrender;
				};
			};
		};
				
		if(_ctrlKey) then {
			if (isNull objectParent player && !busyPlayer && !imRestrained) then
			{
				player playActionNow "gesturefinger";
				[] spawn client_fnc_keyBusyPlayer;
				_handle = true;
			};
	    };
	};

	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			client_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 200];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "client_curWep_h" && {(client_curWep_h != "")}) then {
			if(client_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon client_curWep_h;
			};
		};
  	};
};

_handle;