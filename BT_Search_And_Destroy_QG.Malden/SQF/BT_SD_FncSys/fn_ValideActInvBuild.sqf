#include "..\..\DA3F_macros.hpp"
	/*
    *
    *       Project :
    *              Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_ValideActInvBuild.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/


    disableSerialization;

        params[
            ["_BTSD_Ctrl", controlNull, [controlNull]]
        ];
        private _BTSD_Display       = (ctrlParent _BTSD_Ctrl);
        private _BTSD_CtrlList      = _BTSD_Display displayCtrl 1500;
        private _BTSD_CtrlTxtInfo   = _BTSD_Display displayCtrl 1102;
        private _BTSD_Index         = lbCurSel _BTSD_CtrlList;
        private _BTSD_Data          = _BTSD_CtrlList lbData _BTSD_Index;
        private _BTSD_Value         = _BTSD_CtrlList lbValue _BTSD_Index;
        private _BTSD_PixDefault    = "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
        private _BTSD_DisplayName   = Cfg_A3(getText,"cfgVehicles",_BTSD_Data,"displayName");
        private _BTSD_Picture       = Cfg_A3(getText,"cfgVehicles",_BTSD_Data,"picture");
        private _txt                = "";

        //systemChat str [_BTSD_Ctrl,_BTSD_Display,_BTSD_CtrlList,_BTSD_Data,_BTSD_Value];

        if !(toLower _BTSD_Picture isEqualTo "picturething") then {
           _BTSD_Picture = Cfg_A3(getText,"cfgVehicles",_BTSD_Data,"editorPreview");
           if (_BTSD_Picture isEqualTo "") then {
               _BTSD_Picture = _BTSD_PixDefault;
           };
        };

        if (_BTSD_Value > Ressources) exitWith {
            hint "Ton équipe ne dispose pas d'assez de ressources pour cette action";
        };

            [player, _BTSD_Value, "del"]call BT_fnc_ressources;

        _VehQG      = [side player]call BT_fnc_SearchQG;
        _posSpObj   = _VehQG modelToWorld [0,-10, 0.1];
        _obj        = createVehicle[_BTSD_Data, [0, 0, 500], [], 0, "NONE"];

        _obj allowDamage false;

        _obj attachTo [player, [0, 2.5, 0], "Pelvis"];
        player setVariable ["MyObjBuild", _obj, FALSE];
        player setVariable ["PosObjBuild", [0,2.5,0], FALSE];
        BTSD_BuildActif = TRUE;
        hint "Alphabet , No Pavé Num. !\n\n6 = pivot\n7 = Down\n8 = Up\n9 = Poser";

        [player, _obj, format["_DA3F_Args setVariable [""SideObj"", %1, TRUE];", (side player)]] remoteExecCall ["BT_fnc_execCodeTarget", 0];
        closeDialog 0;