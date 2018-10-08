disableSerialization;

enableCamShake true;
addCamShake [5, 1, 25];

_dis = 469 + round(random(100));
_dis cutRsc ["np_hudeffect","PLAIN"];

_display = uiNamespace getVariable "np_hudeffect";
_ctrl = _display displayCtrl 181818;

_w = (safezoneX+safezoneW);
_h = (safezoneY+safezoneH);

_random = round(random(4));

switch (_random) do
{
   case (0):
   {
      _ctrl ctrlsetText "np_hudeffect\blood_tr.paa";

      _ctrl ctrlSetPosition [safezoneX+safezoneW-_w, safezoneY, _w, _h];

      _ctrl ctrlcommit 0;
   }; 
   case (1):
   {
      _ctrl ctrlsetText "np_hudeffect\blood_tr.paa";

      _ctrl ctrlSetPosition [safezoneX+safezoneW-_w, safezoneY, _w, _h];

      _ctrl ctrlcommit 0;
   };
   case (2):
   {
      _ctrl ctrlsetText "np_hudeffect\blood_br.paa";

      _ctrl ctrlSetPosition [safezoneX+safezoneW-_w, safezoneY+safezoneH-_h, _w, _h];

      _ctrl ctrlcommit 0;
   };
   case (3):
   {
      _ctrl ctrlsetText "np_hudeffect\blood_tl.paa";

      _ctrl ctrlSetPosition [safezoneX, safezoneY, _w, _h];

      _ctrl ctrlcommit 0;
   };
   case (4):
   {
      _ctrl ctrlsetText "np_hudeffect\blood_bl.paa";

      _ctrl ctrlSetPosition [safezoneX, safezoneY+safezoneH-_h, _w, _h];

      _ctrl ctrlcommit 0;
   };
};
