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
    *           fn_InfosObj.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               _this call BT_fnc_InfosObj
    *
	*/

    disableSerialization;

        params[
            ["_BTSD_Ctrl", controlNull, [controlNull]],
            ["_BTSD_Index", -1, [0]]
        ];
        private _BTSD_Display       = (ctrlParent _BTSD_Ctrl);

        private _BTSD_Idc           = if (str(ctrlIDD _BTSD_Display)isEqualTo "200718") then [{
            1100
            },{
            1102
        }];

        private _BTSD_CtrlTxtInfo   = _BTSD_Display displayCtrl _BTSD_Idc;
        private _BTSD_Data          = _BTSD_Ctrl lbData _BTSD_Index;
        private _BTSD_Value         = _BTSD_Ctrl lbValue _BTSD_Index;
        private _BTSD_PixDefault    = "\A3\ui_f\data\Logos\arma3_expansion_ca.paa";
        private _BTSD_DisplayName   = Cfg_A3(getText,"cfgVehicles",_BTSD_Data,"displayName");
        private _BTSD_Picture       = Cfg_A3(getText,"cfgVehicles",_BTSD_Data,"picture");
        private _txt                = "";

        if !(toLower _BTSD_Picture isEqualTo "picturething") then {
           _BTSD_Picture = Cfg_A3(getText,"cfgVehicles",_BTSD_Data,"editorPreview");
           if (_BTSD_Picture isEqualTo "") then {
               _BTSD_Picture = _BTSD_PixDefault;
           };
        };

        _txt = parseText format ["<img align='center' size='6' image='%1'/><br/><t color='#FEFEFE' size='1' align='center' >%2<br/>%3 Rsc<t/>", _BTSD_Picture, _BTSD_DisplayName, _BTSD_Value];

        _BTSD_CtrlTxtInfo ctrlSetStructuredText _txt;

        [_BTSD_CtrlTxtInfo]call BT_fnc_HeightText;