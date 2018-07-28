#include "..\..\DA3F_macros.hpp"
	/*
    *
    *       Project :
    *              Alice Project / °Opérations° / Community FR / Search & Destroy
    *
    *       Team   :
    *               BriCodeur Team Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_msgTranslateRecu.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
	*/

		private _BTSD_ArrConv 	= param[0, [], [[]]];
		private _BTSD_txt 		= "";
		private _BTSD_translate = "";

	    	{
	    		_translate = GetXML(_x);
	    		_BTSD_txt = _BTSD_txt + format ["%1%2", " ", _BTSD_translate];
	    	} forEach _BTSD_ArrConv;

	hint _BTSD_txt;