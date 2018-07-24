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
    *           fn_ActionFlag.sqf
    *
    */

    params ["_Flag", "_unit", "_actionId", "_arguments"];

    private _BTSD_SideFlag = (_Flag getVariable ["FlagSide", []])param[0];

    private _BTSD_SideUnit = side _unit;

        if !(_BTSD_SideFlag isEqualTo _BTSD_SideUnit) exitWith {
            hint "Tu ne peux pas utiliser les bonus d'une zone qui ne t'appartient pas.";
        };
/*
            hint "Aucun bonus n'est disponible pour le moment.\n\nIl sera possible de faire l'achat de troupe pour garder la ville capturé.\nSi tu as des idées de bonus ou souhaites participer prends contact sur le TS indiqué sur la map.\n\n\nBon jeu sur :\n\nSearch & Destroy QG";
*/
            disableSerialization;
            if !(createDialog "BTSD_CaptureAction") exitWith {};
                private _btnGardeCity       = My_Ctrl(2407182,2401);
                private _BTSD_CoutSpUnit    = Cfg_MissionInfo(getNumber,"RandProps","RessourceSpRenf");

                _btnGardeCity ctrlSetText "faire garder la ville";
                _btnGardeCity ctrlSetTooltip format ["Coût : %1 Rsc.", _BTSD_CoutSpUnit];
                _btnGardeCity buttonSetAction "0=[] spawn BT_fnc_SpawnBotsInCity";


    /*
    this addAction ["<t color='#00FE00' size='1' >Capturer la ville<t/>",BT_fnc_CaptureArea, ["BTSD_Mrk_Capture_01"], 9999, true, false, "", "!(isNull _target) && (_target distance _this < 6)"];

    this addAction ["<t color='#00FE00' size='1' >Bonus<t/>",{hint str((_this select 0) getVariable ["FlagSide", sideUnknown])}, [""], 9998, false, false, "", '_var = _this getVariable "FlagSide";(!isNull _target) && (_target distance _this < 6) && _var == (side _target)']; //  && {(_var == (side _target))}*/