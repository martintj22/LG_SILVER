_dummy = "C_man_polo_2_F" createVehicleLocal [9818.83,1079.16,0.00126028]; 
_dummy setpos [9825.3,1085.3,0];
client_kcCamera  = "CAMERA" camCreate (getPos player);   
showCinemaBorder true;    
client_kcCamera cameraEffect ["EXTERNAL", "BACK"];                              
client_kcCamera camSetPos [9824.32,1083.3,1];   
client_kcCamera camSetFOV 0.99;   
  
client_kcCamera camCommit 0; 
uisleep 0.25; 
deletevehicle _dummy; 
 
cockbag = "C_man_polo_2_F" createVehicleLocal [9819.32,1079.66,0.0015521];   
cockbag setdir 90;   
cockbag setpos [9826.3,1085.3,0];

if(isNil "dialog_open") then { dialog_open = true; };
dialog_open = true;
while{dialog_open} do { uisleep 0.05; cockbag setdir ((getdir cockbag) + 5); };