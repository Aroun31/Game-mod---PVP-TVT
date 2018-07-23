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
    *           fn_GetRessource.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               []call BT_fnc_GetRessource;
    *
	*/
	disableSerialization;
	private _BTSD_Ctrl 	= param[0, controlNull, [controlNull]];
	private _BTSD_Txt	= ctrlText _BTSD_Ctrl;
	_BTSD_Ctrl ctrlSetText format ["%1 %2 ressources",_BTSD_Txt, Ressources];