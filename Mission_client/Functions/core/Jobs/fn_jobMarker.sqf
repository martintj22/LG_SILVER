_pos = _this select 0;

if(myjob == "Cop") then { 
/*
    _type1 = nearestObject [_pos,"Land_Coffee_DED_Coffee_02_F"];
    _type2 = nearestObject [_pos,"Land_Coffee_DED_Coffee_01_F"];
    _type3 = nearestObject [_pos,"Land_buildingCommercial2"];
    _type4 = nearestObject [_pos,"Land_buildingCommercial1"];

    _type1 = _pos distance (getpos _type1);
    _type2 = _pos distance (getpos _type2);
    _type3 = _pos distance (getpos _type3);
    _type4 = _pos distance (getpos _type4);


    if( (_type1 < _type3 && _type1 < _type4) || _type2 < _type3 && _type2 < _type4 ) then  {  
        [_pos,"Store Robbery","Location"] spawn client_fnc_hudHelper; 
	    [format["There is a store robbery at %1!",mapGridPosition getPos player], false] remoteExec ["domsg",currentCop];
    } else { 
        [_pos,"Store Robbery","Location"] spawn client_fnc_hudHelper;   
	    [format["There is a store robbery at %1!",mapGridPosition getPos player], false] remoteExec ["domsg",currentCop];
    };
*/

} else {
    
    _markername = format["job%1",getPlayerUID player];
    deletemarkerlocal _markername;
    _marker = createMarkerlocal [_markername, _pos];
    _marker setMarkerShapelocal "ICON";
    _marker setMarkerTypelocal "hd_dot";
    _marker setMarkerColorlocal "ColorOrange";
    _marker setMarkerTextlocal "Tasked Location";
    
     [_pos,"Job Task","Job"] spawn client_fnc_hudHelper;
     
};
