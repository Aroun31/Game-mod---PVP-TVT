#include "..\..\DA3F_macros.hpp"
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
    *           fn_buyWeapon.sqf
    *
    */

    disableSerialization;
    private _BTSD_Ctrl      = param[0];
    private _BTSD_Idd       = ctrlIDD(ctrlParent _BTSD_Ctrl);
    private _BTSD_Idc       = ctrlIDC _BTSD_Ctrl;
    private _BTSD_ListWp    = My_Ctrl(_BTSD_Idd,1500);
    private _BTSD_ListAmmo  = My_Ctrl(_BTSD_Idd,1501);
    private _BTSD_ListOptic = My_Ctrl(_BTSD_Idd,1502);
    private _BTSD_IndexWp   = lbCurSel _BTSD_ListWp;
    private _BTSD_IndexAm   = lbCurSel _BTSD_ListAmmo;
    private _BTSD_IndexOp   = lbCurSel _BTSD_ListOptic;
    private _class          = "";
    private _BTSD_MyWeapon  = "";
    private _wpArrMag       = [];

    switch (str _BTSD_Idc) do {

        case "1500": {
            _BTSD_MyWeapon = (currentWeapon player);
        if !(_BTSD_MyWeapon isEqualTo "") then {
            _wpArrMag     = Cfg_A3(getArray,"cfgWeapons",_BTSD_MyWeapon,"magazines");
            {
                if (_x in _wpArrMag) then {
                    player removeMagazines _x;
                };
            } forEach (magazines player);
        };
            _class = _BTSD_ListWp lbData _BTSD_IndexWp;
            player addWeapon _class;
            hint "Arme ajouté";
        };

        case "1501": {
            _class = _BTSD_ListAmmo lbData _BTSD_IndexAm;
            player addMagazine _class;
            hint "Chargeur ajouté";
        };

        case "1502": {
            _class = _BTSD_ListOptic lbData _BTSD_IndexOp;
            player addWeaponItem [(currentWeapon player), _class];
            hint "Optic ajouté";
        };

    };