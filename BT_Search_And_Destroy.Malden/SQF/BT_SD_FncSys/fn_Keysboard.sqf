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

   switch (_key) do
        {
        	case 21: {
            if (_shift) then [{
                _handled = []spawn BT_fnc_Buy_Vehicles;
              },{
                hintSilent "menu joueur prochainement...\nOu pas... ça dépend si tu es sage";
            }];
        	};

          // Sound Volume
          case 8: {
            _handled = [false]call BT_fnc_SoundVolume;
          };
          case 9: {
            _handled = [true]call BT_fnc_SoundVolume;
          };
    };

    _handled