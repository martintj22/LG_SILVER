/*
Pack Logs trees by koil
*/

	if( vehSpawned distance player > 15 || isNil {vehSpawned} || isnull vehSpawned ) exitwith { ["Your truck is too far away!", true] spawn domsg; }; 
	if(totalLogs == 23) exitwith { ["Load is full!", true] spawn domsg; };
	mylog = createVehicle ["vvv_tronco", position player, [], 0, "NONE"];

	totalLogs = totalLogs + 1;

	if(totalLogs == 1) exitwith {
		mylog attachTo [vehspawned, [-1, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 2) exitwith {
		mylog attachTo [vehspawned, [-0.5, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 3) exitwith {	
		mylog attachTo [vehspawned, [0, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 4) exitwith {	
		mylog attachTo [vehspawned, [0.5, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 5) exitwith {
		mylog attachTo [vehspawned, [1, -3.5, 1.3] ];mylog setdir 90;
	};
	if(totalLogs == 6) exitwith {
		mylog attachTo [vehspawned, [-0.8, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 7) exitwith {
		mylog attachTo [vehspawned, [-0.3, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 8) exitwith {
		mylog attachTo [vehspawned, [0.3, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 9) exitwith {
		mylog attachTo [vehspawned, [0.8, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 10) exitwith {
		mylog attachTo [vehspawned, [-1, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 11) exitwith {
		mylog attachTo [vehspawned, [-0.5, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 12) exitwith {
		mylog attachTo [vehspawned, [0, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 13) exitwith {
		mylog attachTo [vehspawned, [0.5, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 14) exitwith {
		mylog attachTo [vehspawned, [1, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 15) exitwith {
		mylog attachTo [vehspawned, [-0.8, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 16) exitwith {
		mylog attachTo [vehspawned, [-0.3, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 17) exitwith {
		mylog attachTo [vehspawned, [0.3, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 18) exitwith {
		mylog attachTo [vehspawned, [0.8, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 19) exitwith {
		mylog attachTo [vehspawned, [-1, -3.5, 2.5] ]; mylog setdir 90;
	};
	if(totalLogs == 20) exitwith {
		mylog attachTo [vehspawned, [-0.5, -3.5, 2.5] ]; mylog setdir 90;
	};
	if(totalLogs == 21) exitwith {
		mylog attachTo [vehspawned, [0, -3.5, 2.5] ]; mylog setdir 90;
	};
	if(totalLogs == 22) exitwith {
		mylog attachTo [vehspawned, [0.5, -3.5, 2.5] ];mylog setdir 90;
	};
	if(totalLogs == 23) exitwith {
		mylog attachTo [vehspawned, [1, -3.5, 2.5] ]; mylog setdir 90;
	};