  /*
    *
    *       Project :
    *               Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_KeysBuild.sqf
    *
  */
_handled = [_key]spawn {
  private _obj_attached = player getVariable ["MyObjBuild", objNull];
  private _posAttach    = player getVariable ["PosObjBuild", [0, 2.5, 0]];
  private _msg          = "";
  private _InfoSys      = "6 = pivot<br/><br/>7 = Down<br/><br/>8 = Up<br/><br/>9 = Poser";
  if (isNull _obj_attached) exitWith {};

   switch (_this select 0) do
        {
          case 7: {
              detach (_obj_attached);
              _dir = (direction _obj_attached);
              _dir = _dir + 10;
              _obj_attached attachTo [player, [0, 2.5, 0 ], "Pelvis"];
              sleep 0.05;
              _obj_attached setDir (180 + _dir);
              _msg          = parseText format ["<t color='#F0F000' size='1.5' >%1<t/><br/><br/><t color='#FEFEFE' size='1' >%2<t/>", "Pivot de l'objet",_InfoSys];
              hint _msg;
            };

          case 8: {
            _axeZ   = _posAttach # 2;
            _axeZ   = _axeZ - 0.1;
            _posAttach set[2,_axeZ];
            _obj_attached attachTo [player, _posAttach, "Pelvis"];
            player setVariable ["PosObjBuild", _posAttach, FALSE];
              _msg          = parseText format ["<t color='#F0F000' size='1.5' >%1<t/><br/><br/><t color='#FEFEFE' size='1' >%2<t/>", "Objet Down",_InfoSys];
              hint _msg;
            };


          case 9: {
            _axeZ   = _posAttach # 2;
            _axeZ   = _axeZ + 0.1;
            _posAttach set[2,_axeZ];
            _obj_attached attachTo [player, _posAttach, "Pelvis"];
            player setVariable ["PosObjBuild", _posAttach, FALSE];
              _msg          = parseText format ["<t color='#F0F000' size='1.5' >%1<t/><br/><br/><t color='#FEFEFE' size='1' >%2<t/>", "Objet Up",_InfoSys];
              hint _msg;
          };

          case 10: {
            detach _obj_attached;
            BTSD_BuildActif = FALSE;
            player setVariable ["MyObjBuild", objNull, FALSE];
              _msg          = parseText format ["<t color='#F0F000' size='1.5' >%1<t/><br/><br/><t color='#FEFEFE' size='1' >%2<t/>", "Objet posé",_InfoSys];
              hint _msg;
          };
        };
    };
         _handled