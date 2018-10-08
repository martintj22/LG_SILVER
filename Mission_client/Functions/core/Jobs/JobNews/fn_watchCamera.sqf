

private["_textureselection","_object"];

recording = false; 

sleep 1;

recording = true;
 
hideobject neck; 
hideobject pilot; 
hideobject sometarget; 

THETV setObjectTexture [1, "#(argb,512,512,1)r2t(uavrtt,1)"]; 
 
cam = "camera" camCreate [0,0,0]; 
cam cameraEffect ["Internal", "Back", "uavrtt"]; 
cam attachTo [neck,[-0.38,0.28,0.05]]; 
 
neck attachTo [target,[0,0,0],"neck"]; 
pilot attachTo [target,[0,0,0],"pilot"]; 
  
cam camSetTarget sometarget; 
cam camSetFov 0.5; 
 
"uavrtt" setPiPEffect [0]; 
 
_pos1 = target worldToModel getPos pilot; 
_pos2 = target worldToModel getPos neck; 

_vx1 = (_pos1 select 0) - (_pos2 select 0); 
_vy1 = (_pos1 select 1) - (_pos2 select 1); 
_vz1 = (_pos1 select 2) - (_pos2 select 2); 
_dir = (_vx1 atan2 _vy1) - 25; 

_dive = (_vy1 atan2 _vz1) + 35;  
 
if ((sin _dive) == 0) then {_dive = _dive +1}; 
_tz = ((1 / sin _dive) * cos _dive);   

cam attachTo [neck,[-0.09,0.03,0.07]]; 
sometarget attachTo [neck,[0.5,10,_tz*12]]; 
cam camSetTarget sometarget; 

neck setDir _dir; 
cam camCommit 0; 





