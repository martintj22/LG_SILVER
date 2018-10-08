//gun crate setup, run locally.
// write a medic crate setup.
[] spawn { 

_pos = getpos player; 
    
_class = 
[ 
    "hgun_mas_ww2_acp_F", 
    "hgun_Pistol_heavy_01_F", 
    "hgun_ACPC2_F", 
    "hgun_mas_ww2_bhp_F", 
    "sab_1911_handgun", 
    "CUP_hgun_Compact", 
    "hgun_mas_ww2_lug_F", 
    "CUP_hgun_Makarov", 
    "CUP_hgun_PB6P9", 
    "CUP_hgun_M9", 
    "CUP_hgun_TaurusTracker455", 
    "hgun_mas_ww2_tt33_F", 
    "RH_uspm", 
    "RH_kimber", 
    "RH_fn57", 
    "RH_fnp45", 
    "RH_Deagleg", 
    "RH_Deagles", 
    "CUP_hgun_MicroUzi", 
    "CUP_hgun_SA61", 
    "RH_g18", 
    "RH_tec9", 
    "RH_muzi",          
    "CUP_smg_bizon", 
    "arifle_mas_ww2_tommy", 
    "arifle_mas_ww2_mp40", 
    "arifle_mas_ww2_ppsh", 
    "arifle_mas_ww2_sten", 
    "CUP_srifle_CZ550_rail", 
    "arifle_mas_ww2_kar98", 
    "CUP_srifle_LeeEnfield_rail", 
    "arifle_mas_ww2_m1g", 
    "arifle_mas_ww2_mos", 
    "CUP_sgun_AA12", 
    "CUP_lmg_Mk48_des", 
    "CUP_launch_RPG7V", 
    "CUP_glaunch_6G30", 
    "CUP_hgun_MicroUzi", 
    "CUP_hgun_SA61", 
    "RH_g18", 
    "RH_tec9", 
    "RH_muzi"       
]; 
  
    _amount = 50;
    while {_amount > 0} do {
            _class_gun = selectRandom _class; 
            _pos1 = (_pos select 0) + random (5000); 
            _pos2 = (_pos select 1) + random (5000); 
          
            _markerstr = createMarker [format["openfire%1",_pos1], [_pos1,_pos2]]; 
            _markerstr setMarkerShape "ICON"; 
            _markerstr setMarkerType "hd_dot"; 
            _markerstr setmarkertext "Crate drop"; 
          
            _luckisaskill = "plp_ct_woodboxlightbig" createVehicle [_pos1,_pos2,0]; 
          
            _luckisaskill addWeaponCargoGlobal [_class_gun, 1]; 
            _magazines = getArray (configFile >> "CfgWeapons" >> _class_gun >> "magazines"); 
          

                _magazineClass = _magazines select 0; 
                _luckisaskill addMagazineCargoGlobal [_magazineClass, 50]; 
        uisleep 0.25;
        _amount = _amount - 1;
    };

};








[] spawn { 

 _pos = getpos player;  
 _class = [ 
 
  ["VVV_Fortransi_civ",8900],  
  ["VVV_Alfa_Romeo_59",9900],  
  ["VVV_Alfa_Romeo_Spider_Duetto",9900],  
  ["VVV_Chevrolet_Blazer",9999],  
  ["VVV_Audi_RS6_Avant_C6",14000],  
  ["vvv_Chevrolet_Impala",15900],  
  ["ivory_gt500",22000],  
  ["VVV_Audi_A4",24000],  
  ["VVV_Audi_Q7",24000],  
  ["vvv_DOD_RamSRT_civ",24000],  
  ["VVV_Cadillac_DTS",31000],  
  ["VVV_Aston_Martin_DB9",32000],  
  ["VVV_Cadillac_Escalade",32000],  
  ["ivory_evox",35000],  
  ["VVV_Cadillac_CTSV",35000],  
  ["VVV_Chevrolet_Cone0",36000],  
  ["VVV_Aston_Martin_Rapide",36000],  
  ["ivory_supra",37000],  
  ["ivory_r34",39000], 
  ["VVV_Aston_Martin_DB5",42000], 
  ["ivory_wrx",46000], 
  ["ivory_m3",46000],  
  ["VVV_Cadillac_XLR_V",46000],  
  ["ivory_c",59000],  
  ["ivory_elise",59000],   
  ["VVV_Bentley_Arnage",75000], 
  ["ivory_isf",75000],   
  ["VVV_Bentley_Continental_SS",75000],  
  ["VVV_Chevrolet_Corvette_Cone",100000],  
  ["VVV_audi_r8",120000],  
  ["VVV_Audi_TT_RS_Coupe",120000],  
  ["ivory_supra_topsecret",140000],  
  ["ivory_lfa",165000], 
  ["ivory_mp4",195000], 
  ["ivory_veyron",290000], 
  ["ivory_f1",450000] 
 ];  
    _amount = 25;
    while {_amount > 0} do {
            _class_gun = selectRandom _class; 
            _pos1 = (_pos select 0) + random (5000); 
            _pos2 = (_pos select 1) + random (5000); 
          
         
            _class createVehicle [_pos1,_pos2,0]; 
            uisleep 0.25;
            _amount = _amount - 1;
    };
};



















//create ending point - run on server
      
deletemarker "theend";
_buildings = nearestobjects [[6352.47,3591.94,0.00143886],["house"],6300];
_theendposition = _buildings call BIS_FNC_SELECTRANDOM; 
markerstr = createMarker ["TheEnd", _theendposition];  
markerstr setMarkerShape "circle";  
markerstr setMarkerSize [5000,5000]; 
markerstr setmarkercolor "ColorGreen";



//start the battle, run on all clients.
[] spawn {



    player setvariable ["sync",0,true]; [] spawn client_fnc_fullheal; ["add","drink",100] call client_fnc_sustain; ["add","food",100] call client_fnc_sustain;



    activatedGamemode = true;
    defaultDistance = 5000;
    dicklord = false;
    ["The round begins in 5 minutes - you must stay close to the ENDING MARKER or you will die", true] spawn domsg;
    uisleep 300;



    while{activatedGamemode} do {
        uisleep 180;
        defaultDistance = defaultDistance - 1000;
        if(player distance getmarkerpos "theend" > defaultdistance) then { 
            if(player distance getmarkerpos "theend" > 1000) then { 
                [] spawn { ["You are taking extra damage", true] spawn domsg;
                    uisleep 20; 
                    ["Remove",0.25] call Client_Fnc_DoHealth; 
                    ["You are taking extra damage", true] spawn domsg; 
                    uisleep 20; 
                    ["Remove",0.25] call Client_Fnc_DoHealth; 
                    ["You are taking extra damage", true] spawn domsg; 
                    uisleep 20; 
                    ["Remove",0.25] call Client_Fnc_DoHealth; 
                }; 
            }; 
            [] spawn { 
                ["You are taking extra damage", true] spawn domsg; 
                uisleep 60; 
                ["Remove",0.25] call Client_Fnc_DoHealth; 
                ["You are taking extra damage", true] spawn domsg; 
                uisleep 60; 
                ["Remove",0.25] call Client_Fnc_DoHealth; 
            };
        };


        if(defaultdistance < 100) then { 

            if(dicklord = false) then { dicklord = true; 
               [] spawn {
                    while{activatedGamemode} do {
                        uisleep 30;
                        ["Remove",0.25] call Client_Fnc_DoHealth;
                        ["You are taking extra damage", true] spawn domsg;
                    };
               };
            };


        defaultdistance = 40; ["Remove",0.15] call Client_Fnc_DoHealth; };

        [format["You must be %1 distance from the marker - you are %2 distance from it",defaultdistance, player distance getmarkerpos "theend"], true] spawn domsg;
        if(deadplayer) exitwith { "Sign_Circle_F" createvehicle getpos player; };
    };

    ["Game Ended", true] spawn domsg;


};













 _civveh = [ 
 
  ["VVV_Fortransi_civ",8900],  
  ["VVV_Alfa_Romeo_59",9900],  
  ["VVV_Alfa_Romeo_Spider_Duetto",9900],  
  ["VVV_Chevrolet_Blazer",9999],  
  ["VVV_Audi_RS6_Avant_C6",14000],  
  ["vvv_Chevrolet_Impala",15900],  
  ["ivory_gt500",22000],  
  ["VVV_Audi_A4",24000],  
  ["VVV_Audi_Q7",24000],  
  ["vvv_DOD_RamSRT_civ",24000],  
  ["VVV_Cadillac_DTS",31000],  
  ["VVV_Aston_Martin_DB9",32000],  
  ["VVV_Cadillac_Escalade",32000],  
  ["ivory_evox",35000],  
  ["VVV_Cadillac_CTSV",35000],  
  ["VVV_Chevrolet_Cone0",36000],  
  ["VVV_Aston_Martin_Rapide",36000],  
  ["ivory_supra",37000],  
  ["ivory_r34",39000], 
  ["VVV_Aston_Martin_DB5",42000], 
  ["ivory_wrx",46000], 
  ["ivory_m3",46000],  
  ["VVV_Cadillac_XLR_V",46000],  
  ["ivory_c",59000],  
  ["ivory_elise",59000],   
  ["VVV_Bentley_Arnage",75000], 
  ["ivory_isf",75000],   
  ["VVV_Bentley_Continental_SS",75000],  
  ["VVV_Chevrolet_Corvette_Cone",100000],  
  ["VVV_audi_r8",120000],  
  ["VVV_Audi_TT_RS_Coupe",120000],  
  ["ivory_supra_topsecret",140000],  
  ["ivory_lfa",165000], 
  ["ivory_mp4",195000], 
  ["ivory_veyron",290000], 
  ["ivory_f1",450000] 
 ];  _spawnedCar = _civveh call BIS_FNC_SELECTRANDOM; 
 
 _spawnedCar = (_spawnedCar select 0) createvehicle getpos player;












