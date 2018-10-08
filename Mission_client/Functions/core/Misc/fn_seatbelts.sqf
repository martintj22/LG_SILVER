if(vehicle player != player && (vehicle player isKindOf "LandVehicle")) then
{

	if(!client_seatbelt) then
	{
		[] spawn {
			oldVehVelocity = velocity (vehicle player);
			_oldspeed = speed vehicle player;
			uiSleep 0.5;
			if(speed vehicle player < 10 && _oldspeed > 70) then
			{
				playSound "glassbreak";
				moveOut player;
				player setVelocity [(oldVehVelocity select 0) * 0.4,(oldVehVelocity select 1) * 0.4,((oldVehVelocity select 2) * 0.4) + 5];
				[] spawn KK_fnc_forceRagdoll;
			};
		};

		if(!client_seatwarn) then {
			client_seatwarn = true;
			427 cutRsc ["HUDseat","PLAIN"]; 
			["Remember your Seatbelt!", false] spawn domsg;
			playSound "seatwarn";	
		};

	};

	if(client_seatbelt) then { 427 cutfadeout 1; };


	if(speed vehicle player < 90 || myJob IN ["Cop","doc","EMS"]) exitwith {};


	if(driver (vehicle player) == player && !speedChecked) then {
			
		_speedLimit = 200;

		if(player distance [5958.55,2588.34,0.499081] < 35 || player distance [4167.47,1985.92,0.506023] < 35 || player distance [6077.71,4439.47,0.496862] < 35 || player distance [9008.4,7306.11,0.498945] < 35 || player distance [9837.6,4193.5,0.498384] < 35 ) then {

			if(speed player > _speedLimit + 10 && speed player <= _speedLimit + 35) exitwith {
				[name player,getplayeruid player, "Silver Lake", "0", "1x Speeding, 3rd degree.", 2, 0, 1, 250] remoteexec ["server_fnc_addcriminal",2];
				[player, "You have been issued a ticket for speeding. Go to the court house to pay it off or face legal consequences.", "Silver Lake", "Ticket"] remoteExec ["server_fnc_sendMail",2];

				[] spawn client_fnc_speedchecked;
			};

			if(speed player > _speedLimit + 35 && speed player <= _speedLimit + 70) exitwith {
				[name player,getplayeruid player, "Silver Lake", "0", "1x Speeding, 2nd degree.", 2, 0, 1, 500] remoteexec ["server_fnc_addcriminal",2];
				[player, "You have been issued a ticket for speeding. Go to the court house to pay it off or face legal consequences.", "Silver Lake", "Ticket"] remoteExec ["server_fnc_sendMail",2];
				
				[] spawn client_fnc_speedchecked;
			};

			if(speed player > _speedLimit + 70) exitwith {
				[name player,getplayeruid player, "Silver Lake", "0", "1x Speeding, 1st degree.", 2, 0, 1, 750] remoteexec ["server_fnc_addcriminal",2];
				[player, "You have been issued a ticket for speeding. Go to the court house to pay it off or face legal consequences.", "Silver Lake", "Ticket"] remoteExec ["server_fnc_sendMail",2];["server_fnc_sendMail",2];
				
				[] spawn client_fnc_speedchecked;
			};			

		};
		//single lane out of city
		if(player distance [3167.54,1360.38,0.498352] < 35 || player distance [4975.97,4066.81,0.505142] < 35 || player distance [6318.65,6361.19,0.50675] < 35 || player distance [8897.03,5736.94,0.497887] < 35 ) then {
			
		_speedLimit = 140;
			
			if(speed player > _speedLimit + 10 && speed player <= _speedLimit + 35) exitwith {
				[name player,getplayeruid player, "Silver Lake", "0","1x Speeding, 3rd degree.", 2, 0, 1, 250] remoteexec ["server_fnc_addcriminal",2];
				[player, "You have been issued a ticket for speeding. Go to the court house to pay it off or face legal consequences.", "Silver Lake", "Ticket"] remoteExec ["server_fnc_sendMail",2];
				
				[] spawn client_fnc_speedchecked;
			};

			if(speed player > _speedLimit + 35 && speed player <= _speedLimit + 70) exitwith {
				[name player,getplayeruid player, "Silver Lake", "0", "1x Speeding, 2nd degree.", 2, 0, 1, 500] remoteexec ["server_fnc_addcriminal",2];
				[player, "You have been issued a ticket for speeding. Go to the court house to pay it off or face legal consequences.", "Silver Lake", "Ticket"] remoteExec ["server_fnc_sendMail",2];
				
				[] spawn client_fnc_speedchecked;
			};
			
			if(speed player > _speedLimit + 70) exitwith {
				[name player,getplayeruid player, "Silver Lake", "0", "1x Speeding, 1st degree.", 2, 0, 1, 750] remoteexec ["server_fnc_addcriminal",2];
				[player, "You have been issued a ticket for speeding. Go to the court house to pay it off or face legal consequences.", "Silver Lake", "Ticket"] remoteExec ["server_fnc_sendMail",2];["server_fnc_sendMail",2];
				
				[] spawn client_fnc_speedchecked;
			};		

		};
	};
};

if(vehicle player == player && client_seatwarn) then { client_seatwarn = false; 427 cutfadeout 1; };
if(vehicle player == player && client_seatbelt) then { client_seatbelt = false; 427 cutfadeout 1; };