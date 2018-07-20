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
    *           fn_WeaponShop.sqf
    *
    */

    disableSerialization;
    if !(createDialog "BTSD_Weapon_Shop") exitWith {};
        hint "Simple clic sur une arme pour voir les munitions\n\nDouble clic sur l'article pour l'ajouter";
    private _BTSD_Class         = []call BT_fnc_SelectCamps;
    //private _BTSD_Class         = (group player) getVariable ["BTSD_Camps", []];
    _BTSD_Class                 = _BTSD_Class param[1];

    private _BTSD_ArrWeapons    = getArray(missionConfigFile >> "BTSD_Cfg_Mission" >> _BTSD_Class >> "Weapons");

    private _BTSD_ArrOptics     = getArray(missionConfigFile >> "BTSD_Cfg_Mission" >> _BTSD_Class >> "Optics");
    systemChat format ["Shop : %1", _BTSD_Class];
    private _BTSD_index = -1;

    {
        _wpName     = Cfg_A3(getText, "cfgWeapons",_x,"displayName");
        _BTSD_index = ListeWeapons lbAdd _wpName;
        ListeWeapons lbSetData [_BTSD_index, _x];
        ListeWeapons lbSetValue [_BTSD_index, (_foreachindex + 1)];
    } forEach _BTSD_ArrWeapons;

    {
        _wpName     = Cfg_A3(getText, "cfgWeapons",_x,"displayName");
        _BTSD_index = ListeOptics lbAdd _wpName;
        ListeOptics lbSetData [_BTSD_index, _x];
        ListeOptics lbSetValue [_BTSD_index, (_foreachindex + 1)];
    } forEach _BTSD_ArrOptics;