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
    private _BTSD_BotActif = (_Flag getVariable ["BotInCity", sideUnknown]);
        missionNamespace setVariable ["GetFlag", _Flag];

    private _BTSD_SideUnit = side _unit;

        if !(_BTSD_SideFlag isEqualTo _BTSD_SideUnit) exitWith {
            hint "Tu ne peux pas utiliser les bonus d'une zone qui ne t'appartient pas.";
        };

            disableSerialization;

            if !(createDialog "BTSD_CaptureAction") exitWith {};

                private _btnGardeCity       = My_Ctrl(2407182,2401);
                private _CtrlLine           = My_Ctrl(2407182,1001);
                private _BTSD_CoutSpUnit    = Cfg_MissionInfo(getNumber,"RandProps","RessourceSpRenf");

                    _btnGardeCity ctrlRemoveEventHandler ["buttonClick", 0];
                    _btnGardeCity ctrlSetText "faire garder la ville";
                    _btnGardeCity ctrlSetTooltip format ["Coût : %1 Rsc.", _BTSD_CoutSpUnit];
                    _btnGardeCity buttonSetAction "closeDialog 0; 0=[] spawn BT_fnc_SpawnBotsInCity";

                        [_CtrlLine]call BT_fnc_GetRessource;

                        if (_BTSD_BotActif isEqualTo (side player)) then {
                            _btnGardeCity ctrlEnable FALSE;
                        };