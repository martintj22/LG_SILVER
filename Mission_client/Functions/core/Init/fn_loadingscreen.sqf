"colorCorrections" ppEffectEnable true;     
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 1.0], [0, 0, 0, 1],  [0, 0, 0, 0.0]];  

"colorCorrections" ppEffectCommit 0; 

while {true} do {
	if(!(isNil "charselection")) exitwith { 		
		6969 cutRsc ["client_loading","PLAIN"];
		uisleep 3;  
	};
	if(  ((player getvariable "loaded") == 3) ) exitwith { 	
		6969 cutRsc ["client_loading","PLAIN"];
		uisleep 3; 
	};

	if(  ((player getvariable "loaded") == 4) ) exitwith { 	
		6969 cutRsc ["client_loading","PLAIN"];
		uisleep 3; 
	};

	6969 cutRsc ["client_loading","PLAIN"];
	uisleep 3;
};	
player setVariable["loaded", 4, false];
"colorCorrections" ppEffectEnable true;     
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [0, 0, 0, 1],  [0, 0, 0, 0.0]];   
"colorCorrections" ppEffectCommit 15; 



