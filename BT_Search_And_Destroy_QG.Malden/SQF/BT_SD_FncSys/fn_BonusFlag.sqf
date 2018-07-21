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
    *           fn_ActionFlag.sqf
    *
    */

    params ["_Flag", "_unit", "_actionId", "_arguments"];

    private _BTSD_SideFlag = _Flag getVariable ["FlagSide", sideUnknown];
    private _BTSD_SideUnit = side _unit;

        if !(_BTSD_SideFlag isEqualTo _BTSD_SideUnit) exitWith {
            hint "Tu ne peux pas utiliser les bonus d'une zone qui ne t'appartient pas.";
        };



    /*
    this addAction ["<t color='#00FE00' size='1' >Capturer la ville<t/>",BT_fnc_CaptureArea, ["BTSD_Mrk_Capture_01"], 9999, true, false, "", "!(isNull _target) && (_target distance _this < 6)"];

    this addAction ["<t color='#00FE00' size='1' >Bonus<t/>",{hint str((_this select 0) getVariable ["FlagSide", sideUnknown])}, [""], 9998, false, false, "", '_var = _this getVariable "FlagSide";(!isNull _target) && (_target distance _this < 6) && _var == (side _target)']; //  && {(_var == (side _target))}*/
