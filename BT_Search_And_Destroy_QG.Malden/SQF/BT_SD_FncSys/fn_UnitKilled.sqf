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
    *           fn_UnitKilled.sqf
    *
	*/

		params ["_unit", "_killer", "_instigator", "_useEffects"];
			systemChat format ["- %1 - | - %2 -", _unit, _killer];
/*
            _killer setVariable ["BT_Rec_Weapons", (weapons _killer), TRUE];
            removeAllWeapons _killer;
*/
            // _killer setDamage 1;

        private _AddRessource = Cfg_MissionInfo(getNumber,"RandProps","BT_RessByKill");

        [_killer, _AddRessource, "add"]call BT_fnc_ressources;