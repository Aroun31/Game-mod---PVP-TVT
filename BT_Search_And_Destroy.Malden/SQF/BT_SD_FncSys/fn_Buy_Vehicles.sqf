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
    *           fn_Buy_Vehicles.sqf
    *
    */

    private _BTSD_Target = cursorObject;
    if (isNull _BTSD_Target) exitWith {
        hint "Mais mais mais... T'es bourré gros !!! \n Il n'y a rien que tu ne puisse acheter face à toi";
    };

    if (_BTSD_Target isKindOf "man") exitWith {
        hint "Désolé je vends pas de viande.\nC'est pas un putain de bar à pute ni une boucherie ici...";
    };

    if (_BTSD_Target isKindOf "house") exitWith {
        hint "Ho putain !\nTu me prends pour une agence immobilère la con d'toi ?";
    };

    if (_BTSD_Target distance player > 10) exitWith {
        hint "Ho hé ho !\n Tu veux m'arnaquer ? \nRapproche toi ramassé de sous détritus";
    };


    private _group              = (group player);
    private _BTSD_getVehTeam    = _group getVariable ["MaxVehTeam", 0];
    private _BTSD_MaxVehTeam    = Cfg_MissionInfo(getNumber,"RandProps","BT_MaxVehTeam");
    private _BTSF_className     = typeOf _BTSD_Target;
    private _BTSF_SpawnMrk      = getMarkerPos "BTSD_Spawn_Vehicle";
    private _BTSF_SpawnDir      = 89;
    private _BTSD_vehicle       = objNull;
    private _BTSD_UidUnit       = "";
    private _BTSF_DisplayName   = Cfg_Veh_A3(getText,_BTSF_className,"DisplayName");
    private _BTSD_ValideBut     = false;

    if (_BTSD_getVehTeam >= _BTSD_MaxVehTeam) exitWith {
        hintSilent format["Tu crois que c'est gratis tout ça !?\nTon équipe ne dispose plus de véhicules\n%1 par team", _BTSD_MaxVehTeam];
    };
    _BTSD_ValideBut     = [format ["<t color='#FEFEFE' size='1' align='center' >Véhicule :<br/>%1<br/>Es-tu sure de vouloir le prendre ?<t/>", _BTSF_DisplayName],"Véhicule validation", "OUI", "NON"]call bis_fnc_GUImessage;

        if !(_BTSD_ValideBut) exitWith {
            hint "Ok ouai salut client de merde qui prend rien !\nEuhhh...??\nAu revoir, Bonne journée !";
        };

        _BTSD_getVehTeam = _BTSD_getVehTeam + 1;
        _group setVariable ["MaxVehTeam", _BTSD_getVehTeam, TRUE];

        _BTSD_vehicle               = _BTSF_className createVehicle [0, 0, 500];

        _checkVeh = {
            private _pos            = param[0];
            private _nearOtherVeh   = nearestObjects [_pos, ["Car", "Air", "Ship", "Armored", "Submarine", "Support", "Tank"], 5];

            if (str _nearOtherVeh isEqualTo "[]") then [{
                TRUE
                },{
                FALSE
            }];
        };

        if !([_BTSF_SpawnMrk] call _checkVeh) exitWith {
            hint "T'es con ou quoi bordel d'une pipe de pute borgne !\nC'est l'ennemi que tu dois faire péter pas nous !!! \nUn véhicule occupe le spawn";
        };

        if !(_BTSD_vehicle setVehiclePosition [_BTSF_SpawnMrk, [], 0, "CAN_COLLIDE"])exitWith {
            hint "Qu'est ce que tu as encore foutu !!? \n Tu as cassé la machine ??\n Bah moi non plus je sais pas, ha !\nBon, il est possible que un objet occupe le spawn";
        };

        _BTSD_vehicle setDir _BTSF_SpawnDir;
        _BTSD_vehicle lock 0;
        _BTSD_UidUnit   = getPlayerUID player;
        if (_BTSD_UidUnit isEqualTo "_SP_PLAYER_") then {
            _BTSD_UidUnit = profileName;
        };
        _BTSD_vehicle setVariable ["BTSD_ItsMyVeh", _BTSD_UidUnit, true];
        hint "Ton véhicule est prêt";