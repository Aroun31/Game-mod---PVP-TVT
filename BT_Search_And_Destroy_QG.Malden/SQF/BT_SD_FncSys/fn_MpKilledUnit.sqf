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
    *           fn_MpKilledUnit.sqf
    *
    *       DESCRIPTION :
    *               Event kill !
    *				Ajout de point à la team killer
    *
	*/

		params ["_unit", "_killer", "_instigator", "_useEffects"];

		if !((vehicle _killer) isEqualTo (vehicle player)) exitWith {};

			private _BTSD_Mrk_Hosto = Cfg_MissionInfo(getText,"RandProps","HospitalMarker");

			(format ["info retour MP killed :",nil]) remoteExecCall ["systemChat"];
			(format ["script exec sur : %1",name player]) remoteExecCall ["systemChat"];
			(format ["_unit : %1",name _unit]) remoteExecCall ["systemChat"];
			(format ["_killer : %1",name _killer]) remoteExecCall ["systemChat"];