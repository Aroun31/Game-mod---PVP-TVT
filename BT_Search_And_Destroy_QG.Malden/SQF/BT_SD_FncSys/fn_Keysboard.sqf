    /*
    *
    *       Project :
    *               Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team / Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F-BT] Aroun Le BriCodeur
    *
    *       File :
    *           fn_Keysboard.sqf
    *
    */


	params ["_control", "_key", "_shift", "_ctrl", "_alt"];

	private _DA3F_Target      = cursorObject;
	private _speed            = speed _DA3F_Target;
	private _handled          = false;
	private _mapKey           = actionKeys "ShowMap" select 0;
	private _interruptionKeys = [17,30,31,32]; //A,S,W,D
	private _WinKeysAction    = if(count (actionKeys "User10") isEqualTo 0) then [{
			    219
			  },{
			    (actionKeys "User10") select 0
			  }];

  // hintSilent format ["%1", _key]; // Verif keys



  if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18,83]) && {(player getVariable ["DA3F_isComa",false])}) exitWith {
    true;
    };

      if (_code in [83]) exitWith {
        true
      };

      if(DA3F_IsAction) exitWith {
        if(!DA3F_Stop_Action && _key in _interruptionKeys) then {DA3F_Stop_Action = true;};
        _handled;
      };

      if (BTSD_BuildActif) exitWith {
        //call BTSD_fnc_KeysBuild;
        #include "fn_KeysBuild.sqf"
      };


   switch (_key) do
        {

          case 219: {
                if (_DA3F_Target isKindOf "B_Truck_01_mover_F") then [{
                _handled = []spawn BT_fnc_QG_actionMenu;
                },{
                _handled = []spawn BT_fnc_runTranslate;
              }];

          };

        	case 21: {
            if (_shift) then [{
                hintSilent "menu joueur prochainement...\nOu pas... ça dépend si tu es sage\n\nMission by :\n\n\n* Aroun Le BriCodeur *\n{ DEV'Arma3France - BriCodeur Team }";
              },{
                //_handled = []spawn BT_fnc_Buy_Vehicles;
                //_handled = []spawn BT_fnc_ShowInvBuildVeh;
                //_handled = []spawn BT_fnc_QG_actionMenu;
            }];

        	};

          // Sound Volume
          case 8: {
            _handled = [false]call BT_fnc_SoundVolume;
          };

          case 9: {
            _handled = [true]call BT_fnc_SoundVolume;
          };

      // H | Attach Obj | Holster / recall weapon. (Shift + H)
      case 35: {

          if (!_shift && !_ctrl) then {
            if (BTSD_BuildActif) then [{

          private _obj_attached = player getVariable ["MyObjBuild", objNull];
                BTSD_BuildActif = FALSE;

              if (isNull _obj_attached) exitWith {};
                detach _obj_attached;
                player setVariable ["MyObjBuild", objNull, FALSE];
              },{
                if (isNull _DA3F_Target) exitWith {TRUE};
                if (_DA3F_Target isKindOf "man") exitWith {TRUE};
                if (_DA3F_Target isKindOf "car") exitWith {TRUE};
                if (_DA3F_Target isKindOf "air") exitWith {TRUE};
                if (_DA3F_Target distance player > 9) exitWith {TRUE};

                  private _sideObj = _DA3F_Target getVariable ["SideObj", sideUnknown];

                    if (_sideObj isEqualTo sideUnknown) exitWith {TRUE};
                    if !(_sideObj isEqualTo (side player)) exitWith {TRUE};

                      player setVariable ["MyObjBuild", _DA3F_Target, FALSE];
                      hint "6 = pivot\n7 = Down\n8 = Up\n9 = Poser";
                      BTSD_BuildActif = TRUE;
                      _DA3F_Target attachTo [player, [0, 2.5, 0], "Pelvis"];
              }];
          };

          if (_shift && !_ctrl && !(currentWeapon player isEqualTo "")) then {
              DA3F_WeaponPlayer = currentWeapon player;
              player action ["SwitchWeapon", player, player, 100];
              player switchCamera cameraView;
          };

          if (!_shift && _ctrl && !isNil "DA3F_WeaponPlayer" && {!(DA3F_WeaponPlayer isEqualTo "")}) then {
              if (DA3F_WeaponPlayer in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                  player selectWeapon DA3F_WeaponPlayer;
              };
          };
      };


    };

    _handled
