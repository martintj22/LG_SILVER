_idc = ctrlIDC (_this select 0);          
_selectedIndex = _this select 1;         
_unit = player;
_item = lbData [_idc, _selectedIndex];

_current = {_x == _item} count magazines player;
if(_current == 0) exitwith {};

if (_item == "np_tequila") then { ["Remove","Karma",5000,"Stress"] call client_fnc_sustain; [] spawn client_fnc_drinkTequila; [_item,0] spawn client_fnc_removeitem; closeDialog 0; client_drunk = client_drunk + 10; };

if (_item == "NP_DrugTable") then {
	if(player distance [2687.35,1462.83,0.00144196] < 400) then {
		[] spawn client_fnc_usedrugtable; [_item,0] spawn client_fnc_removeitem; closeDialog 0;
	} else {
		["You must be near Deathfall Factory to cook meth!", true] spawn domsg;
	};
};

if (_item == "NP_GrowingPlot") then { [] spawn client_fnc_plantweed; closeDialog 0; };

if (_item == "np_water") then { ["remove","unhealthiness",1] call client_fnc_sustain; ["add","drink",100] call client_fnc_sustain; [_item,20] spawn client_fnc_removeitem; closeDialog 0; };

if (_item IN ["np_sausage","np_chickensoup","np_peasoup","np_psoup","np_beefsoup","np_lettucesoup","np_tuna"]) then { ["remove","unhealthiness",1] call client_fnc_sustain; ["add","food",100] call client_fnc_sustain; ["add","drink",10] call client_fnc_sustain;  [_item,0] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "np_groceries") then { ["add","drink",100] call client_fnc_sustain; ["add","food",100] call client_fnc_sustain; ["remove","unhealthiness",1] call client_fnc_sustain; [_item,80] spawn client_fnc_removeitem; closeDialog 0; };

//junky drink
if (_item IN ["np_coke","np_drpepper"]) then { ["add","drink",100] call client_fnc_sustain; ["add","unhealthiness",3] call client_fnc_sustain; [_item,0] spawn client_fnc_removeitem; closeDialog 0; };

if (_item IN ["np_beer"]) then { ["add","drink",50] call client_fnc_sustain; [_item,0] spawn client_fnc_removeitem; closeDialog 0; [player, 60] spawn drug_beer_effects;  client_drunk = client_drunk + 2; };

//junkfood&drink
if (_item IN 
	["np_hpizza","np_mpizza","np_cpizza","np_spizza","np_vpizza","np_happymeal","np_bigmac","np_mchicken","np_quater","np_cheeseburger","np_hamburger","np_hotdog","np_mhotdog","np_kmhotdog","np_bbqhotdog","np_cheesehotdog"]
	) then { ["add","drink",60] call client_fnc_sustain; ["add","food",60] call client_fnc_sustain; ["add","unhealthiness",10] call client_fnc_sustain;  [_item,20] spawn client_fnc_removeitem; closeDialog 0; };

if (_item IN 
	["np_chdonuts","np_jdonuts","np_cdonuts","np_donuts"]
	) then { ["add","drink",60] call client_fnc_sustain; ["add","food",60] call client_fnc_sustain; if (myjob != "cop" && myjob != "doc") then { ["add","unhealthiness",10] call client_fnc_sustain; } else { ["donuts",120] spawn client_fnc_useDrug; };  [_item,20] spawn client_fnc_removeitem; closeDialog 0; };

if (_item IN ["np_ugroceries"] ) then { ["add","drink",100] call client_fnc_sustain; ["add","food",100] call client_fnc_sustain; ["add","unhealthiness",6] call client_fnc_sustain;  [_item,80] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "ToolKit") then { [] spawn client_fnc_IEDdefuse; closeDialog 0; };

if (_item == "NP_drillitem") then { [] spawn client_fnc_bankrobbery; closeDialog 0; };

if (_item == "CG_C4") then { [] spawn client_fnc_blowdoor; closeDialog 0; };

if (_item == "CG_Dynamite") then { [] spawn client_fnc_dynamiteFishing; [_item,82] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_HackingTool") then { [] spawn client_fnc_hackdoor; closeDialog 0; };

if (_item == "CG_MetalWire") then { [] spawn client_fnc_sendhook; closeDialog 0; };

if (_item == "CG_Lockpick") then { [] spawn client_fnc_lockpick; closeDialog 0; };

if (_item == "cg_atf_bandage_i") then {  ["Healing",7,client_fnc_dohealth,player,0,["SET",0],0] spawn client_fnc_dotask2;  [_item,0] spawn client_fnc_removeitem;  closeDialog 0; };

if (_item == "CG_MethBag100") then { ["meth",18] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_MethBag90") then { ["meth",15] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_MethBag80") then { ["meth",12] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_MethBag70") then { ["meth",9] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_MethBag60") then { ["meth",6] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_MethBag50") then { ["meth",3] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_WeedBag4") then { ["marijuana",20] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_WeedBag3") then { ["marijuana",16] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_WeedBag2") then { ["marijuana",12] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_WeedBag1") then { ["marijuana",5] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_heroin") then { ["heroin",30] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_cocaine") then { ["cocaine",10] spawn client_fnc_useDrug; [_item,70] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "np_energydrink") then { ["energy",3] spawn client_fnc_useDrug; [_item,0] spawn client_fnc_removeitem; closeDialog 0; };

if (_item IN ["np_woodbarrierlongpolice","np_WoodBarrierShortPoliceLightsOn","np_TrafficConeOrange","np_WoodBarrierLongRed","np_WoodBarrierShortRedLightsOn","np_TrafficConeRed","np_MetalFenceGrey"]) then { [_item] spawn client_fnc_useBarrier;  [_item,0] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "CG_Spikes_Collapsed" && vehicle player == player) then { [] spawn client_fnc_spikestrip; [_item,0] spawn client_fnc_removeitem; closeDialog 0; };

if (_item == "NP_SatchelCharge") then { [] spawn client_fnc_ied; closeDialog 0; };

false

/*

"CG_MethBag100","CG_MethBag90","CG_MethBag80","CG_MethBag70","CG_MethBag60","CG_MethBag50"

"CG_WeedBag4","CG_WeedBag3","CG_WeedBag2","CG_WeedBag1"
"CG_Heroin"
player additem "CG_cocaine";
*/