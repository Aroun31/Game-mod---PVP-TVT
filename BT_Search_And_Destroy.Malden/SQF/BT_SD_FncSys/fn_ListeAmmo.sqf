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
    *           fn_ListeAmmo.sqf
    *
    */
    private _weapon     = "";
    private _BTSD_index = -1;
    private _BTSD_idx = lbCurSel ListeWeapons;

    private _weapon   = ListeWeapons lbData _BTSD_idx;

      if (_weapon isEqualTo "") exitWith {};

    private _BTSD_MagAssom     = getArray(missionConfigFile >> "BTSD_Cfg_Mission" >> "BTSD_Cfg_Stuff" >> "AmmoAssom");

        _wpAmmo     = Cfg_A3(getArray,"cfgWeapons",_weapon,"magazines");

        lbClear ListeAmmo;
        {
            _wpAmmoName     =  Cfg_A3(getText,"cfgMagazines",_x,"displayName");

            if (_x in _BTSD_MagAssom) then [{
              _BTSD_AmmoAssom = Cfg_A3(getText, "cfgMagazines",_x,"ammo");
              _val = ((count _wpAmmoName) - 8);
              _BTSD_index = ListeAmmo lbAdd format ["Balles assommante %1", (_wpAmmoName select [_val])];
                ListeAmmo lbSetColor [_BTSD_index,[1,0.7,0.05,1]];
            },{
              _BTSD_index     = ListeAmmo lbAdd _wpAmmoName;
          }];

            ListeAmmo lbSetData [_BTSD_index, _x];
            ListeAmmo lbSetValue [_BTSD_index, (_foreachindex + 1)];
        } forEach _wpAmmo;