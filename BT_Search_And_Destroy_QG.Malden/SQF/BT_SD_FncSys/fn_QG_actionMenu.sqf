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
    *           fn_QG_actionMenu.sqf
    *
    */
        private _BTSD_Target = cursorObject;
        if (isNull _BTSD_Target) exitWith {};
        if !(_BTSD_Target isKindOf "car") exitWith {};

        if ((typeOf _BTSD_Target) == "B_Truck_01_box_F") exitWith {
            hint "Le QG doit être déployé";
        };

        if (_BTSD_Target distance player > 9) exitWith {};

        private _BTSD_SideQG = _BTSD_Target getVariable ["BTSD_SideQG", sideUnknown];

        if !(_BTSD_SideQG isEqualTo (side player)) exitWith {
            hint "Tu ne peux pas utiliser le QG de l'ennemi."
        };

            disableSerialization;
            if !(createDialog "BTSD_CaptureAction") exitWith {};
                private _BTSD_btn01       = My_Ctrl(2407182,2401);
                private _BTSD_btn02       = My_Ctrl(2407182,2402);
                private _BTSD_btn03       = My_Ctrl(2407182,2403);
                private _BTSD_btn04       = My_Ctrl(2407182,2404);

//                private _BTSD_CoutSpUnit    = Cfg_MissionInfo(getNumber,"RandProps","RessourceSpRenf");

            {
                _x ctrlShow true;
                _x ctrlRemoveEventHandler ["buttonclick", 0];
            } forEach [
                _BTSD_btn02,
                _BTSD_btn03,
                _BTSD_btn04
            ];

                _BTSD_btn01 ctrlSetText "Arsenal";
                //_BTSD_btn01 ctrlSetTooltip format ["Coût : %1 Rsc.", _BTSD_CoutSpUnit];
                _BTSD_btn01 buttonSetAction "closeDialog 0; [ ""Open"", [ true ] ] call BIS_fnc_arsenal;";

                _BTSD_btn02 ctrlSetText "Véhicules";
                //_BTSD_btn01 ctrlSetTooltip format ["Coût : %1 Rsc.", _BTSD_CoutSpUnit];
                _BTSD_btn02 buttonSetAction "closeDialog 0; [] call BT_fnc_VehicleShop;";

                _BTSD_btn03 ctrlSetText "Build";
                //_BTSD_btn01 ctrlSetTooltip format ["Coût : %1 Rsc.", _BTSD_CoutSpUnit];
                _BTSD_btn03 buttonSetAction "closeDialog 0; 0=[]spawn BT_fnc_ShowInvBuildVeh;";

                _BTSD_btn04 ctrlSetText "Replier le QG";
                //_BTSD_btn01 ctrlSetTooltip format ["Coût : %1 Rsc.", _BTSD_CoutSpUnit];
                _BTSD_btn04 buttonSetAction "closeDialog 0; [cursorObject, player] spawn BT_fnc_RepackQG;";